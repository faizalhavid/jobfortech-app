import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Auth/controllers/login_controller.dart';
import 'package:jobfortech/app/modules/Auth/views/forgot_password_view.dart';
import 'package:jobfortech/app/modules/Auth/views/register_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/app/utils/validation.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
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
              'Tellus mauris cursus at condimentum mauris purus nulla. Donec eget quis euismod sapien eu.',
              style: AppBasicStyle(fontColor: AppColor.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            Text(
              'Log in',
              style: AppBasicStyle(
                fontSize: 14,
                fontColor: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            AppTextInput(
              controller: loginController.email,
              labelText: 'Email',
              hintText: 'Enter email address',
              errorText: 'Invalid email address',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return validateEmail(value!);
              },
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextInput(
                    controller: loginController.password,
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
                  TextButton(
                      onPressed: () {
                        Get.to(() => ForgotPasswordView());
                      },
                      child: Text('Forgot password ?')),
                ],
              ),
            ),

            // AppButton(
            //   child: Text(
            //     'Sign Up Developer',
            //     style: AppBasicStyle(fontWeight: FontWeight.bold),
            //   ),
            //   onPressed: () {},
            //   type: 'outline',
            //   outlineColor: AppColor.blue,
            // ),
            SizedBox(
              height: 15,
            ),
            AppStack(cAlignment: CrossAxisAlignment.center, children: [
              AppButton(
                height: Get.height * 0.065,
                child: Text(
                  'Log in',
                  style: AppBasicStyle(
                      fontSize: 16,
                      fontColor: AppColor.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  loginController.logging(formKey);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'or',
                  style: AppBasicStyle(
                    fontSize: 14,
                    fontColor: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              AppButton(
                prefix: Image.asset('assets/images/google-logo.png'),
                height: Get.height * 0.065,
                child: Text(
                  'Continue with Google',
                  style: AppBasicStyle(
                      fontSize: 14,
                      fontColor: AppColor.darkBlue,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                type: 'outline',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppBasicStyle(
                        fontSize: 14,
                        fontColor: AppColor.black,
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => RegisterView());
                    },
                    child: Text(
                      'Sign up',
                      style: AppBasicStyle(
                          fontSize: 14,
                          fontColor: AppColor.blue,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
