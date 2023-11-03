import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/app/modules/Work/views/work_search_view.dart';
import 'package:jobfortech/app/modules/Work/views/work_detail_view.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/WorkCard/index.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkListView extends GetView {
  const WorkListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkController());
    RxBool isChipSelected = RxBool(true);
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
          spacing: 25,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Works',
                  style: AppTitleHeader,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChoiceChip(
                      backgroundColor: AppColor.lightGrey,
                      selectedColor: AppColor.blue,
                      showCheckmark: true,
                      selectedShadowColor: AppColor.white,
                      checkmarkColor: AppColor.white,
                      label: Text(
                        'All',
                        style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: true,
                      onSelected: (value) {},
                    ),
                    ChoiceChip(
                      backgroundColor: AppColor.lightGrey,
                      selectedColor: AppColor.blue,
                      showCheckmark: true,
                      selectedShadowColor: AppColor.white,
                      checkmarkColor: AppColor.white,
                      label: Text(
                        'All',
                        style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: true,
                      onSelected: (value) {},
                    ),
                    ChoiceChip(
                      backgroundColor: AppColor.lightGrey,
                      selectedColor: AppColor.blue,
                      showCheckmark: true,
                      selectedShadowColor: AppColor.white,
                      checkmarkColor: AppColor.white,
                      label: Text(
                        'All',
                        style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: true,
                      onSelected: (value) {},
                    ),
                  ],
                ),
              ],
            ),
            ...controller.works.value.map((work) => WorkCard(
                  work: work,
                  onTap: () {
                    Get.to(() => WorkDetailView(work: work));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
