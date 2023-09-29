import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class EmailVerifyView extends GetView<AuthController> {
  const EmailVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSafeArea(
        safearea: {
          'horizontal': Get.width * 0.13,
          'vertical': Get.width * 0.65
        },
        spacing: 20,
        children: [
          Obx(
            () => Text(
              controller.emailVerifySuccess.value
                  ? 'Verification Success'
                  : controller.emailVerified.value
                      ? "You've already logged in"
                      : 'Verification Failed',
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => AppIcon(
                  svgPath: controller.emailVerifySuccess.value
                      ? 'assets/svgs/success-verify.svg'
                      : 'assets/svgs/failed-verify.svg',
                  size: 80),
            ),
          ),
          Obx(
            () => Text(
              controller.emailVerifySuccess.value
                  ? 'Your email has been verified. You can now log in with your new account.'
                  : controller.emailVerified.value
                      ? "Click to continue"
                      : 'Your email verification failed.Please try again.',
              style: AppBasicStyle(
                fontColor: AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: AppButton(
              width: 10,
              child: Obx(
                () => Text(
                  controller.emailVerifySuccess.value
                      ? 'Log in'
                      : controller.emailVerified.value
                          ? "Continue"
                          : 'Try again',
                  style: AppBasicStyle(
                      fontSize: 16,
                      fontColor: AppColor.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              onPressed: () {
                controller.emailVerifySuccess.value
                    ? Get.to(() => LoginView())
                    : controller.sendEmailVerification();
              },
            ),
          ),
        ],
      ),
    );
  }
}
