import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/constant/theme.dart';

class DashboardController extends GetxController {
  RxBool isNotify = false.obs;
  Rx<User?> user = Rx<User?>(null);
  final count = 0.obs;
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  RxBool isArrowUp = true.obs;

  void toggleArrowDirection() {
    isArrowUp.value = !isArrowUp.value;
  }

  Color changeColorTapped({
    required int currentIndex,
    required int index,
    Color colorActive = AppColor.blue,
    Color colorDisable = AppColor.lightBlue,
  }) =>
      currentIndex == index ? colorActive : colorDisable;
  Future<void> fetchUserData() async {
    try {
      User? userData = FirebaseAuth.instance.currentUser;
      if (userData != null) {
        user.value = userData;
      }
    } catch (e) {
      Get.snackbar('Unathorized', 'Please login first');
      Future.delayed(Duration(seconds: 2), () {
        Get.offAllNamed('/login');
      });
    }
  }
}
