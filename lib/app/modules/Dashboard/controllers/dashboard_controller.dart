import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';

class DashboardController extends GetxController {
  RxBool isNotify = false.obs;
  Rx<User?> user = Rx<User?>(null);
  RxBool isArrowUp = true.obs;
  RxString statusTask = 'Pending'.obs;
  Rx<Duration> duration = Duration(seconds: 0).obs;

  Timer? timer;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void timerTask(DateTime endDate) {
    final difference = endDate.difference(DateTime.now());

    duration.value = difference;
    if (endDate.isBefore(DateTime.now())) {
      statusTask.value = 'Overtime';
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (duration.value.inSeconds == 0) {
          timer.cancel();
        } else {
          duration.value = duration.value - Duration(seconds: 1);
        }
      });
    } else if (endDate.isAfter(DateTime.now())) {
      statusTask.value = 'Ongoing';
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (duration.value.inSeconds == 0) {
          timer.cancel();
        } else {
          duration.value = duration.value + Duration(seconds: 1);
        }
      });
    } else {
      statusTask.value = 'Pending';
    }
  }

  void toggleArrowDirection() {
    isArrowUp.value = !isArrowUp.value;
  }
}
