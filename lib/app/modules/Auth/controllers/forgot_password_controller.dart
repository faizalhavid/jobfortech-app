import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';

class ForgotPasswordController extends GetxController {
  var authController = Get.find<AuthController>();
  var email = TextEditingController();
  RxBool verifiedEmail = true.obs;
  RxBool resendEmail = false.obs;

  RxInt countdownValue = 0.obs;

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
}
