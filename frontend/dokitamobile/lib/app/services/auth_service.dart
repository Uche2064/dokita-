import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final box = GetStorage();
  final _dio = Dio(BaseOptions(baseUrl: "http://127.0.0.1:8000/api"));

  String? get token => box.read('accessToken');

  bool get isLoggedIn => token != null;

  Future<void> saveToken(String accessToken) async {
    await box.write('accessToken', accessToken);
  }

  Future<void> clearToken() async {
    await box.remove('accessToken');
  }

  Future<bool> checkAuth() async {
    if (token == null) return false;

    try {
      final response = await _dio.get(
        "/me", // <-- Ajuste selon ton endpoint pour vérifier le user
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        await clearToken();
        return false;
      }
    } catch (e) {
      await clearToken();
      return false;
    }
  }

  void logout() async {
    await clearToken();
    Get.offAllNamed(Routes.LOGIN);
  }
}
