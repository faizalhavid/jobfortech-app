import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/app/modules/Work/views/work_detail_view.dart';

import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
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
          'Find Job',
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Obx(
        () => AppSafeArea(
          safearea: {'horizontal': 20, 'vertical': 20},
          spacing: 25,
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Works',
                  style: AppTitleHeader,
                ),
                AppIconButton(
                    svgPath: 'assets/svgs/refresh.svg', onPressed: () {})
              ],
            ),
            ...controller.works.value.map((work) => WorkCard(
                  technology: work.technology!,
                  name: work.project!.name as String,
                  company: work.company!.name as String,
                  position: work.position!,
                  address: work.company!.address!,
                  status: work.status!,
                  details: work.description!,
                  minSalary: work.minSalary,
                  maxSalary: work.maxSalary,
                  time: 0,
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

  Ink WorkCard({
    required String name,
    required String company,
    required String address,
    required String position,
    required String status,
    required String details,
    required int time,
    required List technology,
    int? minSalary,
    int? maxSalary,
    void Function()? onTap,
  }) {
    String salary = '';
    if (minSalary != null && maxSalary != null) {
      if (minSalary >= 1000000 && maxSalary >= 1000000) {
        salary =
            'Rp${(minSalary / 1000000).toStringAsFixed(1).replaceAll('.0', '')} - Rp${(maxSalary / 1000000).toStringAsFixed(1).replaceAll('.0', '')} jt';
      } else if (minSalary >= 100000 && maxSalary >= 100000) {
        salary =
            'Rp${(minSalary / 100000 * 100).toStringAsFixed(0)} - Rp${(maxSalary / 100000 * 100).toStringAsFixed(0)}';
      } else {
        salary = 'Rp$minSalary - Rp$maxSalary';
      }
    }

    return AppCard(
      height: 190,
      width: 230,
      radius: 15,
      color: AppColor.white,
      onTap: onTap,
      boxShadow: [
        BoxShadow(
          color: AppColor.blue.withOpacity(0.2),
          spreadRadius: 0.5,
          blurRadius: 5,
          offset: Offset(0, 5),
        ),
      ],
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 170,
              child: Text(
                position,
                style: AppBasicStyle(
                  fontColor: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              salary,
              style: AppBasicStyle(
                  fontColor: AppColor.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Text(
          name,
          style: AppBasicStyle(
            fontColor: AppColor.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
            children: technology
                .map((e) => Chip(label: Text(e.toString())))
                .toList()),
        Text(
          company,
          style: AppBasicStyle(
              fontColor: AppColor.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        Text(
          address,
          style: AppBasicStyle(fontColor: AppColor.grey, fontSize: 12),
        ),
      ],
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