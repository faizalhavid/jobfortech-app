import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Dashboard/views/my_task_view.dart';
import 'package:jobfortech2/components/AppAvatar/index.dart';
import 'package:jobfortech2/components/AppBadge/index.dart';
import 'package:jobfortech2/components/AppButton/index.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyWorkView extends GetView {
  const MyWorkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: const Text('My Work'),
      ),
      body: AppSafeArea(
        safearea: {'horizontal': 8, 'vertical': 10},
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E- Commerce Project',
                      style: AppTitleHeader,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'assets/images/company-2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Company Name',
                          style: AppBasicStyle(
                              fontColor: AppColor.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        AppIconButton(
                            svgPath: 'assets/svgs/drop-down-up-outline.svg',
                            onPressed: () {})
                      ],
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet vulputate sit molestie varius. Fringilla molestie amet vulputate sit molestie varius. Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet vulputate sit molestie varius. Fringilla molestie amet vulputate sit molestie varius.',
                      style: AppBasicStyle(
                        fontSize: 13,
                        fontColor: AppColor.grey,
                        height: 2,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        AppBadge(
                            showOutline: true,
                            backgroundColor: AppColor.white,
                            width: 12,
                            height: 5,
                            child: Text(
                              'Mobile',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue, fontSize: 9),
                            )),
                        SizedBox(
                          width: 4,
                        ),
                        AppBadge(
                            showOutline: true,
                            backgroundColor: AppColor.white,
                            width: 12,
                            height: 5,
                            child: Text(
                              'Front End',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue, fontSize: 9),
                            )),
                        SizedBox(
                          width: 4,
                        ),
                        AppBadge(
                            showOutline: true,
                            backgroundColor: AppColor.white,
                            width: 12,
                            height: 5,
                            child: Text(
                              'Back End',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue, fontSize: 9),
                            )),
                        SizedBox(
                          width: 4,
                        ),
                        AppBadge(
                          showOutline: true,
                          backgroundColor: AppColor.white,
                          width: 12,
                          height: 5,
                          child: Text(
                            'E-Commerce',
                            style: AppBasicStyle(
                                fontColor: AppColor.blue, fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 8,
                              animation: true,
                              percent: 1.0,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.lightGrey2,
                              backgroundColor: AppColor.blue.withOpacity(0.2),
                            ),
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 8,
                              animation: true,
                              percent: 0.30, // 20%
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.lightBlue,
                              backgroundColor: Colors.transparent,
                            ),
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 8,
                              animation: true,
                              percent: 0.20, // 25%
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.blue,
                              backgroundColor: Colors.transparent,
                            ),
                            Positioned(
                              top: 49, // Adjust as needed
                              left: 35, // Adjust as needed
                              child: Text("25%",
                                  style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.lightGrey2,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '100',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'To Do',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.lightBlue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '10',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'On Going',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '25',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Done',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        AppCard(
                          radius: 0,
                          height: 250,
                          width: 150,
                          color: AppColor.white,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Team Project',
                                  style: AppBasicStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppAvatar(radius: 15),
                                    Spacer(),
                                    AppIcon(
                                        svgPath: 'assets/svgs/info-circle.svg',
                                        size: 15)
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Craig Rosser',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Tech Consultant',
                                  style: AppBasicStyle(
                                    fontColor: AppColor.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      AppAvatar(radius: 10),
                                      Positioned(
                                          child: AppAvatar(radius: 10),
                                          left: 15),
                                      Positioned(
                                          child: AppAvatar(radius: 10),
                                          left: 30),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppButton(
                                    child: Text('Message'),
                                    height: 35,
                                    onPressed: () {})
                              ],
                            ),
                          ],
                        ),
                        AppCard(
                          radius: 0,
                          height: 250,
                          width: 150,
                          color: AppColor.white,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Task',
                                  style: AppBasicStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'You have 14 Feature to handle',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.black),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: CircularPercentIndicator(
                                        radius: 25,
                                        lineWidth: 3,
                                        animation: true,
                                        percent: 0.10,
                                        center: new Text(
                                          "10%",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0),
                                        ),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: AppColor.blue,
                                        backgroundColor: AppColor.lightGrey2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: AppColor.lightGrey2,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '90',
                                                  style: AppBasicStyle(
                                                      fontColor: AppColor.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'To Do',
                                                  style: AppBasicStyle(
                                                      fontColor: AppColor.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: AppColor.blue,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '10',
                                                  style: AppBasicStyle(
                                                      fontColor: AppColor.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Done',
                                                  style: AppBasicStyle(
                                                      fontColor: AppColor.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppButton(
                                    child: Text('Update'),
                                    height: 35,
                                    onPressed: () {
                                      Get.to(() => MyTaskView());
                                    })
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Recent Update',
                      style: AppTitleHeader,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Wed',
                          style: AppBasicStyle(
                              fontSize: 12, fontColor: AppColor.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '23 Dec 2022',
                          style: AppBasicStyle(
                              fontSize: 12, fontColor: AppColor.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '14.24',
                          style: AppBasicStyle(
                              fontSize: 12, fontColor: AppColor.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/recent-update.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 280,
                          height: 40,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'James George James George ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'updated',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: ' Task 004 — Name & Details ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'to done',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/recent-update.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 280,
                          height: 40,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'James George James George ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'updated',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: ' Task 004 — Name & Details ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'to done',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/recent-update.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 280,
                          height: 40,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'James George James George ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'updated',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: ' Task 004 — Name & Details ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'to done',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          'Wed',
                          style: AppBasicStyle(
                              fontSize: 12, fontColor: AppColor.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '23 Dec 2022',
                          style: AppBasicStyle(
                              fontSize: 12, fontColor: AppColor.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '14.24',
                          style: AppBasicStyle(
                              fontSize: 12, fontColor: AppColor.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/recent-update.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 280,
                          height: 40,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'James George James George ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'updated',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: ' Task 004 — Name & Details ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'to done',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/recent-update.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 280,
                          height: 40,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'James George James George ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'updated',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: ' Task 004 — Name & Details ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'to done',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/recent-update.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 280,
                          height: 40,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'James George James George ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'updated',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: ' Task 004 — Name & Details ',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                TextSpan(
                                  text: 'to done',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColor.grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
