import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:jobfortech/constant/theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  configLoading();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        colorScheme: AppColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: "JobforTech",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..indicatorColor = AppColor.lightBlue
    ..radius = 10.0
    ..progressColor = AppColor.lightBlue
    ..backgroundColor = AppColor.blue
    ..indicatorColor = AppColor.lightBlue
    ..textColor = AppColor.white
    ..textStyle = const TextStyle(fontSize: 16.0, color: AppColor.white)
    ..maskColor = AppColor.white.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
