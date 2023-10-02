import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

BottomNavigationBarItem AppNav(
  int currentIndex,
  int index,
  String svgPath,
  String label,
) {
  final controller = Get.put(NavigationController());
  return BottomNavigationBarItem(
    icon: Container(
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.005),
      child: AppBadge(
        backgroundColor: controller.changeColorTapped(
          currentIndex: currentIndex,
          index: index,
        ),
        height: Get.height * 0.05,
        width: Get.width * 0.105,
        padding: 10,
        radius: 15,
        child: AppIcon(
          svgPath: svgPath,
          size: 90,
          editColor: true,
          color: controller.changeColorTapped(
            currentIndex: currentIndex,
            index: index,
            colorActive: AppColor.white,
            colorDisable: AppColor.blue,
          ),
        ),
      ),
    ),
    label: label,
  );
}
