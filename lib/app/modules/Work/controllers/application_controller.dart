import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Work.dart';
import 'package:jobfortech2/app/data/repository/WorkRepo.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

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
  final RxBool refreshButton = RxBool(false);
  var workApplication = Future.value().obs;

  void getApplication(int id) async {
    workApplication.value = WorkRepository().getAplication(id: id);
  }

  @override
  void onClose() {
    application.value = Application();
    isAgree.value = false;
    isAgree2.value = false;
    buttonColor.value = Colors.transparent;
    textButton.value = '';
    overlayButton.value = Colors.transparent;
    textColor.value = Colors.black;
    message.value = '';
    suffix.value = null;
    statusAplied.value = false;
    super.onClose();
  }
}
