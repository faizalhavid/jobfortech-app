import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';

import '../../../data/models/User.dart';

class RegisterController extends GetxController {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }

  // Future<User?> registerWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     final sendEmailVerify =
  //         await userCredential.user!.sendEmailVerification();
  //     authController.emailVerifySuccess.value = true;

  //     EasyLoading.showToast(
  //       'Register Success ! Please Login',
  //       toastPosition: EasyLoadingToastPosition.bottom,
  //       duration: Duration(seconds: 2),
  //     );
  //     Get.offAll(() => EmailVerifyView());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'email-already-in-use') {
  //       Get.dialog(
  //         AlertDialog(
  //           title: Text('Email already in use'),
  //           content: Text('Do you want Login?'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Get.to(() => LoginView());
  //               },
  //               child: Text('OK'),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 Get.back();
  //               },
  //               child: Text('Cancel'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     Get.dialog(
  //       AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Something went wrong , please try again'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: Text('OK'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: Text('Cancel'),
  //           ),
  //         ],
  //       ),
  //     );
  //     print('An error occurred while registering: $e');
  //   }
  //   return null;
  // }

  void registering(GlobalKey<FormState> formKey) async {
    final UserRepository userRepo = UserRepository();
    final User userModel = User(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
    );
    var connection = await authController.checkConnection();

    if (connection) {
      try {
        if (formKey.currentState!.validate()) {
          final user = await userRepo.register(
            email: email.text,
            password: password.text,
            password2: confirmPassword.text,
            firstName: firstName.text,
            lastName: lastName.text,
          );

          print('success register');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
