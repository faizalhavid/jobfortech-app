import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';

class WelcomeUserController extends GetxController {
  final Rx<PageController> pageController = PageController().obs;
  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  final List<Map<String, String>> gallerySwipper = [
    {
      'title': 'Welcome to JobForTech',
      'image':
          'https://images.unsplash.com/photo-1596003906949-67221c37965c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Easy To Search Job',
      'image':
          'https://images.unsplash.com/photo-1444653389962-8149286c578a?q=80&w=864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Be Professional Developer',
      'image':
          'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Collaborate With Team',
      'image':
          'https://images.unsplash.com/photo-1537511446984-935f663eb1f4?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Get Your Dream Job',
      'image':
          'https://images.unsplash.com/photo-1628348068343-c6a848d2b6dd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  @override
  void onInit() {
    super.onInit();

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageController.value.page?.round() == gallerySwipper.length - 1) {
        timer.cancel();
        Get.toEnd(() => LoginView());
      } else {
        pageController.value.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
