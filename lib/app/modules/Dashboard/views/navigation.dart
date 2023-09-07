import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/messages_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/work_desk_view.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppNav/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class NavigationView extends GetView {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxInt _currentIndex = RxInt(0);
    final navcontroller = Get.put(DashboardController());
    return Scaffold(
      body: Obx(
        () {
          return IndexedStack(
            index: _currentIndex.value,
            children: [DashboardView(), WorkDeskView(), MessagesView()],
          );
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: _currentIndex.value,
          onTap: (int index) {
            _currentIndex.value = index;
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
              _currentIndex.value,
              0,
              'assets/svgs/home.svg',
              'Home',
            ),
            AppNav(
              _currentIndex.value,
              1,
              'assets/svgs/notes.svg',
              'Work Desk',
            ),
            AppNav(
              _currentIndex.value,
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
