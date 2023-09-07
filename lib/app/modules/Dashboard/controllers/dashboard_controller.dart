import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  RxBool isNotify = false.obs;
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

  RxBool isArrowUp = true.obs;

  void toggleArrowDirection() {
    isArrowUp.value = !isArrowUp.value;
  }
}
