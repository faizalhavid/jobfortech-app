import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Work.dart';
import 'package:jobfortech2/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech2/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:jobfortech2/app/modules/Dashboard/views/messages_view.dart';
import 'package:jobfortech2/app/modules/Work/views/work_desk_view.dart';
import 'package:jobfortech2/components/AppBadge/index.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
import 'package:jobfortech2/components/AppNav/index.dart';
import 'package:jobfortech2/components/WorkCard/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech2/app/modules/Profile/views/profile_view.dart';
import 'package:jobfortech2/components/AppAvatar/index.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/components/AppShimmer/index.dart';
import 'package:jobfortech2/components/AppToast/index.dart';

class NavigationView extends GetView {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxInt currentIndex = RxInt(0);

    final navController = Get.put(NavigationController());
    final screens = [Dashboard(), WorkDeskView(), ProfileView()];

    return Obx(
      () => Scaffold(
        appBar: appHeader(
            currentInt: currentIndex.value, navController: navController),
        body: Obx(() => screens[currentIndex.value]),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
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
              'assets/svgs/users.svg',
              'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSize appHeader(
    {required int currentInt, required NavigationController navController}) {
  Widget header = Container();
  header = FutureBuilder<User>(
    future: navController.fetchUser(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final user = snapshot.data!;
        return profileheaderHasData(user, navController, snapshot, currentInt);
      } else if (snapshot.connectionState == ConnectionState.waiting) {
        return profileheaderLoading(currentInt);
      } else {
        return profileheaderError(currentInt);
      }
    },
  );
  return PreferredSize(
    preferredSize: Size.fromHeight(currentInt == 2 ? 75 : 210),
    child: header,
  );
}

Container dashboardContentError() {
  return Container(
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
                  thumbColor: MaterialStateProperty.all<Color>(AppColor.white),
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
  );
}

PreferredSize profileheaderError(int currentInt) {
  return AppHeaderbar(
    height: 210,
    type: 'dashboard',
    expandAppbar: true,
    leading: InkWell(
      onTap: () {
        // Get.to(() => ProfileView());
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
    expandContent: currentInt == 0 ? dashboardContentError() : Container(),
  );
}

Container dashboardContent(User user, NavigationController navController,
    AsyncSnapshot<User> snapshot) {
  return Container(
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
  );
}

Widget workContent(User user, NavigationController navController,
    AsyncSnapshot<User> snapshot) {
  final releatedQuery = 'search=${user.profile!.position!.toLowerCase()}';
  navController.fetchReleatedWork(position: releatedQuery);
  final List<Work> releatedWorkList =
      navController.releatedWork.value as List<Work>;
  return Container(
    width: Get.width,
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Releated Work :',
          style: AppBasicStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontColor: AppColor.white,
          ),
        ),
        SizedBox(
          height: releatedWorkList.isNotEmpty
              ? Get.height * 0.01
              : Get.height * 0.05,
        ),
        releatedWorkList.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Wrap(
                    spacing: 15,
                    children: [
                      if (navController.loading.value)
                        ...List.generate(
                          3,
                          (index) => AppShimmer(
                              isBlur: true,
                              baseColor: AppColor.white.withOpacity(0.4),
                              child: Container(
                                height: Get.height * 0.1,
                                width: Get.width * 0.7,
                                decoration: BoxDecoration(
                                  color: AppColor.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              )),
                        ),
                      ...releatedWorkList
                          .map(
                            (work) => Container(
                              width: Get.width * 0.7,
                              height: Get.height * 0.1,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.grey.withOpacity(0.1),
                                    spreadRadius: 0.3,
                                    blurRadius: 0.3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: WorkList(work),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ))
            : Center(
                child: Text(
                  'No Releated Work Available',
                  style: AppBasicStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontColor: AppColor.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
      ],
    ),
  );
}

PreferredSize profileheaderHasData(
    User user,
    NavigationController navController,
    AsyncSnapshot<User> snapshot,
    int currentInt) {
  Widget expandContent;
  if (currentInt == 0) {
    // dashboard
    expandContent = dashboardContent(user, navController, snapshot);
  } else if (currentInt == 1) {
    // work
    expandContent = workContent(user, navController, snapshot);
  } else {
    // profile
    expandContent = Container();
  }

  return AppHeaderbar(
    height: 500,
    type: currentInt == 2 ? 'default' : 'dashboard',
    expandAppbar: true,
    leading: AppAvatar(
      outlineColor: AppColor.transparent,
      path: user.profile?.photoProfile != null
          ? user.profile!.photoProfile
          : null,
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
    expandContent: expandContent,
  );
}

PreferredSize profileheaderLoading(int currentInt) {
  return AppHeaderbar(
    height: 210,
    type: 'dashboard',
    expandAppbar: true,
    leading: InkWell(
      onTap: () {
        // Get.to(() => ProfileView());
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
    expandContent: currentInt == 0 ? dashboardContentLoading() : Container(),
  );
}

PreferredSize dashboardContentLoading() {
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
