import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Assessment/views/language_2_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class LanguageView extends GetView {
  const LanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
          title: Text('Language & Personality Test',
              style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.white,
                  fontWeight: FontWeight.w600)),
          automaticallyImplyLeading: true),
      body: AppSafeArea(
        safearea: {'horizontal': 20, 'vertical': 20},
        children: [
          AppCard(
            height: 170,
            width: Get.width,
            radius: 10,
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.blue.withOpacity(0.2),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 160,
                    child: Text(
                      'Language & Personality Test',
                      style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      AppIcon(svgPath: 'assets/svgs/tanda-tanya.svg', size: 16),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '100',
                        style: AppBasicStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' Multiple Choice Question',
                        style: AppBasicStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      AppIcon(svgPath: 'assets/svgs/timeline.svg', size: 16),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '100',
                        style: AppBasicStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' Minutes',
                        style: AppBasicStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      AppIcon(svgPath: 'assets/svgs/rebon.svg', size: 16),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Finish the test to complete your profile',
                        style: AppBasicStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Intructions',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Make sure you have a stable internet connection.',
                style: AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Read each question carefully.',
                style: AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: Get.width * 0.8,
                child: Text(
                  'You can navigate between questions using Next and Previous button.',
                  style: AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'You can mark the question for review',
                style: AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: Get.width * 0.8,
                child: Text(
                  'Timer will be displayed on the screen, and the test will automatically submit when the time is over.',
                  style: AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
                ),
              )
            ],
          ),
          SizedBox(
            height: 162,
          ),
          AppButton(
              child: Text(
                'Start',
                style: AppBasicStyle(
                    fontColor: AppColor.white, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                Get.to(() => Language2View());
              })
        ],
      ),
    );
  }
}
