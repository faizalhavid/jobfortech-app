import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/navigation.dart';

class LoginController extends GetxController {
  var email = TextEditingController();
  var password = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  void onClose() {
    email.dispose();
    password.dispose();
  }

  Future<User?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        Get.offAll(() => NavigationView());
      } else {
        Get.snackbar(
          'Error',
          'User login failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Get.snackbar(
          'Error',
          'Email and password invalid',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      return null;
    }
  }

  void logging(GlobalKey<FormState> formKey) async {
    var connection = await authController.checkConnection();
    if (connection) {
      print('${email.text} ${password.text}');
      if (formKey.currentState!.validate()) {
        User? user = await loginWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
      }
    }
  }
}
