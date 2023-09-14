import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/find_works_view.dart';
import 'package:jobfortech/app/modules/Menu/views/profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WorkDesk2View extends GetView {
  const WorkDesk2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notifyState = Get.put(DashboardController());
    return Scaffold(
      appBar: AppHeaderbar(
        expandAppbar: true,
        type: 'default',
        leading: InkWell(
          child: AppAvatar(),
          onTap: () {
            Get.to(() => ProfileView());
          },
        ),
        title: AppIcon(
          svgPath: 'assets/svgs/jobfortech-logo.svg',
          size: 24,
          editColor: true,
          color: AppColor.white,
        ),
        actions: Obx(
          () => AppIconButton(
            svgPath: 'assets/svgs/notifications-bell.svg',
            onPressed: () {
              notifyState.isNotify.value = !notifyState.isNotify.value;
            },
            isbadge: notifyState.isNotify.value,
          ),
        ),
      ),
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
                onPressed: () {},
              ),
            ],
          ),
          AppCard(
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
                  AppIcon(svgPath: 'assets/svgs/info-circle.svg', size: 22)
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
                            Positioned(child: AppAvatar(radius: 10), left: 18),
                            Positioned(child: AppAvatar(radius: 10), left: 36),
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
                      Get.to(() => FindWorksView());
                    },
                  )
                ],
              ),
            ],
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
