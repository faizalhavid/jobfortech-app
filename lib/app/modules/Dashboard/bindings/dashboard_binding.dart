import 'package:get/get.dart';

import 'package:jobfortech2/app/modules/Dashboard/controllers/profile_assesment_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileAssesmentController>(
      () => ProfileAssesmentController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
