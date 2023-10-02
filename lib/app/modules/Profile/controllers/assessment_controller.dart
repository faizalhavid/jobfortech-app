import 'package:get/get.dart';

enum statusAssement {
  none,
  onProgress,
  done,
}

class AssessmentController extends GetxController {
  Rx<statusAssement> status = statusAssement.none.obs;
  RxBool profileCheck = false.obs;
  RxBool langgPersonality = false.obs;
}
