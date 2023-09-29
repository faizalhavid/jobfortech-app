import 'package:get/get.dart';

class ProfileAssesmentController extends GetxController {
  final count = 1.obs;
  RxBool selectedBaloon = false.obs;
  RxBool currentBaloon = false.obs;
  @override
  void onInit() {
    super.onInit();
    increment(20);
  }

  void increment(int max) {
    for (int i = 0; i <= max; i++) {
      count.value = i;
      print(count.value);
    }
  }
}
