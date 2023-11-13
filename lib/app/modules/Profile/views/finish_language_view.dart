import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class FinishLanguageView extends GetView {
  const FinishLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSafeArea(
        safearea: {'horizontal': 30, 'vertical': 90},
        children: [
          Center(
            child: AppCard(
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
                  ],
                ),
                AppIcon(svgPath: 'assets/svgs/trophy.svg', size: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
