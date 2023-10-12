import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/messages_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/work_desk_view.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppNav/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech/app/modules/Profile/views/profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/components/AppToast/index.dart';

class NavigationView extends GetView {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxInt currentIndex = RxInt(0);

    final navcontroller = Get.put(DashboardController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            currentIndex == 0 ? Size.fromHeight(210) : Size.fromHeight(100),
        child: Obx(() => appHeader(currentInt: currentIndex.value)),
      ),
      body: Obx(
        () {
          return IndexedStack(
            index: currentIndex.value,
            children: [Dashboard(), WorkDeskView(), MessagesView()],
          );
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: currentIndex.value,
          onTap: (int index) {
            currentIndex.value = index;
          },
          selectedLabelStyle: AppBasicStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: AppBasicStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontColor: AppColor.lightGrey,
          ),
          items: <BottomNavigationBarItem>[
            AppNav(
              currentIndex.value,
              0,
              'assets/svgs/home.svg',
              'Home',
            ),
            AppNav(
              currentIndex.value,
              1,
              'assets/svgs/notes.svg',
              'Work Desk',
            ),
            AppNav(
              currentIndex.value,
              2,
              'assets/svgs/messages.svg',
              'Messages',
            ),
          ],
        ),
      ),
    );
  }
}

Widget appHeader({required int currentInt}) {
  Widget header = Container();
  Size size = Get.size;
  switch (currentInt) {
    case 0:
      size = Size.fromHeight(210);
      header = FutureBuilder<User>(
        future: Get.find<UserRepository>().getUser(),
        builder: (context, snapshot) {
          final navController = Get.put(NavigationController());
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
      );
      break;
    case 1:
      size = Size.fromHeight(100);
      header = Container(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                children: [
                  Text(
                    'New Assignment',
                    style: AppBasicStyle(
                        fontSize: 14,
                        fontColor: AppColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  RichText(
                    text: TextSpan(
                      style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontSize: 10), // gaya default
                      children: <TextSpan>[
                        TextSpan(text: 'Confirm in '),
                        TextSpan(
                          text: '5',
                          style: TextStyle(color: AppColor.yellow),
                        ),
                        TextSpan(text: ':'),
                        TextSpan(
                          text: '43',
                          style: TextStyle(color: Colors.yellow),
                        ),
                        TextSpan(text: ':'),
                        TextSpan(
                          text: '21',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            AppCard(
                color: AppColor.white.withOpacity(0.8),
                height: 85,
                width: Get.width * 0.9,
                radius: 15,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/company.png'),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-Commerce Project',
                            style: AppBasicStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Company Name',
                            style: AppBasicStyle(
                                fontColor: AppColor.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Back End . 3 Months',
                            style: AppBasicStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Spacer(),
                      AppIconButton(
                          svgPath: 'assets/svgs/arrow-right.svg',
                          onPressed: () {})
                    ],
                  )
                ]),
          ],
        ),
      );
      break;
    default:
      break;
  }
  return PreferredSize(
    preferredSize: size,
    child: header,
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
                        fontColor: AppColor.white, fontWeight: FontWeight.w600),
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
                      const Icon(Icons.star, color: AppColor.yellow, size: 16),
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
        outlineColor: AppColor.transparent,
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
                        AppToast(message: 'Status Updated');
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
                        fontColor: AppColor.white, fontWeight: FontWeight.w600),
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
                      const Icon(Icons.star, color: AppColor.yellow, size: 16),
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
