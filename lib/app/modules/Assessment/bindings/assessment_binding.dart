import 'package:get/get.dart';

import 'package:jobfortech/app/modules/Assessment/controllers/skill_test_controller.dart';

import '../controllers/assessment_controller.dart';

class AssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkillTestController>(
      () => SkillTestController(),
    );
    Get.lazyPut<AssessmentController>(
      () => AssessmentController(),
    );
  }
}
