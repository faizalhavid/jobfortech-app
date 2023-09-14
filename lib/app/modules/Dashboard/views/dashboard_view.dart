import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/views/work_desk_view.dart';
import 'package:jobfortech/app/modules/Menu/views/profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
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
    final arrowController = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppHeaderbar(
        type: 'dashboard',
        expandAppbar: true,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppStack(
              spacing: 15,
              safearea: {'horizontal': 38, 'vertical': 20},
              backgroundcolor: AppColor.white,
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
                      return AppBadgeButton(
                        onPressed: () {
                          print(TopIndustri[index]);
                        },
                        height: 2,
                        width: 10,
                        child: Text(
                          TopIndustri[index],
                          style: AppBasicStyle(
                            fontSize: 14,
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
            AppStack(
              spacing: 10,
              safearea: {'horizontal': 38, 'vertical': 20},
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'On Going',
                      style: AppBasicStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontColor: AppColor.black,
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        splashRadius: 20,
                        icon: Icon(
                          arrowController.isArrowUp.value
                              ? Icons.arrow_drop_up_sharp
                              : Icons.arrow_drop_down_circle_outlined,
                        ),
                        onPressed: () {
                          arrowController.toggleArrowDirection();
                        },
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => AnimatedSize(
                    reverseDuration: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 500),
                    child: arrowController.isArrowUp.value
                        ? AppCard(
                            width: Get.width,
                            horizontal: true,
                            color: AppColor.lightBlue,
                            radius: 24,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppBadge(
                                        backgroundColor: AppColor.darkOrange,
                                        height: 6,
                                        child: Text(
                                          'Overtime',
                                          style: AppBasicStyle(
                                              fontSize: 13,
                                              fontColor: AppColor.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      AppBadge(
                                        backgroundColor: AppColor.lightOrange,
                                        height: 6,
                                        child: Text(
                                          '+ 00:15:01',
                                          style: AppBasicStyle(
                                            fontSize: 13,
                                            fontColor: AppColor.darkOrange,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.65,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Task 3 Integrate Third Party Program',
                                          style: AppBasicStyle(
                                            fontSize: 16,
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Erat at nibh viverra erat pharetra quis egestas morbi maecenas. Lectus egestas turpis ut adipiscing.',
                                          style: AppBasicStyle(
                                            fontSize: 13,
                                            fontColor: AppColor.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppIcon(
                                svgPath: 'assets/svgs/time-history.svg',
                                size: 30,
                              ),
                            ],
                          )
                        : AppCard(
                            color: AppColor.lightBlue,
                            height: 48,
                            width: Get.width,
                            children: [
                              Text(
                                'Task 3 Integrate Third Party Program',
                                style: AppBasicStyle(
                                  fontSize: 14,
                                  fontColor: AppColor.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                  ),
                ),
                Obx(
                  () => AnimatedSize(
                    reverseDuration: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 500),
                    child: arrowController.isArrowUp.value
                        ? AppCard(
                            width: Get.width,
                            horizontal: true,
                            color: AppColor.lightBlue,
                            radius: 24,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppBadge(
                                        backgroundColor: AppColor.darkOrange,
                                        height: 6,
                                        child: Text(
                                          'Overtime',
                                          style: AppBasicStyle(
                                              fontSize: 13,
                                              fontColor: AppColor.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      AppBadge(
                                        backgroundColor: AppColor.lightOrange,
                                        height: 6,
                                        child: Text(
                                          '+ 00:15:01',
                                          style: AppBasicStyle(
                                            fontSize: 13,
                                            fontColor: AppColor.darkOrange,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.65,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Task 3 Integrate Third Party Program',
                                          style: AppBasicStyle(
                                            fontSize: 16,
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Erat at nibh viverra erat pharetra quis egestas morbi maecenas. Lectus egestas turpis ut adipiscing.',
                                          style: AppBasicStyle(
                                            fontSize: 13,
                                            fontColor: AppColor.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppIcon(
                                svgPath: 'assets/svgs/time-history.svg',
                                size: 30,
                              ),
                            ],
                          )
                        : AppCard(
                            color: AppColor.lightBlue,
                            height: 48,
                            width: Get.width,
                            children: [
                              Text(
                                'Task 3 Integrate Third Party Program',
                                style: AppBasicStyle(
                                  fontSize: 14,
                                  fontColor: AppColor.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.45,
                      child: Text(
                        'Erat at nibh viverra erat pharetra quis egestas morbi maecenas.',
                        style: AppBasicStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontColor: AppColor.grey,
                        ),
                      ),
                    ),
                    AppButton(
                      spacing: 1,
                      width: 0,
                      height: 30,
                      backgroundColor: AppColor.lightGrey,
                      child: Text(
                        'Find Work',
                        style: AppBasicStyle(
                          fontSize: 13,
                          fontColor: AppColor.osean,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      suffix: Icon(
                        size: 35,
                        Icons.zoom_in_outlined,
                        color: AppColor.osean,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    AppCard(
                      width: Get.width * 0.25,
                      height: Get.height * 0.135,
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
                        Text(
                          'Project Available',
                          style: AppBasicStyle(
                            fontColor: AppColor.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.laptop,
                              size: 20,
                              color: AppColor.blue,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppCard(
                      width: Get.width * 0.25,
                      height: Get.height * 0.135,
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
                        Text(
                          'Project Available',
                          style: AppBasicStyle(
                            fontColor: AppColor.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.laptop,
                              size: 20,
                              color: AppColor.blue,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppCard(
                      width: Get.width * 0.25,
                      height: Get.height * 0.135,
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
                        Text(
                          'Project Available',
                          style: AppBasicStyle(
                            fontColor: AppColor.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.laptop,
                              size: 20,
                              color: AppColor.blue,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
