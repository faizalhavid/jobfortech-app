import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech2/constant/theme.dart';

class AuthController extends GetxController {
  RxBool eyeIconPassword = true.obs;
  RxBool eyeIconConfirmPassword = true.obs;
  final secureStorage = FlutterSecureStorage();

  RxBool emailVerified = false.obs;
  RxBool emailVerifySuccess = false.obs;
  RxInt countdownValue = 0.obs;
  RxBool resendEmail = false.obs;
  RxInt duration = 0.obs;
  RxInt remainingMinutes = 0.obs;
  RxInt remainingSeconds = 0.obs;

  @override
  void onInit() {
    super.onInit();
    startCountdown(3);
  }

  void startCountdown(int durationInMinutes) async {
    int durationInSeconds = durationInMinutes * 60;
    countdownValue.value = durationInSeconds;

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownValue.value == 0) {
        resendEmail.value = true;
        timer.cancel();
      } else {
        countdownValue.value--;
        remainingMinutes.value = countdownValue.value ~/ 60;
        remainingSeconds.value = countdownValue.value % 60;
      }
    });
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none ||
        connectivityResult == ConnectionState.waiting) {
      Get.snackbar(
        'No Internet',
        'Please check your internet connection',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.grey,
        colorText: AppColor.white,
      );
      return false;
    }
    return true;
  }

  Future<void> resendEmailUser({required id, required email}) async {
    print(id);
    try {
      var connection = await checkConnection();
      UserRepository userRepo = UserRepository();
      if (connection) {
        EasyLoading.show();
        await userRepo.resendEmail(id: id, email: email);
        EasyLoading.dismiss();
        EasyLoading.showToast('Email sent',
            toastPosition: EasyLoadingToastPosition.bottom);
        resendEmail.value = false;
        startCountdown(3);
      }
    } on Exception catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast(e.toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
      print(e);
      resendEmail.value = false;
      startCountdown(1);
    }
  }

  Future<void> logout() async {
    final id = await secureStorage.read(key: 'id');
    final token = await secureStorage.read(key: 'token');
    try {
      var connection = await checkConnection();
      UserRepository userRepo = UserRepository();
      if (connection) {
        EasyLoading.show();
        secureStorage.delete(key: 'token');
        secureStorage.delete(key: 'id');
        EasyLoading.dismiss();
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(() => LoginView());
        });
        EasyLoading.showToast('Logout success',
            toastPosition: EasyLoadingToastPosition.bottom);
      }
    } on Exception catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast(e.toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
      print(e);
    }
  }
}

// class UserController extends GetxController with StateMixin<User?> {
//   final userProvider = UserProvider();
//   Rx<User?> user = User().obs;
//   getData() {
//     userProvider.getUser(1).then((data) {
//       change(data, status: RxStatus.success());
//     }, onError: (err) {
//       change(null, status: RxStatus.error(err.toString()));
//     });
//   }
// }

