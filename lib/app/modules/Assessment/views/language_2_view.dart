import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Assessment/views/finish_language_view.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/profile_assesment_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/constant/theme.dart';

class Language2View extends StatelessWidget {
  const Language2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileAssesmentController());
    RxBool isPressed = false.obs;

    return Scaffold(
      appBar: AppHeaderbar(
          title: Text('Language & Personality Test',
              style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.white,
                  fontWeight: FontWeight.w600)),
          automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: AppStack(
          safearea: {'horizontal': 0, 'vertical': 0},
          backgroundcolor: AppColor.white,
          children: [
            Container(
              height: 110,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(21),
                    height: 35,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return AppBadgeButton(
                              width: 35,
                              height: 35,
                              radius: 90,
                              backgroundColor: AppColor.lightGrey2,
                              child: Text(
                                (index + 1).toString(),
                                style: AppBasicStyle(
                                    fontColor: AppColor.grey,
                                    fontWeight: FontWeight.w700),
                              ),
                              onPressed: () {
                                print(index + 1);
                              });
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: controller.count.value),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey2,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Not Answered',
                            style: AppBasicStyle(
                                fontSize: 10,
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: AppColor.yellow,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Marked for review',
                            style: AppBasicStyle(
                                fontSize: 10,
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: AppColor.darkBlue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Answered',
                            style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question 3',
                        style: AppBasicStyle(
                            fontColor: AppColor.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      AppButton(
                          height: 35,
                          width: Get.width * 0.4,
                          child: Text(
                            'Mark for review',
                            style: AppBasicStyle(
                                fontColor: AppColor.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          backgroundColor: AppColor.lightGrey,
                          borderRadius: 10,
                          onPressed: () {})
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Time Left',
                        style: AppBasicStyle(
                            fontSize: 12,
                            fontColor: AppColor.grey,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => AppBadge(
                          backgroundColor: AppColor.lightBlue,
                          child: Text(
                            '${controller.remainingMinutes.value}:${controller.remainingSeconds.value.toString().padLeft(2, '0')}',
                            style: AppBasicStyle(
                                fontSize: 14,
                                fontColor: AppColor.darkBlue,
                                fontWeight: FontWeight.bold),
                          ),
                          width: 80,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis sapien urna. Maecenas ut consectetur arcu, vitae feugiat ante. Mauris vitae risus nec sem luctus fringilla. ',
                    style: AppBasicStyle(
                        fontColor: AppColor.darkBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () {
                      return Container(
                        height: 55,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.selectedValue.value == 1
                              ? AppColor.lightBlue
                              : AppColor.lightGrey,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio<int>(
                                value: 1,
                                groupValue: controller.selectedValue.value,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    controller.selectedValue.value = value;
                                  }
                                },
                                activeColor: AppColor.darkBlue,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColor.darkBlue;
                                  }
                                  return AppColor.darkBlue;
                                }),
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: AppBasicStyle(
                                    fontColor: AppColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () {
                      return Container(
                        height: 55,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.selectedValue.value == 2
                              ? AppColor.lightBlue
                              : AppColor.lightGrey,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio<int>(
                                value: 2,
                                groupValue: controller.selectedValue.value,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    controller.selectedValue.value = value;
                                  }
                                },
                                activeColor: AppColor.darkBlue,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColor.darkBlue;
                                  }
                                  return AppColor.darkBlue;
                                }),
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: AppBasicStyle(
                                    fontColor: AppColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () {
                      return Container(
                        height: 55,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.selectedValue.value == 3
                              ? AppColor.lightBlue
                              : AppColor.lightGrey,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio<int>(
                                value: 3,
                                groupValue: controller.selectedValue.value,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    controller.selectedValue.value = value;
                                  }
                                },
                                activeColor: AppColor.darkBlue,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColor.darkBlue;
                                  }
                                  return AppColor.darkBlue;
                                }),
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: AppBasicStyle(
                                    fontColor: AppColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () {
                      return Container(
                        height: 55,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.selectedValue.value == 4
                              ? AppColor.lightBlue
                              : AppColor.lightGrey,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio<int>(
                                value: 4,
                                groupValue: controller.selectedValue.value,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    controller.selectedValue.value = value;
                                  }
                                },
                                activeColor: AppColor.darkBlue,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColor.darkBlue;
                                  }
                                  return AppColor.darkBlue;
                                }),
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: AppBasicStyle(
                                    fontColor: AppColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                              backgroundColor: AppColor.white,
                              outlineColor: AppColor.darkBlue,
                              type: 'outline',
                              child: Text(
                                'Previous',
                                style: AppBasicStyle(
                                    fontSize: 14,
                                    fontColor: AppColor.darkBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                              width: 80,
                              onPressed: () {}),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: AppButton(
                              child: Text(
                                'Next',
                                style: AppBasicStyle(
                                    fontColor: AppColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              width: 80,
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: Text(
                                            'Confirmation',
                                            style: AppBasicStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Center(
                                          child: Text(
                                            'Are you sure want to leave? Your progress will be lost',
                                            style: AppBasicStyle(
                                                fontSize: 12,
                                                fontColor: AppColor.grey,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'No'),
                                        child: const Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Get.to(() => FinishLanguageView()),
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
