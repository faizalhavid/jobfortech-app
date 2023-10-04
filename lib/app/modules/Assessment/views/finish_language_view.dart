import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Assessment/views/verification_profile_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class FinishLanguageView extends GetView {
  const FinishLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSafeArea(
        safearea: {'horizontal': 30, 'vertical': 40},
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                AppCard(
                  height: 270,
                  width: Get.width,
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Language and Personality Test',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.w700, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppIcon(svgPath: 'assets/svgs/trophy.svg', size: 70),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Congratulations! You passed the test',
                                style: AppBasicStyle(
                                    fontColor: AppColor.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          AppCard(
            height: 50,
            width: Get.width,
            radius: 0,
            color: AppColor.lightBlue,
            children: [
              Text(
                'Total Correct Answers',
                style: AppBasicStyle(
                    fontColor: AppColor.darkBlue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            '100/100',
            style: AppBasicStyle(
                fontColor: AppColor.black, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          AppCard(
            height: 50,
            width: Get.width,
            radius: 0,
            color: AppColor.lightBlue,
            children: [
              Text(
                'Passing Score',
                style: AppBasicStyle(
                    fontColor: AppColor.darkBlue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            '100/100',
            style: AppBasicStyle(
                fontColor: AppColor.black, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          AppCard(
            height: 50,
            width: Get.width,
            radius: 0,
            color: AppColor.lightBlue,
            children: [
              Text(
                'Your Score',
                style: AppBasicStyle(
                    fontColor: AppColor.darkBlue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            '100/100',
            style: AppBasicStyle(
                fontColor: AppColor.black, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          AppButton(
              child: Text(
                'Close',
                style: AppBasicStyle(
                    fontColor: AppColor.white, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                Get.to(() => VerificationAssessment());
              })
        ],
      ),
    );
  }
}
