import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/service/dependency_injection.dart';
import 'package:jobfortech/app/service/secure_storage_service.dart';
import 'package:jobfortech/constant/theme.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Get.putAsync(() => SecureStorageService().init());
  configLoading();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        colorScheme: AppColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: "JobforTech",
      initialRoute: await AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
  DependencyInjection.init();
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
    ..backgroundColor = AppColor.lightGrey.withOpacity(0.2)
    ..indicatorColor = AppColor.white
    ..textColor = AppColor.white
    ..textStyle = const TextStyle(fontSize: 16.0, color: AppColor.white)
    ..maskColor = AppColor.white.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
