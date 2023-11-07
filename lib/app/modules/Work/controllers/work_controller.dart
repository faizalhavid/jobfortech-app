import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';
import 'package:jobfortech/components/AppToast/index.dart';

class WorkController extends GetxController {
  Rx<List<Work>> works = Rx<List<Work>>([]);
  Rx<List<Work>> query_works = Rx<List<Work>>([]);
  final RxList<String> expertise = RxList<String>([]);
  RxBool isBookmark = RxBool(false);
  final searchController = TextEditingController();
  RxBool loading = RxBool(false);
  RxBool isAgree = RxBool(false);
  RxBool isAgree2 = RxBool(false);

  @override
  void onInit() {
    fetchWorkList();
    fetchingExpertise();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> fetchingExpertise() async {
    final expertiseData = await UserRepository().getExpertise();
    expertise.assignAll(expertiseData);
  }

  void setWorkSaveStatus({required bool bookmark, required int id}) async {
    final response =
        await WorkRepository().updateSaveStatus(status: bookmark, id: id);
    if (response) {
      AppToast(message: 'This work saved !');
      fetchWorkList();
    }
  }

  void fetchWorkList({String? query}) async {
    loading.value = true;
    try {
      final workData = await WorkRepository().getWorkList(query: query);
      works.value = [];
      if (workData.isNotEmpty) {
        works.value = workData;
        if (query != null) {
          query_works.value = workData;
        }
      }
      Future.delayed(const Duration(seconds: 3), () {
        loading.value = false;
      });
    } catch (e) {
      print(e);
      // Get.snackbar('Error', e.toString(s));
    }
  }

  Future<List<User>> fetchParticipants(List<int> userIds) async {
    List<User> participants = [];
    for (int id in userIds) {
      final user = await UserRepository().getUser(
        id: id.toString(),
      );
      participants.add(user);
    }

    return participants;
  }

  void sortWork({required String filter, String? query}) {
    switch (filter) {
      case 'All':
        fetchWorkList();
        break;
      case 'Experience':
        query = 'job_experience=$query';
        fetchWorkList(query: query);
        break;
      case 'Date':
        if (query == 'newest') {
          query = 'ordering=-publish_date';
        } else {
          query = 'ordering=publish_date';
        }
        fetchWorkList(query: query);
        break;
      case 'Salary':
        query = 'ordering=min_salary';
        switch (query) {
          case 'min salary ascending':
            query = 'ordering=min_salary';
            break;
          case 'min salary descending':
            query = 'ordering=-min_salary';
            break;
          case 'max salary ascending':
            query = 'ordering=max_salary';
            break;
          case 'max salary descending':
            query = 'ordering=-max_salary';

            break;
          default:
            break;
        }
        fetchWorkList(query: query);
        break;

      // case 'Saved':
      //   filteredWork.addAll(works.value.where((work) => work.isSaved == true));
      //   break;
      // case 'Applied':
      //   filteredWork.addAll(works.value.where((work) => work.isApplied == true));
      //   break;
      // case 'Available':
      //   filteredWork.addAll(works.value.where((work) => work.isAvailable == true));
      //   break;
      default:
        break;
    }
  }

  void applicationWork({required Map<String, dynamic> body}) async {
    try {
      final response = await WorkRepository().aplicationWork(body: body);
      // if (response) {
      //   Get.snackbar('Success', 'Work applied successfully');
      // }
    } catch (e) {
      print(e);
      // Get.snackbar('Error', e.toString());
    }
  }
}
