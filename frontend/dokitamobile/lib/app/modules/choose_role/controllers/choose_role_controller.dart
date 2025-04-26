import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dokitamobile/app/routes/app_pages.dart';
import 'package:dokitamobile/app/services/storage_service.dart';

class ChooseRoleController extends GetxController {
  RxBool isPatientVisible = false.obs;
  RxBool isMedecinVisible = false.obs;

  void chooseRole(String role) {
    StorageService.setUserRole(role: role);
    Get.toNamed(Routes.REGISTER_STEP);
  }

  @override
  void onInit() {
    super.onInit();
    // Déclencher les animations avec délai
    Future.delayed(Duration(milliseconds: 200), () {
      isPatientVisible.value = true;
    });
    Future.delayed(Duration(milliseconds: 500), () {
      isMedecinVisible.value = true;
    });
  }
}
