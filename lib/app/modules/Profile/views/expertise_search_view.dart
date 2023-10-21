import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Profile/controllers/profile_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class ExpertiseSearchView extends GetView {
  const ExpertiseSearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppHeaderbar(
        backgroundColor: AppColor.blue,
        automaticallyImplyLeading: true,
        leading: Text(
          'Expertise',
          style: AppBasicStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontColor: AppColor.white),
        ),
      ),
      body: AppSafeArea(
        safearea: resSafeArea,
        children: [
          TypeAheadField(
            hideOnEmpty: true,
            suggestionsCallback: (String pattern) async {
              return controller.expertiseOptions.where((element) =>
                  element.toLowerCase().contains(pattern.toLowerCase()));
            },
            itemBuilder: (context, String suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (String suggestion) {
              controller.expertise.clear();
              controller.expertiseOptions.remove(suggestion);

              controller.expertiseTag.add(suggestion);
            },
            textFieldConfiguration: textField(controller),
          ),
          AppStack(spacing: 5, children: [
            Text(
              'My Expertise',
              style: AppBasicStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontColor: AppColor.black,
              ),
            ),
            Text(
              'You can choose up to 5',
              style: AppBasicStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontColor: AppColor.blue,
              ),
            ),
          ]),
          Obx(() {
            return Container(
              width: Get.width,
              child: controller.expertiseTag.length > 0
                  ? Wrap(
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (var tag in controller.expertiseTag)
                          Container(
                            margin: EdgeInsets.only(right: 10, bottom: 10),
                            child: Chip(
                              backgroundColor:
                                  AppColor.lightBlue.withOpacity(0.6),
                              label: Text(
                                tag,
                                style: AppBasicStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontColor: AppColor.blue,
                                ),
                              ),
                              deleteIconColor: AppColor.blue,
                              onDeleted: () {
                                controller.expertiseTag.remove(tag);
                              },
                            ),
                          ),
                      ],
                    )
                  : null,
            );
          }),
        ],
      ),
    );
  }

  TextFieldConfiguration textField(ProfileController controller) {
    return TextFieldConfiguration(
      onEditingComplete: () {
        controller.expertiseTag.add(controller.expertise.text);
        controller.expertise.clear();
      },
      controller: controller.expertise,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        hintText: 'Search for expertise',
        hintStyle: AppBasicStyle(
          fontColor: AppColor.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColor.lightBlue.withOpacity(0.6),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: AppIcon(
            svgPath: 'assets/svgs/search.svg',
            size: 20,
            editColor: true,
            color: AppColor.blue,
          ),
        ),
      ),
    );
  }
}
