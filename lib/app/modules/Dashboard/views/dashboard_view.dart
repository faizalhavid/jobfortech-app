import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech/app/modules/Profile/views/profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
    DashboardController controller1 = DashboardController();
    DashboardController controller2 = DashboardController();

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(210),
        child: FutureBuilder<User>(
          future: Get.find<UserRepository>().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return headerLoading();
            }
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              final user = snapshot.data!;
              return headerHasData(user, navController, snapshot);
            } else {
              return headerError();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            AppCard(
              height: 100,
              width: 320,
              radius: 10,
              color: AppColor.blue,
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AppIcon(
                                  svgPath: 'assets/svgs/wallet.svg',
                                  size: 20,
                                  editColor: true,
                                  color: AppColor.darkBlue,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Saldo',
                                  style: AppBasicStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'RP. 7000.000',
                              style: AppBasicStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppIcon(
                                  svgPath: 'assets/svgs/tarik-uang.svg',
                                  size: 30,
                                  editColor: true,
                                  color: AppColor.darkBlue),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Tarik',
                          style: AppBasicStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColor.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AppIcon(
                              svgPath: 'assets/svgs/history.svg', size: 25),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'History',
                          style: AppBasicStyle(
                              fontSize: 12,
                              fontColor: AppColor.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            AppStack(
              spacing: resSpacing,
              safearea: {
                'horizontal': resSafeArea['horizontal']!,
                'vertical': resSafeArea['vertical']!,
              },
              backgroundcolor: AppColor.white,
              children: [
                Text(
                  'Top Industries',
                  style: AppBasicStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    fontColor: AppColor.black,
                  ),
                ),
                buildTopIndustri(items: TopIndustri),
                buildReportJob(
                  project: navController
                          .user.value.profile?.projectHistories?.length
                          .toString() ??
                      '0',
                  outsource: '12',
                  skills: skill,
                ),
              ],
            ),
            AppStack(
              spacing: 10,
              safearea: {'horizontal': 20, 'vertical': 0},
              children: [
                Text(
                  'Meet Schedule',
                  style: AppBasicStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    fontColor: AppColor.black,
                  ),
                ),
                buildMeetSchedule(
                    title: 'Daily Standup', date: '12/12/2021', time: '12:00'),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'On Going',
                      style: AppBasicStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        fontColor: AppColor.black,
                      ),
                    ),
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
                ),
                buildTaskList(
                  title: 'Task 2',
                  time: '00:15:01',
                  description: 'Description for Task 2',
                  endDate: DateTime(2023, 10, 1),
                  instanceController: controller2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize headerError() {
    return AppHeaderbar(
      height: 210,
      type: 'dashboard',
      expandAppbar: true,
      leading: InkWell(
        onTap: () {
          Get.to(() => ProfileView());
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppAvatar(),
      ),
      title: AppIcon(
        svgPath: 'assets/svgs/jobfortech-logo.svg',
        size: 24,
        editColor: true,
        color: AppColor.white,
      ),
      actions: AppIconButton(
        svgPath: 'assets/svgs/notifications-bell.svg',
        onPressed: () {},
      ),
      expandContent: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.06,
          vertical: 15,
        ),
        height: Get.height * 0.2,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: AppBasicStyle(fontColor: AppColor.white),
                    ),
                    Row(children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: Get.width * 0.5,
                        ),
                        child: Text(
                          'No Username',
                          style: AppBasicStyle(
                            fontSize: 16,
                            fontColor: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: Get.width * 0.02),
                    ]),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available',
                      style: AppBasicStyle(fontColor: AppColor.white),
                    ),
                    Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false,
                      onChanged: (bool value) {},
                      hoverColor: AppColor.white,
                      focusColor: AppColor.white,
                      inactiveThumbColor: AppColor.grey,
                      inactiveTrackColor: AppColor.grey,
                      thumbColor:
                          MaterialStateProperty.all<Color>(AppColor.white),
                      trackColor:
                          MaterialStateProperty.all<Color>(AppColor.whitebone),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/images/fe-icon.png', fit: BoxFit.cover),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No data position",
                      style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        AppBadge(
                          padding: 0,
                          height: 19,
                          width: 90,
                          child: Text(
                            'Rockstar',
                            style: AppBasicStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          backgroundColor: AppColor.white,
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star,
                            color: AppColor.yellow, size: 16),
                        Text(
                          '4.9',
                          style: AppBasicStyle(
                            fontSize: 14,
                            fontColor: AppColor.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  PreferredSize headerHasData(User user, NavigationController navController,
      AsyncSnapshot<User> snapshot) {
    return AppHeaderbar(
      height: 210,
      type: 'dashboard',
      expandAppbar: true,
      leading: InkWell(
        onTap: () {
          Get.to(() => ProfileView());
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppAvatar(
          path: user.profile?.photoProfile != null
              ? user.profile!.photoProfile
              : null,
        ),
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
            navController.isNotify.value = !navController.isNotify.value;
          },
          isbadge: navController.isNotify.value,
        ),
      ),
      expandContent: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.06,
          vertical: 15,
        ),
        height: Get.height * 0.2,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: AppBasicStyle(fontColor: AppColor.white),
                    ),
                    Row(children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: Get.width * 0.5,
                        ),
                        child: Text(
                          snapshot.data!.firstName! +
                              ' ' +
                              snapshot.data!.lastName!,
                          style: AppBasicStyle(
                            fontSize: 16,
                            fontColor: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: Get.width * 0.02),
                    ]),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available',
                      style: AppBasicStyle(fontColor: AppColor.white),
                    ),
                    Obx(
                      () => Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: navController.isAvailable.value,
                        onChanged: (bool value) {
                          navController.isAvailable.value = value;
                          navController.updateStatus(status: value);
                        },
                        hoverColor: AppColor.white,
                        focusColor: AppColor.white,
                        inactiveThumbColor: AppColor.grey,
                        inactiveTrackColor: AppColor.grey,
                        thumbColor:
                            MaterialStateProperty.all<Color>(AppColor.white),
                        trackColor: MaterialStateProperty.all<Color>(
                            navController.isAvailable.value
                                ? AppColor.tosca
                                : AppColor.whitebone),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/images/fe-icon.png', fit: BoxFit.cover),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.profile!.position == ''
                          ? "Haven't set position"
                          : user.profile!.position!,
                      style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        AppBadge(
                          padding: 0,
                          height: 19,
                          width: 90,
                          child: Text(
                            'Rockstar',
                            style: AppBasicStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          backgroundColor: AppColor.white,
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star,
                            color: AppColor.yellow, size: 16),
                        Text(
                          '4.9',
                          style: AppBasicStyle(
                            fontSize: 14,
                            fontColor: AppColor.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  PreferredSize headerLoading() {
    return AppHeaderbar(
        height: 210,
        type: 'dashboard',
        expandAppbar: true,
        leading: InkWell(
          onTap: () {
            Get.to(() => ProfileView());
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: AppShimmer(
            baseColor: AppColor.white.withOpacity(0.4),
            highlightColor: AppColor.white.withOpacity(0.33),
            isBlur: true,
            child: AppAvatar(),
          ),
        ),
        title: AppIcon(
          svgPath: 'assets/svgs/jobfortech-logo.svg',
          size: 24,
          editColor: true,
          color: AppColor.white,
        ),
        actions: AppIconButton(
          svgPath: 'assets/svgs/notifications-bell.svg',
          onPressed: () {},
        ),
        expandContent: Container(
          padding:
              EdgeInsets.symmetric(horizontal: Get.width * 0.06, vertical: 15),
          height: Get.height * 0.2,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: AppBasicStyle(fontColor: AppColor.white),
                      ),
                      Row(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: Get.width * 0.5,
                            ),
                            child: AppShimmer(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.01,
                                ),
                                height: 16,
                                width: 155,
                                decoration: BoxDecoration(
                                  color: AppColor.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width * 0.02),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Available',
                        style: AppBasicStyle(fontColor: AppColor.white),
                      ),
                      Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: false,
                        onChanged: (bool value) {},
                        hoverColor: AppColor.white,
                        focusColor: AppColor.white,
                        inactiveThumbColor: AppColor.grey,
                        inactiveTrackColor: AppColor.grey,
                        thumbColor:
                            MaterialStateProperty.all<Color>(AppColor.white),
                        trackColor: MaterialStateProperty.all<Color>(
                            AppColor.whitebone),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset('assets/images/fe-icon.png', fit: BoxFit.cover),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppShimmer(
                        isBlur: true,
                        child: Container(
                          height: 16,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          AppBadge(
                            padding: 0,
                            height: 19,
                            width: 90,
                            child: Text(
                              'Rockstar',
                              style: AppBasicStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            backgroundColor: AppColor.white,
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.star,
                              color: AppColor.yellow, size: 16),
                          Text(
                            '4.9',
                            style: AppBasicStyle(
                              fontSize: 14,
                              fontColor: AppColor.yellow,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }

  // PreferredSize buildDashboardAppbar(NavigationController navController) {
  //   final user = navController.user.value;
  //   return
  //   );
  // }

  Container buildAvailabelProject({
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
      required DashboardController instanceController}) {
    instanceController.timerTask(endDate);
    print(instanceController.isArrowUp);
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
                            backgroundColor:
                                instanceController.statusTask.value ==
                                        'Overtime'
                                    ? AppColor.orange
                                    : instanceController.statusTask.value ==
                                            'Ongoing'
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
}
