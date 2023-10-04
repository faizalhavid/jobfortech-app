import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Assessment/controllers/skill_test_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class SkillTestView extends GetView {
  const SkillTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SkillTestController());

    return Scaffold(
        appBar: AppHeaderbar(
            title: Text('Skill Test',
                style: AppBasicStyle(
                    fontSize: 16,
                    fontColor: AppColor.white,
                    fontWeight: FontWeight.w600)),
            automaticallyImplyLeading: true),
        body: AppSafeArea(
          safearea: {'horizontal': 20, 'vertical': 20},
          children: [
            buildSkillBar(controller),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: GetBuilder<SkillTestController>(builder: (_) {
                return TabBarView(
                  controller: controller.tabController,
                  children: [
                    buildSkillAll(),
                    Text("Completed"),
                    Text("Incompleted")
                  ],
                );
              }),
            ),
          ],
        ));
  }

  Widget buildSkillAll() {
    return Column(
      children: [
        AppCard(
          height: 200,
          width: Get.width,
          radius: 15,
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/297px-Ruby_logo.svg.png',
                  width: 60,
                  height: 60,
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ruby',
                      style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/tanda-tanya.svg', size: 12),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '100',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontColor: AppColor.grey),
                        ),
                        Text(
                          ' Questions',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontColor: AppColor.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        AppIcon(svgPath: 'assets/svgs/timeline.svg', size: 12),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '100',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.w700,
                              fontColor: AppColor.grey,
                              fontSize: 12),
                        ),
                        Text(
                          ' Minutes',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.w400,
                              fontColor: AppColor.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/document-text.svg',
                            size: 12,
                            editColor: true,
                            color: AppColor.darkBlue),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Multiple Choice',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.w400,
                              fontColor: AppColor.grey,
                              fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                AppBadge(
                    height: 20,
                    width: 65,
                    child: Text(
                      'Back End',
                      style: AppBasicStyle(
                          fontSize: 10,
                          fontColor: AppColor.darkBlue,
                          fontWeight: FontWeight.w500),
                    ),
                    backgroundColor: AppColor.white,
                    showOutline: true,
                    outlineColor: AppColor.darkBlue,
                    padding: 8)
              ],
            ),
            SizedBox(
              height: 4,
            ),
            AppButton(
                height: 38,
                child: Text(
                  'Start',
                  style: AppBasicStyle(
                      fontColor: AppColor.white, fontWeight: FontWeight.w600),
                ),
                onPressed: () {})
          ],
        ),
      ],
    );
  }

  Container buildSkillBar(SkillTestController controller) {
    return AppCard(
      height: 140,
      width: Get.width,
      radius: 15,
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          color: AppColor.grey.withOpacity(0.2),
          spreadRadius: 1.5,
          blurRadius: 5,
          offset: Offset(0, 1),
        ),
      ],
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 35,
              child: Obx(
                () => TextButton(
                  onPressed: () {
                    controller.skillTest.value = TestStatus.all;
                    controller.currentIndex.value = 0;
                    controller.tabController
                        .animateTo(controller.currentIndex.value);
                  },
                  child: Text(
                    'All',
                    style: AppBasicStyle(
                        fontColor: controller.skillTest.value == TestStatus.all
                            ? AppColor.darkBlue
                            : AppColor.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      decoration: controller.skillTest.value == TestStatus.all
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 80,
              height: 35,
              child: Obx(
                () => TextButton(
                  onPressed: () {
                    controller.skillTest.value = TestStatus.completed;
                    controller.currentIndex.value = 1;
                    controller.tabController
                        .animateTo(controller.currentIndex.value);
                  },
                  child: Text(
                    'Completed',
                    style: AppBasicStyle(
                        fontColor:
                            controller.skillTest.value == TestStatus.completed
                                ? AppColor.darkBlue
                                : AppColor.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      decoration:
                          controller.skillTest.value == TestStatus.completed
                              ? TextDecoration.underline
                              : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 90,
              height: 35,
              child: Obx(
                () => TextButton(
                  onPressed: () {
                    controller.skillTest.value = TestStatus.incompleted;
                    controller.currentIndex.value = 2;
                    controller.tabController
                        .animateTo(controller.currentIndex.value);
                  },
                  child: Text(
                    'Incompleted',
                    style: AppBasicStyle(
                        fontColor:
                            controller.skillTest.value == TestStatus.incompleted
                                ? AppColor.darkBlue
                                : AppColor.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      decoration:
                          controller.skillTest.value == TestStatus.incompleted
                              ? TextDecoration.underline
                              : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            AppIcon(svgPath: 'assets/svgs/history.svg', size: 20),
          ],
        ),
        Container(
          height: 70,
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColor.lightGrey3,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Search',
                      style: AppBasicStyle(
                          fontWeight: FontWeight.w400,
                          fontColor: AppColor.black,
                          fontSize: 12),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      'Role',
                      style: AppBasicStyle(
                          fontWeight: FontWeight.w400,
                          fontColor: AppColor.black,
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    AppBadge(
                      height: 30,
                      width: 180,
                      radius: 10,
                      showOutline: true,
                      outlineColor: AppColor.lightGrey2,
                      backgroundColor: AppColor.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppIcon(
                              svgPath: 'assets/svgs/search-2.svg', size: 16),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    AppBadge(
                      height: 30,
                      width: 85,
                      radius: 10,
                      showOutline: true,
                      outlineColor: AppColor.lightGrey2,
                      backgroundColor: AppColor.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'All',
                            style: AppBasicStyle(
                                fontSize: 12,
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.w600),
                          ),
                          AppIcon(
                              svgPath: 'assets/svgs/arrows-alt-arrow-down.svg',
                              size: 16,
                              editColor: true,
                              color: AppColor.grey)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
