import 'package:get/get.dart';

import 'package:jobfortech/app/modules/Assessment/controllers/langguage_test_controller.dart';

import '../controllers/assessment_controller.dart';

class AssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LangguageTestController>(
      () => LangguageTestController(),
    );
    Get.lazyPut<AssessmentController>(
      () => AssessmentController(),
    );
  }
}
