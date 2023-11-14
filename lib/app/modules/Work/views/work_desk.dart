import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Dashboard/controllers/dashboard_controller.dart';

import 'package:jobfortech2/app/modules/Dashboard/views/my_task_view.dart';
import 'package:jobfortech2/app/modules/Dashboard/views/my_work_view.dart';
import 'package:jobfortech2/app/modules/Profile/views/profile_view.dart';
import 'package:jobfortech2/components/AppAvatar/index.dart';
import 'package:jobfortech2/components/AppBadge/index.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyWorkDesk extends GetView {
  const MyWorkDesk({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notifyState = Get.put(DashboardController());
    return Scaffold(
      body: AppSafeArea(
        safearea: {'horizontal': 16, 'vertical': 20},
        children: [
          Row(
            children: [
              Text(
                'Work Desk',
                style: AppBasicStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                'Find Work',
                style: AppBasicStyle(
                    fontSize: 14,
                    fontColor: AppColor.osean,
                    fontWeight: FontWeight.w500),
              ),
              AppIconButton(
                svgPath: 'assets/svgs/zoom-in.svg',
                size: 20,
                onPressed: () {
                  // Get.to(() => FindWorksView());
                },
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => MyWorkView());
            },
            child: AppCard(
              radius: 15,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      child: CircularPercentIndicator(
                        radius: 25,
                        lineWidth: 3,
                        animation: true,
                        percent: 0.25,
                        center: new Text(
                          "25%",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColor.blue,
                        backgroundColor: AppColor.blue.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Company Name',
                          style: AppBasicStyle(
                              fontSize: 13, fontColor: AppColor.grey),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'E-Commerce Project',
                          style: AppBasicStyle(
                              fontSize: 16,
                              fontColor: AppColor.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    AppIconButton(
                        svgPath: 'assets/svgs/info-circle.svg',
                        size: 22,
                        onPressed: () {})
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Team Project',
                          style: AppBasicStyle(
                              fontSize: 12, fontColor: AppColor.grey),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 100,
                          child: Stack(
                            children: [
                              AppAvatar(radius: 10),
                              Positioned(
                                  child: AppAvatar(radius: 10), left: 18),
                              Positioned(
                                  child: AppAvatar(radius: 10), left: 36),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    AppIcon(svgPath: 'assets/svgs/message.svg', size: 15),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Message',
                      style: AppBasicStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    AppBadgeButton(
                      width: 16,
                      height: 12,
                      backgroundColor: AppColor.blue,
                      child: Text(
                        'Update Task',
                        style: AppBasicStyle(
                            fontSize: 11, fontColor: AppColor.white),
                      ),
                      onPressed: () {
                        Get.to(() => MyTaskView());
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          AppCard(
              width: Get.width,
              height: 70,
              radius: 15,
              color: AppColor.lightOrange,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-Commerce Project',
                          style: AppBasicStyle(
                              fontSize: 16,
                              fontColor: AppColor.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Company Name',
                          style: AppBasicStyle(
                              fontSize: 13, fontColor: AppColor.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    AppBadgeButton(
                        width: 10,
                        height: 5,
                        backgroundColor: AppColor.orange,
                        child: Row(
                          children: [
                            Text(
                              'Waiting Approval',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white, fontSize: 10),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.hourglass_bottom_outlined,
                              size: 10,
                              color: AppColor.white,
                            )
                          ],
                        ))
                  ],
                )
              ])
        ],
      ),
    );
  }
}
