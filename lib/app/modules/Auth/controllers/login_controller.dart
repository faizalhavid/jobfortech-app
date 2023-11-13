import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech2/app/modules/Dashboard/views/navigation.dart';

class LoginController extends GetxController {
  var email = TextEditingController();
  var password = TextEditingController();
  final authController = Get.put(AuthController());
  final userRepo = UserRepository();
  final secureStorage = FlutterSecureStorage();

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
          User user = await userRepo.login(
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
}
