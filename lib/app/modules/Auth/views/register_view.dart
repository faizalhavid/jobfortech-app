import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/utils/validation.dart';

class RegisterView extends GetView {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: AppSafeArea(
          spacing: 25,
          safearea: {
            'horizontal': Get.width * 0.13,
            'vertical': Get.width * 0.2
          },
          children: [
            // SizedBox(height: Get.height * 0.02),
            AppIcon(
              svgPath: 'assets/svgs/jobfortech-logo.svg',
              size: 48.0,
            ),
            Center(
              child: Text(
                'Tellus mauris cursus at condimentum mauris purus nulla. Donec eget quis euismod sapien eu.',
                style: AppBasicStyle(fontColor: AppColor.grey, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),

            AppTextInput(
              onChanged: (value) {
                controller.email.text = value;
              },
              labelText: 'Email',
              hintText: 'Enter email address',
              errorText: 'Invalid email address',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return validateEmail(value!);
              },
            ),

            Obx(
              () => AppTextInput(
                onChanged: (value) {
                  controller.password.text = value;
                },
                labelText: 'Password',
                validator: (value) {
                  return validatePassword(value!);
                },
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
            Obx(
              () => AppTextInput(
                labelText: 'Confirm Password',
                hintText: '*********',
                validator: (value) {
                  return validateConfirmPassword(value!, controller.password);
                },
                errorText: 'Password not match !',
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.eyeIconPassword.value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: AppBasicStyle(
                      fontSize: 14,
                      fontColor: AppColor.grey,
                      fontWeight: FontWeight.normal),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                  child: Text(
                    'Sign In',
                    style: AppBasicStyle(
                        fontSize: 14,
                        fontColor: AppColor.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 34),
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
                controller.registering(formKey);
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
                controller.googleSignIn();
              },
              type: 'outline',
            )
          ],
        ),
      ),
    );
  }
}
