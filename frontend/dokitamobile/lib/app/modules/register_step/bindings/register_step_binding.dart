import 'package:get/get.dart';

import '../controllers/register_step_controller.dart';

class RegisterStepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStepController>(
      () => RegisterStepController(),
    );
  }
}
