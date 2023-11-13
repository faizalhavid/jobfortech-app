import 'package:get/get.dart';

enum StatusAssessment {
  none,
  onProgress,
  done,
}

class AssessmentController extends GetxController {
  Rx<StatusAssessment> profileStatus = StatusAssessment.none.obs;
  Rx<StatusAssessment> langgpersonalityStatus = StatusAssessment.none.obs;
  Rx<StatusAssessment> skillTest = StatusAssessment.none.obs;
  Rx<StatusAssessment> projectStatus = StatusAssessment.none.obs;
  RxBool assessmentDone = false.obs;

  @override
  void onInit() {
    currentAssesmentIsDone();
    super.onInit();
  }

  void currentAssesmentIsDone() {
    if (profileStatus.value == StatusAssessment.done &&
        langgpersonalityStatus.value == StatusAssessment.done &&
        skillTest.value == StatusAssessment.done &&
        projectStatus.value == StatusAssessment.done) {
      assessmentDone.value = true;
    } else {
      assessmentDone.value = false;
    }
  }
}
