import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

BottomNavigationBarItem AppNav(
  int currentIndex,
  int index,
  String svgPath,
  String label,
) {
  final navcontroller = Get.put(DashboardController());
  return BottomNavigationBarItem(
    icon: AppBadge(
      backgroundColor: navcontroller.changeColorTapped(
        currentIndex: currentIndex,
        index: index,
      ),
      height: 8,
      radius: 10,
      width: 8,
      child: AppIcon(
        svgPath: svgPath,
        size: 20,
        editColor: true,
        color: navcontroller.changeColorTapped(
          currentIndex: currentIndex,
          index: index,
          colorActive: AppColor.white,
          colorDisable: AppColor.blue,
        ),
      ),
    ),
    label: label,
  );
}
