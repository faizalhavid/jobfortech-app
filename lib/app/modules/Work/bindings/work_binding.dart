import 'package:get/get.dart';

import 'package:jobfortech/app/modules/Work/controllers/work_list_controller.dart';

import '../controllers/work_controller.dart';

class WorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkListController>(
      () => WorkListController(),
    );
    Get.lazyPut<WorkController>(
      () => WorkController(),
    );
  }
}
