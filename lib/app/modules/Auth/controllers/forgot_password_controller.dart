import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var email = TextEditingController();
  RxBool verifiedEmail = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendResetPasswordEmail() async {
    try {
      //final sendEmail = await auth.sendPasswordResetEmail(email: email.text);
      verifiedEmail.value = !verifiedEmail.value;
      // verifiedEmail.value = true;
      print(verifiedEmail.value);
    } catch (e) {
      print(e);
    }
  }
}
