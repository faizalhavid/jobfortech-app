import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class VerificationProfileView extends GetView {
  const VerificationProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppSafeArea(
          safearea: {'horizontal': 30, 'vertical': 250},
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon(
                    svgPath: 'assets/svgs/time-verification.svg',
                    size: 90,
                    editColor: true,
                    color: AppColor.darkBlue),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Waiting for Verification',
                  style: AppBasicStyle(
                      fontWeight: FontWeight.w500,
                      fontColor: AppColor.grey,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Thank you for completing your profile and taking the required tests, we’ll notify you if your data has been verified',
                  style: AppBasicStyle(
                      fontWeight: FontWeight.w400,
                      fontColor: AppColor.grey,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                AppButton(
                    child: Text(
                      'Continue',
                      style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
