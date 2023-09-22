import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/navigation.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: AppSafeArea(
        spacing: 20,
        safearea: {'horizontal': Get.width * 0.13, 'vertical': Get.width * 0.2},
        children: [
          SizedBox(height: Get.height * 0.03),
          AppIcon(
            svgPath: 'assets/svgs/jobfortech-logo.svg',
            size: 48.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Text(
                'Tellus mauris cursus at condimentum mauris purus nulla. Donec eget quis euismod sapien eu.',
                style: AppBasicStyle(fontColor: AppColor.grey, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AppTextInput(
              controller: email,
              labelText: 'Email',
              hintText: 'Enter email address',
              errorText: 'Invalid email address',
              keyboardType: TextInputType.emailAddress),
          Obx(
            () => AppTextInput(
              controller: password,
              labelText: 'Password',
              hintText: '*********',
              errorText: 'Invalid password address',
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.eyeIconPassword.value,
              suffix: AppIconButton(
                  svgPath: controller.eyeIconPassword.value
                      ? 'assets/svgs/eye-closed.svg'
                      : 'assets/svgs/eye-opened.svg',
                  onPressed: () {
                    controller.eyeIconPassword.value =
                        !controller.eyeIconPassword.value;
                  }),
            ),
          ),
          const SizedBox(height: 64),
          AppButton(
            height: 54,
            child: Text(
              'Sign In',
              style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.white,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              EasyLoading.show(
                  status: 'loading...', maskType: EasyLoadingMaskType.custom);
              Future.delayed(const Duration(seconds: 5), () {
                Get.to(() => NavigationView());
                EasyLoading.dismiss();
              });
            },
          ),
          AppButton(
            prefix: Image.asset('assets/images/google-logo.png'),
            height: 54,
            child: Text(
              'Sign In with Google',
              style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.darkBlue,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              // EasyLoading.show(
              //     status: 'loading...', maskType: EasyLoadingMaskType.custom);
              // Future.delayed(const Duration(seconds: 5), () {
              //   Get.to(() => NavigationView());
              //   EasyLoading.dismiss();
              // });
              controller.googleSignOut();
            },
            type: 'outline',
          ),
        ],
      ),
    );
  }
}
