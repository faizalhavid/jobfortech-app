import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/providers/user_provider.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

class EyeController extends GetxController {
  RxBool isClose = false.obs;
}

class LoadingController extends GetxController {
  RxBool isLoading = true.obs;
}

class UserController extends GetxController with StateMixin<User?> {
  final userProvider = UserProvider();
  Rx<User?> user = User().obs;
  getData() {
    userProvider.getUser(1).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   getUser();
  // }

  // Future<User?> getUser() async {
  //   try {
  //     final jsonString = await rootBundle.loadString('assets/json/user.json');
  //     final Map<String, dynamic> userData = json.decode(jsonString);
  //     user.value = User.fromJson(userData);
  //   } catch (e) {
  //     print('Error fetching user: $e');
  //     return null;
  //   }
  // }
}
