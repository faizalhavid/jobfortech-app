import 'package:get/get.dart';

import 'package:jobfortech/app/modules/Auth/controllers/forgot_password_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
