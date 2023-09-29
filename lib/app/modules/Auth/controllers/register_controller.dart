import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:jobfortech/app/modules/Auth/views/email_verify_view.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech/services/Firebase_Database.dart';

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

  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final sendEmailVerify =
          await userCredential.user!.sendEmailVerification();
      authController.emailVerifySuccess.value = true;

      EasyLoading.showToast(
        'Register Success ! Please Login',
        toastPosition: EasyLoadingToastPosition.bottom,
        duration: Duration(seconds: 2),
      );
      Get.offAll(() => EmailVerifyView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.dialog(
          AlertDialog(
            title: Text('Email already in use'),
            content: Text('Do you want Login?'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.to(() => LoginView());
                },
                child: Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title: Text('Error'),
          content: Text('Something went wrong , please try again'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      );
      print('An error occurred while registering: $e');
    }
    return null;
  }

  void registering(GlobalKey<FormState> formKey) async {
    var connection = await authController.checkConnection();

    if (connection) {
      final jobRoleCollection = authController.database.ref('jobRoles');
      print('${email.text} ${password.text}');
      if (formKey.currentState!.validate()) {
        User? user = await registerWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        if (user != null) {
          UserModel userModel = UserModel(
            uid: user.uid,
            email: email.text,
            name: '',
            bio: 'you can edit this bio',
            phoneNumber: '',
            photoProfile: '',
            techRoles: '',
            birthDate: '',
            address: '',
            country: '',
          );
          UserRepository userRepository = UserRepository();
          await userRepository.addUser(userModel, user.uid);
        }
      }
    }
  }
}
