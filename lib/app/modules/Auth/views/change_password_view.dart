import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/forgot_password_controller.dart';
import 'package:jobfortech2/components/AppButton/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/components/AppStack/index.dart';
import 'package:jobfortech2/components/AppTextInput/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class ChangePasswordView extends GetView {
  final String user_uuid;
  final String user_id;
  const ChangePasswordView(this.user_uuid, this.user_id, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formKey,
        child: AppSafeArea(
          spacing: 28,
          safearea: {
            'horizontal': Get.width * 0.13,
            'vertical': Get.width * 0.01
          },
          children: [
            SizedBox(height: Get.height * 0.1),
            AppIcon(
              svgPath: 'assets/svgs/jobfortech-logo.svg',
              size: 45,
            ),
            Text(
              'Tellus mauris cursus at condimentum mauris purus nulla. Donec eget quis euismod sapien eu',
              style: AppBasicStyle(fontColor: AppColor.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            Text(
              'Create new password',
              style: AppBasicStyle(
                fontSize: 14,
                fontColor: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextInput(
                    controller: controller.password,
                    labelText: 'Password',
                    hintText: '•••••••••',
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
                      },
                    ),
                  ),
                  AppTextInput(
                    controller: controller.confirmPassword,
                    labelText: 'Confirm Password',
                    hintText: '•••••••••',
                    errorText: 'Invalid password address',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.eyeIconPassword.value,
                    suffix: AppIconButton(
                      svgPath: controller.eyeIconConfirmPassword.value
                          ? 'assets/svgs/eye-closed.svg'
                          : 'assets/svgs/eye-opened.svg',
                      onPressed: () {
                        controller.eyeIconPassword.value =
                            !controller.eyeIconPassword.value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AppStack(cAlignment: CrossAxisAlignment.center, children: [
              AppButton(
                height: Get.height * 0.065,
                child: Text(
                  'Change Password',
                  style: AppBasicStyle(
                      fontSize: 16,
                      fontColor: AppColor.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  controller.handleChangePassword(formKey, user_uuid, user_id);
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
