import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/app/modules/Work/views/work_search_view.dart';
import 'package:jobfortech/app/modules/Work/views/work_detail_view.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/components/WorkCard/index.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkListView extends GetView {
  const WorkListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkController());
    Rx<Map<String, dynamic>> filter = Rx<Map<String, dynamic>>({
      'All': true,
      'Date': false,
      'Salary': false,
      'Experience': false,
    });
    Rx<Map<String, dynamic>> experienceList = Rx<Map<String, dynamic>>({
      '0-1': false,
      '1-3': false,
      '3-5': false,
      'greater than 5': false,
    });
    RxBool filterStatus = RxBool(false);
    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Available Works',
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: IconButton(
          onPressed: () {
            Get.to(() => SearchWokView(controller.works.value));
          },
          icon: Icon(Icons.search),
          splashRadius: 20,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Obx(
        () => AppSafeArea(
          safearea: {'horizontal': 20, 'vertical': 20},
          spacing: 15,
          scrollDirection: Axis.vertical,
          children: [
            Text(
              'Available Works',
              style: AppTitleHeader,
            ),
            headerFilter(
                filter, filterStatus, controller, experienceList, context),
            controller.loading.value ? loadingWidget() : SizedBox(),
            ...controller.works.value
                .map(
                  (data) => WorkCard(
                    work: data,
                    onTap: () {
                      Get.to(() => WorkDetailView(work: data));
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget choiceExperience(
    Rx<Map<String, dynamic>> experienceList, {
    required WorkController controller,
    required BuildContext context,
  }) {
    experienceList.update((map) {
      if (map != null) {
        map.forEach((key, value) {
          map[key] = false;
        });
      }
    });
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: AppBasicStyle(
              fontColor: AppColor.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          ...experienceList.value.entries
              .map(
                (data) => RadioListTile<String>(
                  activeColor: AppColor.blue,
                  title: Text(
                    '${data.key} yearss',
                    style: AppBasicStyle(
                      fontColor: AppColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: data.key,
                  groupValue: experienceList.value.entries
                      .firstWhere((entry) => entry.value,
                          orElse: () => MapEntry("", false))
                      .key,
                  onChanged: (value) {
                    experienceList.update((map) {
                      if (map != null) {
                        map.forEach((key, value) {
                          map[key] = false;
                        });
                        map[data.key] = true;
                      }
                    });
                    Navigator.pop(context);
                    controller.sortWork(filter: 'Experience', query: data.key);
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Row headerFilter(
      Rx<Map<String, dynamic>> filter,
      RxBool filterStatus,
      WorkController controller,
      Rx<Map<String, dynamic>> experienceList,
      BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width * 0.76,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...filter.value.entries
                  .map(
                    (data) => ChoiceChip(
                      selectedColor: AppColor.blue,
                      disabledColor: AppColor.whitebone,
                      showCheckmark: true,
                      selectedShadowColor: AppColor.white,
                      checkmarkColor: AppColor.white,
                      label: Text(
                        data.key,
                        style: AppBasicStyle(
                          fontColor:
                              data.value ? AppColor.white : AppColor.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: data.value,
                      onSelected: (value) {
                        filter.update(
                          (map) {
                            if (map != null) {
                              map.forEach((key, value) {
                                map[key] = false;
                              });
                              map[data.key] = value;
                            }
                          },
                        );
                        if (data.key == 'Experience' && value) {
                          Get.bottomSheet(
                            Container(
                              height: Get.height * 0.35,
                              padding: const EdgeInsets.all(20),
                              child: choiceExperience(experienceList,
                                  controller: controller, context: context),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: Offset(0, -2),
                                  ),
                                ],
                              ),
                            ),
                            barrierColor: AppColor.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            isDismissible: true,
                            enableDrag: true,
                          );
                        }
                        controller.sortWork(filter: data.key);
                      },
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: filterStatus.value ? AppColor.blue : AppColor.whitebone,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () {
              filterStatus.toggle();
            },
            icon: Icon(
              Icons.filter_list,
              color: filterStatus.value ? AppColor.white : AppColor.grey,
            ),
            splashRadius: 20,
          ),
        )
      ],
    );
  }

  Column loadingWidget() {
    return Column(
      children: [
        AppShimmer(
          child: Container(
            height: Get.height * 0.3,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.whitebone,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        AppShimmer(
          child: Container(
            height: Get.height * 0.3,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.whitebone,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        AppShimmer(
          child: Container(
            height: Get.height * 0.3,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.whitebone,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
