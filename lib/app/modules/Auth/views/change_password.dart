import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/change_password_controller.dart';

import 'package:jobfortech2/components/AppButton/index.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/components/AppTextInput/index.dart';
import 'package:jobfortech2/components/AppToast/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'package:jobfortech2/app/utils/validation.dart';

class ChangePasswordView extends GetView {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    return Scaffold(
      appBar: AppHeaderbar(
        automaticallyImplyLeading: true,
        title: Text(
          'Forgot Password',
          style: AppBasicStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontColor: AppColor.white),
        ),
      ),
      body: Obx(() => Form(
            key: controller.keyForm,
            child: AppSafeArea(
                safearea: {
                  'horizontal': Get.width * 0.13,
                  'vertical': Get.width * 0.3
                },
                spacing: 25,
                children: [
                  AppIcon(
                    svgPath: 'assets/svgs/reset-password.svg',
                    size: 90,
                  ),
                  AppTextInput(
                    controller: controller.old_password,
                    labelText: 'Old Password',
                    hintText: '•••••••••',
                    errorText: 'Invalid Old password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.eyeOldPassword.value,
                    suffix: AppIconButton(
                      svgPath: controller.eyeOldPassword.value
                          ? 'assets/svgs/eye-closed.svg'
                          : 'assets/svgs/eye-opened.svg',
                      onPressed: () {
                        controller.eyeOldPassword.value =
                            !controller.eyeOldPassword.value;
                      },
                    ),
                  ),
                  AppTextInput(
                    controller: controller.new_password,
                    labelText: 'New Password',
                    hintText: '•••••••••',
                    errorText: 'Invalid New password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.eyeIconPassword.value,
                    validator: (value) {
                      return validatePassword(value!);
                    },
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
                    controller: controller.confirm_password,
                    labelText: 'Confirm Password',
                    hintText: '•••••••••',
                    errorText: 'Invalid Confirm password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.eyeIconConfirmPassword.value,
                    validator: (value) {
                      return validateConfirmPassword(
                          value!, controller.new_password);
                    },
                    suffix: AppIconButton(
                      svgPath: controller.eyeIconConfirmPassword.value
                          ? 'assets/svgs/eye-closed.svg'
                          : 'assets/svgs/eye-opened.svg',
                      onPressed: () {
                        controller.eyeIconConfirmPassword.value =
                            !controller.eyeIconConfirmPassword.value;
                      },
                    ),
                  ),
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
                      controller.changePassword();
                    },
                  ),
                ]),
          )),
    );
  }
}
