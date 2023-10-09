import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Auth/controllers/register_controller.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/components/AppToast/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class EmailVerifyView extends GetView {
  const EmailVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final user = Get.arguments as User;
    return Scaffold(
      body: AppStack(
        mAlignment: MainAxisAlignment.center,
        cAlignment: CrossAxisAlignment.center,
        safearea: {
          'horizontal': Get.width * 0.09,
          'vertical': Get.height * 0.05
        },
        spacing: 25,
        children: [
          // Obx(
          //   () => Text(
          //     controller.emailVerifySuccess.value
          //         ? 'Verification Success'
          //         : controller.emailVerified.value
          //             ? "You've already logged in"
          //             : 'Verification Failed',
          //     style: AppBasicStyle(
          //       fontColor: AppColor.black,
          //       fontSize: 18,
          //       fontWeight: FontWeight.w700,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Obx(
          //     () => AppIcon(
          //         svgPath: controller.emailVerifySuccess.value
          //             ? 'assets/svgs/success-verify.svg'
          //             : 'assets/svgs/failed-verify.svg',
          //         size: 80),
          //   ),
          // ),
          // Obx(
          //   () => Text(
          //     controller.emailVerifySuccess.value
          //         ? 'Your email has been verified. You can now log in with your new account.'
          //         : controller.emailVerified.value
          //             ? "Click to continue"
          //             : 'Your email verification failed.Please try again.',
          //     style: AppBasicStyle(
          //       fontColor: AppColor.grey,
          //       fontSize: 14,
          //       fontWeight: FontWeight.w500,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 50),
          //   child: AppButton(
          //     width: 10,
          //     child: Obx(
          //       () => Text(
          //         controller.emailVerifySuccess.value
          //             ? 'Log in'
          //             : controller.emailVerified.value
          //                 ? "Continue"
          //                 : 'Try again',
          //         style: AppBasicStyle(
          //             fontSize: 16,
          //             fontColor: AppColor.white,
          //             fontWeight: FontWeight.w500),
          //       ),
          //     ),
          //     onPressed: () {
          //       controller.emailVerifySuccess.value
          //           ? Get.to(() => LoginView())
          //           : controller.sendEmailVerification();
          //     },
          //   ),
          // ),

          Text(
            'Verification Success',
            style: AppBasicStyle(
              fontColor: AppColor.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppIcon(svgPath: 'assets/svgs/success-verify.svg', size: 80),
          ),
          Text.rich(
            TextSpan(
              text: 'An email has been sent to ',
              style: AppBasicStyle(
                fontColor: AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '${user.email} ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'to verify your account.\n\nIf you have not received the email after few minutes, please check your spam folder',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: Get.width * 0.38,
                child: AppButton(
                  child: Text(
                    'Log in',
                    style: AppBasicStyle(
                        fontSize: 16,
                        fontColor: AppColor.white,
                        fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                ),
              ),
              SizedBox(
                width: Get.width * 0.38,
                child: Obx(
                  () => AppButton(
                    type: controller.resendEmail.value ? 'default' : 'disabled',
                    child: Text(
                      'Resend ${controller.resendEmail.value ? 'email' : 'in in ${controller.remainingMinutes.value}:${controller.remainingSeconds.value.toString().padLeft(2, '0')}'}',
                      style: AppBasicStyle(
                        fontSize: 11.5,
                        fontColor: AppColor.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () async {
                      if (controller.resendEmail.value) {
                        await controller.resendEmailUser(
                            id: user.id, email: user.email);
                      } else {
                        AppToast(message: 'Please wait for the remaining time');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
