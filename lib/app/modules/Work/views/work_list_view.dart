import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/app/modules/Work/views/search_wok_view.dart';
import 'package:jobfortech/app/modules/Work/views/work_detail_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';

import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/WorkCard/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkListView extends GetView {
  const WorkListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkController());
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
            // Column(
            //   children: [
            //     Text(
            //       'Available Works',
            //       style: AppTitleHeader,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         AppIconButton(
            //             svgPath: 'assets/svgs/refresh.svg', onPressed: () {})
            //       ],
            //     ),
            //   ],
            // ),
            ...controller.works.value.map((work) => WorkCard(
                  controller: controller,
                  work: work,
                  onTap: () {
                    Get.to(() => WorkDetailView(work: work));
                    print('tap');
                  },
                )),
          ],
        ),
      ),
    );
  }
}
 // Row(
                  //   children: [
                  //     Text(
                  //       'Find Job',
                  //       style: AppTitleHeader,
                  //     ),
                  //     Spacer(),
                  //     AppIconButton(
                  //         svgPath: 'assets/svgs/card.svg', onPressed: () {})
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 32,
                  // ),
                  // SizedBox(
                  //   height: 110,
                  //   child: ListView.separated(
                  //     separatorBuilder: (context, index) =>
                  //         const SizedBox(width: 10),
                  //     itemCount: TopIndustri.length,
                  //     padding:
                  //         EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           Get.to(() => WorkDetailView());
                  //         },
                  //         child: AppCard(
                  //             color: AppColor.white,
                  //             width: 230,
                  //             height: 100,
                  //             radius: 15,
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: AppColor.blue.withOpacity(0.2),
                  //                 spreadRadius: 0.5,
                  //                 blurRadius: 5,
                  //                 offset: Offset(0, 5),
                  //               ),
                  //             ],
                  //             children: [
                  //               Row(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Image.asset(
                  //                     'assets/images/company-2.png',
                  //                   ),
                  //                   SizedBox(
                  //                     width: 8,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Mobile Dev',
                  //                         style: AppBasicStyle(
                  //                           fontColor: AppColor.black,
                  //                           fontWeight: FontWeight.bold,
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Text(
                  //                         'Company Name',
                  //                         style: AppBasicStyle(
                  //                           fontColor: AppColor.grey,
                  //                           fontSize: 11,
                  //                         ),
                  //                       ),
                  //                       Text(
                  //                         'Flutter, Middle, Freelance',
                  //                         style: AppBasicStyle(
                  //                           fontColor: AppColor.blue,
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 11,
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 5,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           AppIcon(
                  //                               svgPath:
                  //                                   'assets/svgs/dolar.svg'),
                  //                           SizedBox(
                  //                             width: 5,
                  //                           ),
                  //                           Text(
                  //                             'IDR 6.5 - 8 jt',
                  //                             style: AppBasicStyle(
                  //                               fontColor: AppColor.black,
                  //                               fontSize: 11,
                  //                               fontWeight: FontWeight.bold,
                  //                             ),
                  //                           )
                  //                         ],
                  //                       )
                  //                     ],
                  //                   )
                  //                 ],
                  //               )
                  //             ]),
                  //       );
                  //     },
                  //     scrollDirection: Axis.horizontal,
                  //   ),
                  // ),