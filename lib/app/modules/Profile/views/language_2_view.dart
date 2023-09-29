import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/profile_assesment_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/theme.dart';

class Language2View extends GetView {
  const Language2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileAssesmentController());
    return Scaffold(
      appBar: AppHeaderbar(
          title: Text('Language & Personality Test',
              style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.white,
                  fontWeight: FontWeight.w600)),
          automaticallyImplyLeading: true),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 35,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AppBadgeButton(
                      width: 35,
                      height: 35,
                      radius: 90,
                      child: Text(
                        (index + 1).toString(),
                        style: AppBasicStyle(
                            fontColor: AppColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        print(index + 1);
                      });
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: controller.count.value),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColor.darkBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text('Not Answered')
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColor.darkBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text('Not Answered')
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColor.darkBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text('Not Answered')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
