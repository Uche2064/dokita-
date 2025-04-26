import 'package:get/get.dart';
import 'package:dokitamobile/app/routes/app_pages.dart';
import 'package:dokitamobile/app/services/auth_service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    verifySession();
  }

  void verifySession() async {
    final isAuthenticated = await AuthService.to.checkAuth();
    if (!isAuthenticated) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
