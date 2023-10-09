import 'dart:async';

import 'package:get/get.dart';

class ProfileAssesmentController extends GetxController {
  final count = 1.obs;
  RxInt countdownValue = 0.obs;
  RxInt remainingMinutes = 0.obs;
  RxInt remainingSeconds = 0.obs;
  var selectedValue = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    increment(20);
    startCountdown(30);
  }

  void increment(int max) {
    for (int i = 0; i <= max; i++) {
      count.value = i;
      print(count.value);
    }
  }

  void startCountdown(int durationInMinutes) async {
    int durationInSeconds = durationInMinutes * 60;
    countdownValue.value = durationInSeconds;

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownValue.value == 0) {
        timer.cancel();
      } else {
        countdownValue.value--;
        remainingMinutes.value = countdownValue.value ~/ 60;
        remainingSeconds.value = countdownValue.value % 60;
      }
    });
  }
}
