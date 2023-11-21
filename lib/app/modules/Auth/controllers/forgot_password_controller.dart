import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech2/components/AppToast/index.dart';

class ForgotPasswordController extends GetxController {
  var authController = Get.find<AuthController>();
  var email = TextEditingController();
  RxBool verifiedEmail = true.obs;
  RxBool resendEmail = false.obs;
  RxInt countdownValue = 0.obs;
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  RxBool eyeIconPassword = true.obs;
  RxBool eyeIconConfirmPassword = true.obs;

  void startCountdown(int durationInSeconds) {
    countdownValue.value = durationInSeconds;

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownValue.value == 0) {
        timer.cancel();
        resendEmail.value = true;
      } else {
        resendEmail.value = false;
        countdownValue.value--;
      }
    });
  }

  void handleChangePassword(
      GlobalKey<FormState> formKey, String user_uuid, String user_id) async {
    if (formKey.currentState!.validate()) {
      try {
        EasyLoading.show(status: 'Loading...');
        await UserRepository().changeForgotPassword(
          password: password.text,
          confirmPassword: confirmPassword.text,
          string_activation: user_uuid,
          user_id: user_id,
        );
        AppToast(message: 'Password changed successfully');
        Get.toEnd(() => LoginView());
        EasyLoading.dismiss();
      } catch (e) {
        EasyLoading.dismiss();
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
