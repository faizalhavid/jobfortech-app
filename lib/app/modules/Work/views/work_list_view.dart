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
    Rx<Map<String, dynamic>> salaryList = Rx<Map<String, dynamic>>({
      'min salary ascending': false,
      'min salary descending': false,
      'max salary ascending': false,
      'max salary descending': false,
    });
    Rx<Map<String, dynamic>> dateList = Rx<Map<String, dynamic>>({
      'newest': false,
      'oldest': false,
    });

    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Explore Works',
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
            Row(
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
                                if (map.entries.any((entry) =>
                                    entry.key != 'All' && entry.value)) {
                                  map['All'] = false;
                                } else {
                                  map['All'] = true;
                                }
                              }
                            },
                          );
                          if (data.key == 'Experience' && value) {
                            BottomSheetSection(
                              'Experience',
                              experienceList,
                              context,
                              controller,
                            );
                          } else if (data.key == 'Salary' && value) {
                            BottomSheetSection(
                              'Salary',
                              salaryList,
                              context,
                              controller,
                            );
                          } else if (data.key == 'Date' && value) {
                            BottomSheetSection(
                              'Date',
                              dateList,
                              context,
                              controller,
                            );
                          } else {
                            controller.sortWork(filter: data.key);
                          }
                        },
                      ),
                    )
                    .toList(),
              ],
            ),
            controller.loading.value ? loadingWidget() : SizedBox(),
            ...controller.works.value
                .map(
                  (data) => WorkCard(
                    work: data,
                    onTap: () {
                      Get.to(
                        () => WorkDetailView(work: data),
                      );
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Future<dynamic> BottomSheetSection(
    String title,
    Rx<Map<String, dynamic>> listData,
    BuildContext context,
    WorkController controller,
  ) {
    return Get.bottomSheet(
      Container(
        height: Get.height * 0.4,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppBasicStyle(
                  fontColor: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: AppColor.grey,
                thickness: 1,
              ),
              ...listData.value.entries
                  .map(
                    (data) => RadioListTile<String>(
                      activeColor: AppColor.blue,
                      title: Text(
                        title == 'Experience' ? "${data.key} year's" : data.key,
                        style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: data.key,
                      groupValue: listData.value.entries
                          .firstWhere((entry) => entry.value,
                              orElse: () => MapEntry("", false))
                          .key,
                      onChanged: (value) {
                        listData.update((map) {
                          if (map != null) {
                            map.forEach((key, value) {
                              map[key] = false;
                            });
                            map[data.key] = true;
                          }
                        });
                        Navigator.pop(context);
                        controller.sortWork(filter: title, query: data.key);
                      },
                    ),
                  )
                  .toList(),
            ],
          ),
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
      enableDrag: false,
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
