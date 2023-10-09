import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/constant/theme.dart';

Future<void> AppDialog({
  Widget? content,
  String title = '',
  String textConfirm = 'Confirm',
  String textCancel = 'Cancel',
  required Function() onConfirm,
  required Function() onCancel,
}) {
  return Get.defaultDialog(
    titlePadding:
        EdgeInsets.only(top: Get.height * 0.05, bottom: Get.height * 0.005),
    contentPadding: EdgeInsets.symmetric(
        vertical: Get.height * 0.05, horizontal: Get.width * 0.05),
    titleStyle: AppBasicStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    title: title,
    content: content,
    confirm: SizedBox(
      width: Get.width * 0.25,
      child: AppButton(
        overlayColor: AppColor.blueMedium,
        backgroundColor: AppColor.lightBlue,
        height: Get.height * 0.04,
        child: Text(
          textConfirm,
          style: AppBasicStyle(fontSize: 12, fontWeight: FontWeight.w700),
        ),
        onPressed: onConfirm,
      ),
    ),
    cancel: SizedBox(
      width: Get.width * 0.25,
      child: AppButton(
        type: 'default',
        backgroundColor: AppColor.lightGrey2,
        overlayColor: AppColor.smoke,
        height: Get.height * 0.04,
        child: Text(
          textCancel,
          style: AppBasicStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontColor: AppColor.grey,
          ),
        ),
        onPressed: onCancel,
      ),
    ),
  );
}
