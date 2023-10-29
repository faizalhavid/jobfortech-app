import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';

class WorkController extends GetxController {
  Rx<List<Work>> works = Rx<List<Work>>([]);
  RxBool isSaved = RxBool(false);
  final searchController = TextEditingController();

  @override
  void onInit() {
    fetchWorkList();
    super.onInit();
  }

  void fetchWorkList({String? query}) async {
    try {
      final workData = await WorkRepository().getWorkList(query: query);
      if (workData != null) {
        works.value = workData;
        for (var work in works.value) {
          print(work.company!.name);
        }
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Error', e.toString());
    }
  }
}
