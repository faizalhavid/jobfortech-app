import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import '../controllers/dashboard_controller.dart';

SingleChildScrollView Dashboard() {
  final navController = Get.put(NavigationController());
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
  List<String> skill = ['php', 'go', 'javascript', 'python'];
  final controller = DashboardController();
  DashboardController controller1 = DashboardController();
  DashboardController controller2 = DashboardController();
  return SingleChildScrollView(
      child: Column(
    children: [
      AppStack(
        safearea: {'horizontal': 20, 'vertical': 0},
        backgroundcolor: AppColor.white,
        spacing: 20,
        children: [
          TextHeader(text: 'Your Balance'),
          AppCard(
            height: 80,
            width: Get.width,
            radius: 20,
            color: AppColor.blueMedium,
            boxShadow: [
              BoxShadow(
                color: AppColor.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'IDR',
                      style: AppBasicStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontColor: AppColor.blue,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: Get.width * 0.38,
                      ),
                      child: Text(
                        '12.0000.000',
                        overflow: TextOverflow.ellipsis,
                        style: AppBasicStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontColor: AppColor.black,
                        ),
                      ),
                    ),
                    VerticalIcon(icon: Icons.history, text: 'History'),
                    VerticalIcon(icon: Icons.outbox_sharp, text: 'Withdraw')
                  ])
            ],
          ),
          TextHeader(text: 'Top Industries'),
          buildTopIndustri(items: TopIndustri),
          buildReportJob(project: '12', outsource: '12', skills: skill),
        ],
      ),
      Container(
        color: AppColor.lightGrey,
        child: AppStack(
          spacing: 10,
          safearea: {'horizontal': 20, 'vertical': 20},
          children: [
            TextHeader(text: 'Meet Schedule'),
            buildMeetSchedule(
                title: 'Daily Standup', date: '12/12/2021', time: '12:00'),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextHeader(text: 'On Going'),
                Obx(
                  () => IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      controller.isArrowUp.value
                          ? Icons.arrow_drop_up_sharp
                          : Icons.arrow_drop_down_circle_outlined,
                    ),
                    onPressed: () {
                      controller.toggleArrowDirection();
                    },
                  ),
                ),
              ],
            ),
            buildTaskList(
              title: 'Task 1',
              time: '00:15:01',
              description: 'Description for Task 1',
              endDate: DateTime(2023, 10, 5),
              instanceController: controller1,
              controller: controller,
            ),
            buildTaskList(
              title: 'Task 2',
              time: '00:15:01',
              description: 'Description for Task 2',
              endDate: DateTime(2023, 10, 1),
              instanceController: controller2,
              controller: controller,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  child: Text(
                    'Erat at nibh viverra erat pharetra quis egestas morbi maecenas.',
                    style: AppBasicStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      fontColor: AppColor.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: AppButton(
                      backgroundColor: AppColor.lightGrey,
                      child: Text(
                        'Find Work',
                        style: AppBasicStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontColor: AppColor.osean),
                      ),
                      onPressed: () {},
                      prefix: AppIcon(
                        svgPath: 'assets/svgs/zoom-in.svg',
                        size: 18,
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildAvailabelProject(
                  totalProject: 10,
                ),
                buildAvailabelProject(
                  totalProject: 7,
                  iconPath: 'assets/svgs/notes.svg',
                ),
                buildAvailabelProject(
                  totalProject: 20,
                  iconPath: 'assets/svgs/bag.svg',
                ),
              ],
            )
          ],
        ),
      ),
    ],
  ));
}

Column VerticalIcon({IconData? icon, required String text}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(Get.width * 0.015),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          weight: 12,
          color: AppColor.white,
        ),
      ),
      SizedBox(
        height: Get.height * 0.0025,
      ),
      Text(
        text,
        style: AppBasicStyle(
          fontSize: 10,
          fontColor: AppColor.blue,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}

Text TextHeader({required String text}) {
  return Text(
    text,
    style: AppBasicStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16,
      fontColor: AppColor.black,
    ),
  );
}

Widget buildAvailabelProject({
  int totalProject = 0,
  String iconPath = 'assets/svgs/desktop.svg',
}) {
  return AppCard(
      height: 100,
      width: 100,
      radius: 20,
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          color: AppColor.blue.withOpacity(0.2),
          spreadRadius: 1.5,
          blurRadius: 4,
          offset: Offset(0, 5),
        ),
      ],
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Available',
              style: AppBasicStyle(
                  fontColor: AppColor.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  totalProject.toString(),
                  style: AppBasicStyle(
                      fontSize: 25,
                      fontColor: AppColor.black,
                      fontWeight: FontWeight.bold),
                ),
                AppIcon(
                  svgPath: iconPath,
                  size: 18,
                )
              ],
            )
          ],
        )
      ]);
}

Obx buildTaskList(
    {required String title,
    required String time,
    required String description,
    required DateTime endDate,
    required DashboardController instanceController,
    required DashboardController controller}) {
  instanceController.timerTask(endDate);

  return Obx(
    () => AnimatedSize(
      reverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
      child: controller.isArrowUp.value
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
                          backgroundColor: instanceController
                                      .statusTask.value ==
                                  'Overtime'
                              ? AppColor.orange
                              : instanceController.statusTask.value == 'Ongoing'
                                  ? AppColor.blue
                                  : AppColor.orange,
                          height: Get.width * 0.065,
                          width: Get.width * 0.25,
                          child: Obx(
                            () => Text(
                              instanceController.statusTask.value,
                              style: AppBasicStyle(
                                  fontSize: 12,
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        AppBadge(
                          backgroundColor: AppColor.lightOrange,
                          height: Get.width * 0.065,
                          width: Get.width * 0.4,
                          child: Obx(
                            () => Text(
                              '${instanceController.duration.value.inHours.toString().padLeft(2, '0')}:${instanceController.duration.value.inMinutes.toString().padLeft(2, '0')}:${instanceController.duration.value.inSeconds.toString().padLeft(2, '0')}',
                              overflow: TextOverflow.ellipsis,
                              style: AppBasicStyle(
                                fontSize: 12,
                                fontColor: AppColor.darkOrange,
                                fontWeight: FontWeight.w600,
                              ),
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
                              fontSize: 14,
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
                              fontSize: 12,
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
                    fontSize: 12,
                    fontColor: AppColor.blue,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
    ),
  );
}

InkWell buildMeetSchedule(
    {required String title, required String date, required String time}) {
  return AppBadgeButton(
    onPressed: () {},
    backgroundColor: AppColor.lightOrange,
    height: 45,
    width: Get.width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.calendar_month_outlined,
          color: AppColor.orange,
          size: 16,
        ),
        Container(
          width: Get.width * 0.42,
          child: Text(
            title,
            style: AppBasicStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontColor: AppColor.orange,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          date,
          style: AppBasicStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontColor: AppColor.orange,
          ),
        ),
        Text(
          time,
          style: AppBasicStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
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
  );
}

SizedBox buildTopIndustri({required List<String> items}) {
  return SizedBox(
    height: 22,
    child: ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AppBadgeButton(
          onPressed: () {
            print(items[index]);
          },
          height: 2,
          width: 100,
          child: Text(
            items[index],
            overflow: TextOverflow.ellipsis,
            style: AppBasicStyle(
              fontSize: 12,
              fontColor: AppColor.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: AppColor.lightBlue,
        );
      },
      scrollDirection: Axis.horizontal,
    ),
  );
}

Table buildReportJob(
    {required String project,
    required String outsource,
    required List skills}) {
  return Table(
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
              fontSize: 14),
        ),
        Text(
          'Outsource',
          style: AppBasicStyle(
              fontColor: AppColor.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        Text(
          'Skills',
          style: AppBasicStyle(
              fontColor: AppColor.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      ]),
      TableRow(children: [
        Container(
          child: Text(
            project,
            style: AppBasicStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          child: Text(
            outsource,
            style: AppBasicStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          height: 60,
          child: Stack(
            children: skills.map((skill) {
              double leftPosition = 0.0;
              leftPosition += skills.indexOf(skill) * 25;
              return Positioned(
                child: AppSkillsIcon(skill: skill),
                left: leftPosition,
              );
            }).toList(),
          ),
        )
      ]),
    ],
  );
}
