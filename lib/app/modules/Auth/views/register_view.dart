import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Auth/controllers/register_controller.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/utils/validation.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: AppSafeArea(
          spacing: 20,
          safearea: {
            'horizontal': Get.width * 0.13,
            'vertical': Get.width * 0.01
          },
          children: [
            SizedBox(height: Get.height * 0.1),
            AppIcon(
              svgPath: 'assets/svgs/jobfortech-logo.svg',
              size: 48.0,
            ),
            Text(
              'Tellus mauris cursus at condimentum mauris purus nulla. Donec eget quis euismod sapien eu.',
              style: AppBasicStyle(fontColor: AppColor.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            Text(
              'Sign Up',
              style: AppBasicStyle(
                fontSize: 14,
                fontColor: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            AppTextInput(
              onChanged: (value) {
                registerController.firstName.text = value;
              },
              labelText: 'First Name',
              hintText: 'Enter first name',
              errorText: 'Invalid first name',
              keyboardType: TextInputType.name,
              validator: (value) {
                return validateEmpty(value!, 'First name is required');
              },
            ),
            AppTextInput(
              onChanged: (value) {
                registerController.lastName.text = value;
              },
              labelText: 'Last Name',
              hintText: 'Enter last name',
              errorText: 'Invalid last name',
              keyboardType: TextInputType.name,
              validator: (value) {
                return validateEmpty(value!, 'Last name is required');
              },
            ),
            AppTextInput(
              onChanged: (value) {
                registerController.email.text = value;
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
                  registerController.password.text = value;
                },
                labelText: 'Password',
                validator: (value) {
                  return validatePassword(value!);
                },
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
                    }),
              ),
            ),
            Obx(
              () => AppTextInput(
                labelText: 'Confirm Password',
                hintText: '•••••••••',
                validator: (value) {
                  return validateConfirmPassword(
                      value!, registerController.password);
                },
                errorText: 'Password not match !',
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.eyeIconConfirmPassword.value,
                suffix: AppIconButton(
                    svgPath: controller.eyeIconConfirmPassword.value
                        ? 'assets/svgs/eye-closed.svg'
                        : 'assets/svgs/eye-opened.svg',
                    onPressed: () {
                      controller.eyeIconConfirmPassword.value =
                          !controller.eyeIconConfirmPassword.value;
                    }),
              ),
            ),
            AppButton(
              height: Get.height * 0.065,
              child: Text(
                'Register',
                style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                registerController.registering(formKey);
              },
            ),
            Text(
              'or',
              style: AppBasicStyle(
                fontSize: 14,
                fontColor: AppColor.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            AppButton(
              prefix: Image.asset('assets/images/google-logo.png'),
              height: Get.height * 0.065,
              child: Text(
                'Continue with Google',
                style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                controller.googleSignIn();
              },
              type: 'outline',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: AppBasicStyle(
                      fontSize: 14,
                      fontColor: AppColor.black,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                  child: Text(
                    'Log in',
                    style: AppBasicStyle(
                      fontSize: 14,
                      fontColor: AppColor.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
