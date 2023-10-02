import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/messages_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/work_desk_view.dart';
import 'package:jobfortech/components/AppNav/index.dart';
import 'package:jobfortech/constant/theme.dart';

class NavigationView extends GetView {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          showUnselectedLabels: true,
          currentIndex: controller.currentIndex.value,
          onTap: (int index) {
            controller.currentIndex.value = index;
            controller.tabController.animateTo(index);
          },
          selectedLabelStyle: AppBasicStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: AppBasicStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontColor: AppColor.smoke,
          ),
          items: <BottomNavigationBarItem>[
            AppNav(
              controller.currentIndex.value,
              0,
              'assets/svgs/home.svg',
              'Home',
            ),
            AppNav(
              controller.currentIndex.value,
              1,
              'assets/svgs/notes.svg',
              'Work Desk',
            ),
            AppNav(
              controller.currentIndex.value,
              2,
              'assets/svgs/messages.svg',
              'Messages',
            ),
          ],
        ),
      ),
      body: GetBuilder<NavigationController>(
        builder: (_) {
          return TabBarView(
            controller: controller.tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              DashboardView(),
              WorkDeskView(),
              MessagesView(),
            ],
          );
        },
      ),
    );
  }
}
