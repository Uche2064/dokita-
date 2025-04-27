import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/choose_role/views/choose_role_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/register_step/views/register_step_view.dart';
import '../modules/choose_role/bindings/choose_role_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/register_step/bindings/register_step_binding.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_ROLE,
      page: () => ChooseRoleView(),
      binding: ChooseRoleBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP,
      page: () => RegisterStepView(),
      binding: RegisterStepBinding(),
    ),
  ];
}
