import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/navigation.dart';
import 'package:jobfortech/app/modules/Menu/views/profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppVStack/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';

class LoginView extends GetView {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final eyeController = Get.put(EyeController());

    return Scaffold(
      body: AppSafeArea(
        spacing: 20,
        safearea: {'horizontal': 40, 'vertical': 80},
        children: [
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
              obscureText: eyeController.isClose.value,
              suffix: AppIconButton(
                  svgPath: eyeController.isClose.value
                      ? 'assets/svgs/eye-closed.svg'
                      : 'assets/svgs/eye-opened.svg',
                  onPressed: () {
                    eyeController.isClose.value = !eyeController.isClose.value;
                  }),
            ),
          ),
          const SizedBox(height: 64),
          AppButton(
            height: 54,
            text: 'Sign In',
            onPressed: () {
              Get.to(() => NavigationView());
            },
          ),
          AppButton(
            prefix: Image.asset('assets/images/google-logo.png'),
            height: 54,
            text: 'Sign In with Google',
            onPressed: () {},
            type: 'outline',
          ),
        ],
      ),
    );
  }
}
