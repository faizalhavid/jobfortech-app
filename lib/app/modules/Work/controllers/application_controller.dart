import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class ApplicationController extends GetxController {
  Rx<Application> application = Rx<Application>(Application());
  RxBool isAgree = RxBool(false);
  RxBool isAgree2 = RxBool(false);
  Rx<Color> buttonColor = Rx<Color>(Colors.transparent);
  RxString textButton = RxString('');
  Rx<Color?> overlayButton = Rx<Color?>(Colors.transparent);
  Rx<Color> textColor = Rx<Color>(Colors.black);
  RxString message = RxString('');
  Rx<Widget?> suffix = Rx<Widget?>(null);
  RxBool statusAplied = RxBool(false);

  void fetchAplication({required id}) async {
    try {
      final response = WorkRepository().getAplication(id: id);
      application.value = await response;
      statusAplied.value = application.value.status == 'Applied';
      if (statusAplied.value) {
        buttonColor.value = AppColor.lightOrange;
        textButton.value = 'Applied';
        message.value = 'You have applied for this job';
        textColor.value = AppColor.orange;
        overlayButton.value = AppColor.orange.withOpacity(0.2);
        suffix.value = AppIcon(svgPath: 'assets/svgs/time-2.svg', size: 20);
      } else if (application.value.status == 'Rejected') {
        buttonColor.value = AppColor.lightRed;
        textButton.value = 'Rejected';
        message.value = 'You have been rejected for this job';
        textColor.value = AppColor.red;
        suffix.value = AppIcon(svgPath: 'assets/svgs/close.svg', size: 20);
      } else {
        if (isAgree.value && isAgree2.value) {
          buttonColor.value = AppColor.blue;
          textButton.value = 'Apply';
          message.value = 'Congratulation, you have applied for this job !';
          textColor.value = AppColor.white;
          overlayButton.value = AppColor.blue.withOpacity(0.2);
          suffix.value = null;
        } else {
          buttonColor.value = AppColor.smoke;
          textButton.value = 'Apply';
          message.value = 'You have agree to the terms and conditions !';
          textColor.value = AppColor.grey;
          overlayButton.value = AppColor.grey;
          suffix.value = null;
        }
      }
    } catch (e) {
      print('jancok $e');
      // Get.snackbar('Error', e.toString());
    }
  }
}
