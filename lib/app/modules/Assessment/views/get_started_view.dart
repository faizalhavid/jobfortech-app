import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Assessment/views/language_test_view.dart';
import 'package:jobfortech/app/modules/Assessment/views/project_test_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class GetStartedTest extends GetView {
  const GetStartedTest({Key? key, required this.data, required this.index})
      : super(key: key);
  final List data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
          title: Text(
            data[index]['title'],
            style: AppBasicStyle(
                fontSize: 16,
                fontColor: AppColor.white,
                fontWeight: FontWeight.w600),
          ),
          automaticallyImplyLeading: true),
      body: Builder(builder: (BuildContext context) {
        return AppSafeArea(
          safearea: {'horizontal': 20, 'vertical': 20},
          spacing: 25,
          children: [
            AppCard(
              height: Get.height * 0.18,
              width: Get.width,
              radius: 10,
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
                AppStack(
                  mainAxisSize: MainAxisSize.max,
                  mAlignment: MainAxisAlignment.spaceEvenly,
                  cAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        data[index]['title'],
                        style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    buildListInfo(
                      value: '100',
                      title: ' Multiple Choice Question',
                      prefix: AppIcon(
                        svgPath: 'assets/svgs/tanda-tanya.svg',
                        size: 16,
                      ),
                    ),
                    buildListInfo(
                      value: '100',
                      title: ' Minutes',
                      prefix: AppIcon(
                        svgPath: 'assets/svgs/timeline.svg',
                        size: 16,
                      ),
                    ),
                    buildListInfo(
                      value: '',
                      title: 'Finish the test to complete your profile',
                      prefix: AppIcon(
                        svgPath: 'assets/svgs/rebon.svg',
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Intructions',
                  style: AppBasicStyle(
                      fontColor: AppColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data[index]['instruction'].toList().length,
                    itemBuilder: (context, item) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•',
                            style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          SizedBox(
                            width: Get.width * 0.85,
                            child: Text(
                              data[index]['instruction'].toList()[item],
                              style: AppBasicStyle(
                                fontColor: AppColor.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      }),
      bottomSheet: Container(
        padding: EdgeInsets.all(Get.width * 0.05),
        child: AppButton(
            child: Text('Start'),
            onPressed: () {
              index == 0
                  ? Get.to(() => LanguageTestView())
                  : Get.to(() => ProjectTestView());
            }),
      ),
    );
  }

  SizedBox buildListInfo({
    String? title,
    String? value,
    Widget? prefix,
  }) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Row(
        children: [
          prefix!,
          SizedBox(
            width: Get.width * 0.02,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: AppBasicStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: title,
                  style: AppBasicStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
