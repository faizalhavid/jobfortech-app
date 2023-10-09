import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/forgot_password_controller.dart';
import 'package:jobfortech/app/modules/Auth/views/register_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/app/utils/validation.dart';

class ForgotPasswordView extends GetView {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    final keyForm = GlobalKey<FormState>();
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
      body: Obx(
        () => AppSafeArea(
          safearea: {
            'horizontal': Get.width * 0.13,
            'vertical': Get.width * 0.3
          },
          spacing: 25,
          children: [
            Text(
              'Check your email',
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Obx(() {
              return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  reverseDuration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: SizedBox(
                    key: UniqueKey(),
                    child: AppIcon(
                      svgPath: controller.verifiedEmail.value
                          ? 'assets/svgs/mail.svg'
                          : 'assets/svgs/reset-password2.svg',
                      size: 90,
                    ),
                  ));
            }),
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                reverseDuration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: SizedBox(
                  height: 60,
                  key: UniqueKey(),
                  child: Text(
                    controller.verifiedEmail.value
                        ? 'Enter your email below to receive your password reset construction'
                        : 'We already sent you link to reset your password, please kindly check your inbox to proceed.  ',
                    style: AppBasicStyle(
                      fontColor: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                reverseDuration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: SizedBox(
                  height: 90,
                  child: controller.verifiedEmail.value
                      ? Form(
                          key: keyForm,
                          child: AppTextInput(
                            controller: controller.email,
                            labelText: 'Email',
                            hintText: 'Enter email address',
                            errorText: 'Invalid email address',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return validateEmail(value!);
                            },
                          ),
                        )
                      : Text(
                          'If you have not received the email after few minutes, please check your spam folder.',
                          style: AppBasicStyle(
                            fontColor: AppColor.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              reverseDuration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Obx(
                  () => Column(
                    children: [
                      controller.verifiedEmail.value
                          ? SizedBox()
                          : Text(
                              'Resend Email in : ${controller.countdownValue.value}',
                              style: AppBasicStyle(
                                fontSize: 14,
                                fontColor: AppColor.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      controller.verifiedEmail.value
                          ? AppButton(
                              type: 'default',
                              width: 10,
                              child: Text(
                                'Reset Password',
                                style: AppBasicStyle(
                                  fontSize: 16,
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                                controller.sendResetPasswordEmail(keyForm);
                              },
                            )
                          : AppButton(
                              type: controller.resendEmail.value
                                  ? 'default'
                                  : 'disabled',
                              width: 10,
                              child: Text(
                                'Resend Email',
                                style: AppBasicStyle(
                                  fontSize: 16,
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                                controller.resendEmail.value
                                    ? controller.verifiedEmail.value =
                                        !controller.verifiedEmail.value
                                    : EasyLoading.showToast(
                                        'Please wait for a moment',
                                        toastPosition:
                                            EasyLoadingToastPosition.bottom);
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
            controller.verifiedEmail.value
                ? Row(
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
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
