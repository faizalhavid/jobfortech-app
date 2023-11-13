import 'package:get/get.dart';

import 'package:jobfortech2/app/modules/Work/controllers/application_controller.dart';
import 'package:jobfortech2/app/modules/Work/controllers/search_work_controller.dart';
import 'package:jobfortech2/app/modules/Work/controllers/work_list_controller.dart';

import '../controllers/work_controller.dart';

class WorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(
      () => ApplicationController(),
    );
    Get.lazyPut<SearchWorkController>(
      () => SearchWorkController(),
    );
    Get.lazyPut<WorkListController>(
      () => WorkListController(),
    );
    Get.lazyPut<WorkController>(
      () => WorkController(),
    );
  }
}
