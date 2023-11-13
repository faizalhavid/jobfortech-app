import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/models/Work.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/data/repository/WorkRepo.dart';
import 'package:jobfortech2/app/service/secure_storage_service.dart';
import 'package:jobfortech2/constant/theme.dart';

class NavigationController extends GetxController
    with SingleGetTickerProviderMixin {
  UserRepository userRepo = UserRepository();

  late TabController tabController;
  RxInt currentIndex = RxInt(0);
  final count = 0.obs;
  final secureStorage = FlutterSecureStorage();
  Rx<User> user = User().obs;
  Rx<List<Work>> releatedWork = Rx<List<Work>>([]);
  RxBool isNotify = false.obs;
  RxBool isArrowUp = true.obs;
  RxString statusTask = 'Pending'.obs;
  Rx<Duration> duration = Duration(seconds: 0).obs;
  RxBool isAvailable = false.obs;
  RxBool loading = true.obs;

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

  Future<User> fetchUser() async {
    final response = await userRepo.getUser();
    user.value = response;
    return response;
  }

  void fetchReleatedWork({required String position}) async {
    WorkRepository().getWorkList(query: position).then((value) {
      releatedWork.value = value;
    });
    Future.delayed(const Duration(seconds: 1), () {
      loading.value = false;
    });
  }

  void updateStatus({required bool status}) async {
    final response = await userRepo.updateUser(body: {
      'status': status.toString(),
    });
  }
}
