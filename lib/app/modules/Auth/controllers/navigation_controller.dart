import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/constant/theme.dart';

class NavigationController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  RxInt currentIndex = RxInt(0);
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Color changeColorTapped({
    required int currentIndex,
    required int index,
    Color colorActive = AppColor.blue,
    Color colorDisable = AppColor.lightBlue,
  }) =>
      currentIndex == index ? colorActive : colorDisable;
}
