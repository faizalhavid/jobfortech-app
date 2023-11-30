import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech2/app/modules/Auth/views/welcome_user_view.dart';
import 'package:jobfortech2/app/modules/Dashboard/views/navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobfortech2/components/AppToast/index.dart';

class LoginController extends GetxController {
  var email = TextEditingController();
  var password = TextEditingController();
  final authController = Get.put(AuthController());
  final userRepo = UserRepository();
  final secureStorage = const FlutterSecureStorage();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
  }

  void logging(GlobalKey<FormState> formKey) async {
    var connection = await authController.checkConnection();
    if (connection) {
      if (formKey.currentState!.validate()) {
        try {
          await userRepo.login(
            email: email.text,
            password: password.text,
          );

          Get.offAll(() => NavigationView());
        } catch (e) {
          print(e);
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

  void loginGoogle() async {
    try {
      EasyLoading.show(status: 'Loading...');
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication googleAuth = await account.authentication;
        String? accessToken = googleAuth.accessToken;
        if (accessToken != null) {
          await userRepo.loginWithGoogle(accessToken);
          EasyLoading.dismiss();
          Get.offAll(() => NavigationView());
        }
      } else {
        print('Google sign-in was cancelled');
      }
    } catch (error) {
      print('google error : $error');
      EasyLoading.dismiss();
      AppToast(message: 'Something went wrong');
    }
  }
}
