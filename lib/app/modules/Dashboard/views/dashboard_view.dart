import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notifyState = Get.put(DashboardController());
    List<String> TopIndustri = [
      'Fintech',
      'Ecommerce',
      'Website',
      'Fintech',
      'Ecommerce',
      'Website',
      'Fintech',
      'Ecommerce',
      'Website'
    ];
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppHeaderbar(
          leading: AppAvatar(),
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
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColor.white,
              height: Get.height * 0.25,
              child: AppSafeArea(
                spacing: 15,
                safearea: {'horizontal': 35, 'vertical': 30},
                isScrollable: false,
                children: [
                  Text(
                    'Top Industries',
                    style: AppBasicStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      fontColor: AppColor.black,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: TopIndustri.length,
                      itemBuilder: (context, index) {
                        return AppBadge(
                          height: 2,
                          width: 10,
                          child: Text(
                            TopIndustri[index],
                            style: AppBasicStyle(
                              fontSize: 16,
                              fontColor: AppColor.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          backgroundColor: AppColor.lightBlue,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(children: [
                        Text(
                          'Project',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Text(
                          'Outsource',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Text(
                          'Skills',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            '12',
                            style: AppBasicStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            '4',
                            style: AppBasicStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              AppAvatar(),
                              Positioned(child: AppAvatar(), left: 30),
                              Positioned(child: AppAvatar(), left: 60),
                            ],
                          ),
                        )
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height * 0.45,
              child: AppSafeArea(
                spacing: 15,
                safearea: {'horizontal': 35, 'vertical': 30},
                isScrollable: false,
                children: [
                  Text(
                    'Meet Schedule',
                    style: AppBasicStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      fontColor: AppColor.black,
                    ),
                  ),
                  AppBadge(
                    backgroundColor: AppColor.lightOrange,
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColor.orange,
                          size: 16,
                        ),
                        Text(
                          'Ecommerce Pro... \t 12/12/2021 \t 10:00 AM',
                          style: AppBasicStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            fontColor: AppColor.orange,
                          ),
                        ),
                        Icon(
                          Icons.link_outlined,
                          color: AppColor.orange,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'On Going',
                    style: AppBasicStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      fontColor: AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
