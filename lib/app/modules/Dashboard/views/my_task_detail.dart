import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyTaskDetailView extends GetView {
  const MyTaskDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.5,
        title: Row(
          children: [
            const Text('My Task'),
            SizedBox(
              width: 180,
            ),
            AppIcon(
              svgPath: 'assets/svgs/search.svg',
              editColor: true,
              color: AppColor.white,
              size: 20,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: Get.width,
              color: AppColor.blue,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      child: CircularPercentIndicator(
                        radius: 25,
                        lineWidth: 3,
                        animation: true,
                        percent: 0.30,
                        center: new Text(
                          "30%",
                          style: AppBasicStyle(
                            fontColor: AppColor.white,
                            fontSize: 12,
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColor.white,
                        backgroundColor: AppColor.darkBlue,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              '25/100',
                              style: AppBasicStyle(
                                  fontSize: 12, fontColor: AppColor.white),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              'Updated : 23/12/22',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Due : 23/12/22',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  Text(
                    'On Going',
                    style: AppBasicStyle(
                        fontColor: AppColor.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '5',
                    style: AppBasicStyle(
                        fontColor: AppColor.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  AppIcon(
                      svgPath: 'assets/svgs/drop-down-up-outline.svg',
                      size: 23,
                      editColor: true,
                      color: AppColor.grey),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: AppCard(
                width: 320,
                height: 90,
                color: AppColor.lightBlue,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task 3 Viverra scelerisque id ut enim.',
                            style: AppBasicStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: Get.width * 0.7,
                            child: Text(
                              'Erat at nibh viverra erat pharetra quis egestas morbi maecenas. Lectus egestas turpis ut adipiscing.',
                              style: AppBasicStyle(
                                  fontSize: 10,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                          )
                        ],
                      ),
                      AppIcon(svgPath: 'assets/svgs/hamburger.svg', size: 20)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: AppCard(
                width: 320,
                height: 90,
                color: AppColor.lightBlue,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task 3 Viverra scelerisque id ut enim.',
                            style: AppBasicStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: Get.width * 0.7,
                            child: Text(
                              'Erat at nibh viverra erat pharetra quis egestas morbi maecenas. Lectus egestas turpis ut adipiscing.',
                              style: AppBasicStyle(
                                  fontSize: 10,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                          )
                        ],
                      ),
                      AppIcon(svgPath: 'assets/svgs/hamburger.svg', size: 20)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  Text(
                    'On Testing',
                    style: AppBasicStyle(
                        fontColor: AppColor.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '20',
                    style: AppBasicStyle(
                        fontColor: AppColor.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  AppIcon(
                      svgPath: 'assets/svgs/drop-down-up-outline.svg',
                      size: 23,
                      editColor: true,
                      color: AppColor.grey),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: AppCard(
                width: 320,
                height: 90,
                color: AppColor.lightOrange,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task 3 Viverra scelerisque id ut enim.',
                            style: AppBasicStyle(
                                fontWeight: FontWeight.bold,
                                fontColor: AppColor.orange),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: Get.width * 0.7,
                            child: Text(
                              'Erat at nibh viverra erat pharetra quis egestas morbi maecenas. Lectus egestas turpis ut adipiscing.',
                              style: AppBasicStyle(
                                  fontSize: 10,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                          )
                        ],
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/hamburger.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.orange)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  Text(
                    'Task To Do',
                    style: AppBasicStyle(
                        fontColor: AppColor.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '75',
                    style: AppBasicStyle(
                        fontColor: AppColor.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  AppIcon(
                      svgPath: 'assets/svgs/drop-down-up-outline.svg',
                      size: 23,
                      editColor: true,
                      color: AppColor.grey),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: AppCard(
                width: 320,
                height: 90,
                color: AppColor.transparent,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task 3 Viverra scelerisque id ut enim.',
                            style: AppBasicStyle(
                                fontWeight: FontWeight.bold,
                                fontColor: AppColor.black),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: Get.width * 0.7,
                            child: Text(
                              'Erat at nibh viverra erat pharetra quis egestas morbi maecenas. Lectus egestas turpis ut adipiscing.',
                              style: AppBasicStyle(
                                  fontSize: 10,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                          )
                        ],
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/hamburger.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.grey)
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: AppCard(
                width: 320,
                height: 90,
                color: AppColor.transparent,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task 3 Viverra scelerisque id ut enim.',
                            style: AppBasicStyle(
                                fontWeight: FontWeight.bold,
                                fontColor: AppColor.black),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: Get.width * 0.7,
                            child: Text(
                              'Erat at nibh viverra erat pharetra quis egestas morbi maecenas. Lectus egestas turpis ut adipiscing.',
                              style: AppBasicStyle(
                                  fontSize: 10,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                          )
                        ],
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/hamburger.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.grey)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
