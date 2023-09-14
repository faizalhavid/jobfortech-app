import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/work_desk_2_view.dart';
import 'package:jobfortech/app/modules/Menu/views/profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkDeskView extends GetView {
  const WorkDeskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notifyState = Get.put(DashboardController());
    return Scaffold(
      appBar: AppHeaderbar(
        expandAppbar: true,
        type: 'work-desk',
        leading: InkWell(
          child: AppAvatar(),
          onTap: () {
            Get.to(() => ProfileView());
          },
        ),
        title: AppIcon(
          svgPath: 'assets/svgs/jobfortech-logo.svg',
          size: 24,
          editColor: true,
          color: AppColor.white,
        ),
        actions: Obx(
          () => AppIconButton(
            svgPath: 'assets/svgs/notifications-bell.svg',
            onPressed: () {
              notifyState.isNotify.value = !notifyState.isNotify.value;
            },
            isbadge: notifyState.isNotify.value,
          ),
        ),
      ),
      body: AppSafeArea(
        safearea: {'horizontal': 16, 'vertical': 20},
        children: [
          Row(
            children: [
              Text(
                'Work Desk',
                style: AppBasicStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                'Find Work',
                style: AppBasicStyle(
                    fontSize: 14,
                    fontColor: AppColor.osean,
                    fontWeight: FontWeight.w500),
              ),
              AppIconButton(
                svgPath: 'assets/svgs/zoom-in.svg',
                size: 20,
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 90.0),
            child: Column(
              children: [
                AppIcon(svgPath: 'assets/svgs/folder.svg', size: 60),
                Text(
                  'You don’t have any work',
                  style: AppBasicStyle(
                      fontColor: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Click ‘Explore Work’  to find any available works and jobs',
                  style: AppBasicStyle(
                      fontColor: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: Get.width * 0.5,
                    child: AppButton(
                        child: Text(
                          'Explore Work',
                          style: AppBasicStyle(
                              fontSize: 16,
                              fontColor: AppColor.darkBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Get.to(() => WorkDesk2View());
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
