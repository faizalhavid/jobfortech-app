import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';

class ForgotPasswordController extends GetxController {
  var authController = Get.find<AuthController>();
  var email = TextEditingController();
  RxBool verifiedEmail = true.obs;
  RxBool resendEmail = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
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

  Future<void> sendResetPasswordEmail(GlobalKey<FormState> keyForm) async {
    var connection = await authController.checkConnection();
    try {
      if (keyForm.currentState!.validate()) {
        if (connection) {
          final sendEmailReset = await auth.sendPasswordResetEmail(
            email: email.text,
          );
          verifiedEmail.value = false;
          startCountdown(10);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
