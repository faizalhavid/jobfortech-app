import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/constant/theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        colorScheme: AppColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      title: "JobforTech",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
