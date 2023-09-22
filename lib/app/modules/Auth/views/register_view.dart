import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppDropDown/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/utils/authentication.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> jobList = [
      'Mobile developer',
      'UI UX',
      'Backend developer',
      'Frontend developer'
    ];
    final List<String> countryList = [
      'Mobile developer',
      'UI UX',
      'Backend developer',
      'Frontend developer'
    ];

    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.formKey,
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
              labelText: 'Name',
              hintText: 'Enter your name',
              keyboardType: TextInputType.name,
              validator: (value) {
                return controller.validateName(value!);
              },
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
                  return controller.validateEmail(value!);
                }),
            AppDropDown(
                label: 'Job Role',
                items: jobList,
                controller: controller.jobRoleDropdownCtrl,
                errorText: 'Invalid job role'),
            AppTextInput(
              controller: controller.birthDate,
              onTap: () {
                _showDatePicker(context, controller.birthDate);
              },
              readOnly: true,
              labelText: 'Birth Date',
              hintText: 'Enter birth date',
              errorText: 'Invalid birth date',
              validator: (value) {
                return controller.validateDate(value!);
              },
              suffix: IconButton(
                onPressed: () {
                  _showDatePicker(context, controller.birthDate);
                },
                icon: Icon(Icons.calendar_today),
              ),
              keyboardType: TextInputType.datetime,
            ),
            AppTextInput(
                onChanged: (value) {
                  controller.address.text = value;
                },
                labelText: 'Address',
                hintText: 'Enter address',
                errorText: 'Invalid address',
                maxLines: 3,
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  return controller.validateAddress(value!);
                }),
            AppDropDown(
              label: 'Country',
              items: countryList,
              controller: controller.country,
              errorText: 'Invalid country',
            ),
            Obx(
              () => AppTextInput(
                onChanged: (value) {
                  controller.password.text = value;
                },
                labelText: 'Password',
                validator: (value) {
                  return controller.validatePassword(value!);
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
                  return controller.validateConfirmPassword(value!);
                },
                errorText: 'Password not match !',
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.eyeIconPassword.value,
              ),
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
                controller.registering();
              },
            ),
            FutureBuilder(
                future: Authentication.initializerFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppButton(
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
                        Authentication.signInGoogle(context: context);
                      },
                      type: 'outline',
                    );
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}

void _showDatePicker(context, birthDate) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (selectedDate != null) {
    birthDate.text = selectedDate.toString().split(' ')[0];
  }
}
