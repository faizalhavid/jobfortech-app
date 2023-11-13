import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech2/app/modules/Auth/views/email_verify_view.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech2/components/AppDialog/index.dart';
import 'package:jobfortech2/components/AppStack/index.dart';
import 'package:jobfortech2/components/AppToast/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

import '../../../data/models/User.dart';

class RegisterController extends GetxController {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  final authController = Get.put(AuthController());
  List<FocusNode> focusNode = [];
  Rx<User> user = User().obs;

  @override
  void onInit() {
    super.onInit();
    for (var i = 0; i < 6; i++) {
      focusNode.add(FocusNode());
    }
  }

  @override
  void onClose() {
    for (var i = 0; i < 6; i++) {
      focusNode[i].dispose();
    }
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  void registering(GlobalKey<FormState> formKey) async {
    final UserRepository userRepo = UserRepository();
    var connection = await authController.checkConnection();
    if (connection) {
      try {
        if (formKey.currentState!.validate()) {
          EasyLoading.show(
              status: 'loading',
              maskType: EasyLoadingMaskType.custom,
              dismissOnTap: true);
          final response = await userRepo.register(
            email: email.text,
            password: password.text,
            password2: confirmPassword.text,
            firstName: firstName.text,
            lastName: lastName.text,
          );
          user.value = response;
          print('user data : ${user.value.firstName} ${user.value.lastName} ');

          AppToast(message: 'Register success');

          await Future.delayed(Duration(seconds: 1));
          EasyLoading.dismiss();
          Get.to(() => EmailVerifyView(), arguments: user.value);
        } else {
          EasyLoading.showToast('Please fill all fields with valid data',
              toastPosition: EasyLoadingToastPosition.bottom);
        }
      } catch (e) {
        if (e.toString().contains('email')) {
          EasyLoading.dismiss();
          AppDialog(
            onConfirm: () {},
            content: AppStack(
                mAlignment: MainAxisAlignment.center,
                cAlignment: CrossAxisAlignment.center,
                spacing: Get.height * 0.05,
                children: [
                  AppIcon(svgPath: 'assets/svgs/success-verify.svg', size: 100),
                  Text(
                    'Your email has been verified. You can now log in with your new account.',
                    style: AppBasicStyle(
                      fontColor: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
            onCancel: () => Get.back(),
            title: "Email already exists",
            textConfirm: 'Login',
            textCancel: 'Cancel',
          );
        } else {
          print(e);
          EasyLoading.dismiss();
          Get.snackbar(
            'Error',
            'Something went wrong, Please try again later !',
            duration: Duration(seconds: 5),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    }
  }
}
