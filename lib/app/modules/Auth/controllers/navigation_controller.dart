import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/service/secure_storage_service.dart';
import 'package:jobfortech/constant/theme.dart';

class NavigationController extends GetxController
    with SingleGetTickerProviderMixin {
  UserRepository userRepo = UserRepository();
  late TabController tabController;
  RxInt currentIndex = RxInt(0);
  final count = 0.obs;
  final secureStorage = FlutterSecureStorage();
  Rx<User> user = User().obs;
  RxBool isNotify = false.obs;
  RxBool isArrowUp = true.obs;
  RxString statusTask = 'Pending'.obs;
  Rx<Duration> duration = Duration(seconds: 0).obs;
  RxBool isAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });
    fetchUser();
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

  Future<User> fetchUser() async {
    final response = await userRepo.getUser();
    user.value = response;
    return response;
  }

  void updateStatus({required bool status}) async {
    final token = await secureStorage.read(key: 'token');
    final id = await secureStorage.read(key: 'id');
    final response = await userRepo.updateUser(id: id, token: token, body: {
      'status': status,
    });
  }
}
