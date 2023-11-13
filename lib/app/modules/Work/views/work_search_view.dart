import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Work.dart';
import 'package:jobfortech2/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech2/app/modules/Work/views/detail_work.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/components/WorkCard/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class SearchWokView extends GetView {
  const SearchWokView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkController());
    return Scaffold(
      appBar: AppHeaderbar(
        title: TextFormField(
          controller: controller.searchController,
          onChanged: (value) {
            controller.fetchWorkList(query: value);
          },
          textInputAction: TextInputAction.search,
          cursorColor: AppColor.white,
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: searchFieldDecoration(),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Obx(
        () {
          if (controller.query_works.value.isEmpty) {
            return Center(
              child: Text(
                'No Work found',
                style: AppBasicStyle(
                  fontColor: AppColor.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              itemCount: controller.query_works.value.length,
              itemBuilder: (context, index) {
                final work = controller.query_works.value[index];
                return WorkCard(
                  work: work,
                  onTap: () {
                    Get.to(() => WorkDetailView(work: work));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  InputDecoration searchFieldDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      hintText: 'Search for jobs',
      hintStyle: AppBasicStyle(
        fontColor: AppColor.whitebone,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.whitebone, width: 0.5),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.white, width: 1),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: AppIcon(
          svgPath: 'assets/svgs/search.svg',
          size: 20,
          editColor: true,
          color: AppColor.white,
        ),
      ),
    );
  }
}
