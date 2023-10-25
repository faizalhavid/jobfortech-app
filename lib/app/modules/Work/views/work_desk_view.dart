import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Work/views/work_list_view.dart';
import 'package:jobfortech/app/modules/Work/views/my_work_view.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkDeskView extends GetView {
  const WorkDeskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSafeArea(
        safearea: {'horizontal': 20, 'vertical': 20},
        spacing: 25,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Work Desk',
                style: AppBasicStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Container(
                width: Get.width * 0.41,
                height: 40,
                child: AppButton(
                  type: 'outline',
                  outlineColor: AppColor.transparent,
                  child: Text(
                    'Find Work',
                    style: AppBasicStyle(
                        fontSize: 14,
                        fontColor: AppColor.osean,
                        fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {},
                  suffix: AppIconButton(
                    svgPath: 'assets/svgs/zoom-in.svg',
                    size: 20,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: Get.height * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppIcon(svgPath: 'assets/svgs/folder.svg', size: 60),
                const SizedBox(height: 5),
                Text(
                  'You don’t have any work',
                  style: AppBasicStyle(
                      fontColor: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  'Click ‘Explore Work’  to find any available works and jobs',
                  style: AppBasicStyle(
                      fontColor: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.width * 0.4,
                  child: AppButton(
                    overlayColor: AppColor.blue.withOpacity(0.2),
                    child: Text(
                      'Explore Work',
                      style: AppBasicStyle(
                          fontSize: 16,
                          fontColor: AppColor.white,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Get.to(() => WorkListView());
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
