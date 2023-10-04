import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TestStatus { all, completed, incompleted }

class SkillTestController extends GetxController
    with SingleGetTickerProviderMixin {
  Rx<TestStatus> skillTest = TestStatus.all.obs;
  late TabController tabController;
  RxInt currentIndex = RxInt(0);

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
}
