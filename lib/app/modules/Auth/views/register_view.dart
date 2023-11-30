import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/register_controller.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech2/components/AppButton/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/components/AppTextInput/index.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'package:jobfortech2/app/utils/validation.dart';

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
              initialValue: 'John',
              autofocus: true,
              focusNode: registerController.focusNode[0],
              onFieldSubmitted: (value) {
                registerController.focusNode[0].unfocus();
                registerController.focusNode[1].requestFocus();
              },
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
              initialValue: 'Doe',
              focusNode: registerController.focusNode[1],
              onFieldSubmitted: (value) {
                registerController.focusNode[1].unfocus();
                registerController.focusNode[2].requestFocus();
              },
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
              initialValue: 'johnDoe@gmail.com',
              focusNode: registerController.focusNode[2],
              onFieldSubmitted: (value) {
                registerController.focusNode[2].unfocus();
                registerController.focusNode[3].requestFocus();
              },
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
                initialValue: 'Barakadut123!',
                focusNode: registerController.focusNode[3],
                onFieldSubmitted: (value) {
                  registerController.focusNode[3].unfocus();
                  registerController.focusNode[4].requestFocus();
                },
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
                initialValue: 'Barakadut123!',
                onFieldSubmitted: (value) {
                  registerController.focusNode[4].unfocus();
                  registerController.focusNode[5].requestFocus();
                },
                focusNode: registerController.focusNode[4],
                onChanged: (value) {
                  registerController.confirmPassword.text = value;
                },
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
              focusNode: registerController.focusNode[5],
              height: Get.height * 0.065,
              overlayColor: AppColor.overlayblue,
              child: Text(
                'Register',
                style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                registerController.focusNode[5].unfocus();
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
              focusNode: registerController.focusNode[5],
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
              onPressed: () {},
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
