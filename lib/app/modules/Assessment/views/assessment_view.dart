import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Profile/controllers/assessment_controller.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class AssessmentView extends GetView<AssessmentController> {
  const AssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AssessmentController());
    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Profile Assessment',
          style: AppBasicStyle(
            fontSize: 16,
            fontColor: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: AppSafeArea(
          safearea: {'horizontal': 20, 'vertical': 20},
          spacing: 30,
          children: [
            Text(
              'Before you start you need to complete these profile assessment',
              style: AppBasicStyle(fontWeight: FontWeight.w500),
            ),
            buildAssessment(
              statusAssement: controller.status,
              title: 'Profile Check',
              onPressed: () {},
              lastUpdate:
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            ),
            buildAssessment(
              statusAssement: 'onProgress',
              title: 'Language & Personality Test',
              messsage: 'Result will be available in 2 days',
              onPressed: () {},
              lastUpdate:
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            ),
            buildAssessment(
              statusAssement: 'done',
              title: 'Skill Test',
              messsage: 'Result will be available in 2 days',
              onPressed: () {},
              lastUpdate:
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            ),
            buildAssessment(
              statusAssement: 'done',
              title: 'Project Test',
              messsage: 'Result will be available in 2 days',
              onPressed: () {},
              lastUpdate:
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            ),
          ]),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: AppButton(
            child: Text(
              'Next',
              style: AppBasicStyle(
                  fontColor: AppColor.white, fontWeight: FontWeight.w600),
            ),
            onPressed: () {}),
      ),
    );
  }

  Widget buildAssessment({
    required statusAssement,
    required String title,
    required Function() onPressed,
    String? lastUpdate = '',
    String? messsage = '',
  }) {
    return InkWell(
      splashColor: AppColor.blue,
      highlightColor: AppColor.lightBlue,
      radius: 20,
      borderRadius: BorderRadius.circular(20),
      onTap: onPressed,
      child: AppCard(
        height: 80,
        width: Get.width,
        radius: 20,
        color: statusAssement == 'done'
            ? AppColor.lightBlue.withOpacity(0.5)
            : statusAssement == 'onProgress'
                ? AppColor.lightOrange
                : AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.grey.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: statusAssement == 'done'
                          ? AppColor.blue
                          : statusAssement == 'onProgress'
                              ? AppColor.orange
                              : AppColor.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      (statusAssement == 'done')
                          ? Icons.check
                          : (statusAssement == 'onProgress')
                              ? Icons.error
                              : Icons.rectangle,
                      color: AppColor.white,
                      size: 15,
                      weight: 10,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  AppStack(
                    mAlignment: MainAxisAlignment.start,
                    spacing: Get.height * 0.005,
                    children: [
                      Text(
                        title,
                        style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        statusAssement == 'done'
                            ? 'Last Update: ${lastUpdate!}'
                            : statusAssement == 'onProgress'
                                ? messsage!
                                : '*Required',
                        style: AppBasicStyle(
                          fontSize: 12,
                          fontColor: statusAssement == 'done'
                              ? AppColor.blue
                              : statusAssement == 'onProgress'
                                  ? AppColor.orange
                                  : AppColor.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppIconButton(
                  svgPath: 'assets/svgs/arrow-right.svg',
                  size: 25,
                  color: statusAssement == 'done'
                      ? AppColor.blue
                      : statusAssement == 'onProgress'
                          ? AppColor.orange
                          : AppColor.grey,
                  editColor: true,
                  onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
// GestureDetector(
//                   onTap: () {
//                     Get.to(() => LanguageView());
//                   },
//                   child: AppCard(
//                     height: 80,
//                     width: Get.width,
//                     radius: 20,
//                     color: AppColor.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: AppColor.blue.withOpacity(0.2),
//                         spreadRadius: 0.5,
//                         blurRadius: 5,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                     children: [
//                       Row(
//                         children: [
//                           ClipOval(
//                             child: Material(
//                               child: InkWell(
//                                 onTap: () {
//                                   // setState(() {
//                                   //   isChecked2 = !isChecked2;
//                                   // });
//                                 },
//                                 child: SizedBox(
//                                   width: 30,
//                                   height: 30,
//                                   child: Center(
//                                     child: Transform.scale(
//                                       scale: 1.2,
//                                       child: Checkbox(
//                                         value: isChecked2,
//                                         onChanged: (bool? value) {
//                                           // setState(() {
//                                           //   isChecked2 = value!;
//                                           // });
//                                         },
//                                         checkColor: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Language & Personality Test',
//                                 style: AppBasicStyle(
//                                     fontColor: AppColor.black,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               Text(
//                                 '*Required',
//                                 style: AppBasicStyle(
//                                     fontSize: 12,
//                                     fontColor: AppColor.red,
//                                     fontWeight: FontWeight.w500),
//                               )
//                             ],
//                           ),
//                           Spacer(),
//                           AppIconButton(
//                               svgPath: 'assets/svgs/arrow-right.svg',
//                               size: 25,
//                               color: AppColor.grey,
//                               editColor: true,
//                               onPressed: () {})
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 AppCard(
//                   height: 80,
//                   width: Get.width,
//                   radius: 20,
//                   color: AppColor.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColor.blue.withOpacity(0.2),
//                       spreadRadius: 0.5,
//                       blurRadius: 5,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                   children: [
//                     Row(
//                       children: [
//                         ClipOval(
//                           child: Material(
//                             child: InkWell(
//                               onTap: () {
//                                 // setState(() {
//                                 //   isChecked2 = !isChecked2;
//                                 // });
//                               },
//                               child: SizedBox(
//                                 width: 30,
//                                 height: 30,
//                                 child: Center(
//                                   child: Transform.scale(
//                                     scale: 1.2,
//                                     child: Checkbox(
//                                       value: isChecked2,
//                                       onChanged: (bool? value) {
//                                         // setState(() {
//                                         //   isChecked2 = value!;
//                                         // });
//                                       },
//                                       checkColor: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Text(
//                           'Skill Test',
//                           style: AppBasicStyle(
//                               fontColor: AppColor.black,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         Spacer(),
//                         AppIconButton(
//                             svgPath: 'assets/svgs/arrow-right.svg',
//                             size: 25,
//                             color: AppColor.grey,
//                             editColor: true,
//                             onPressed: () {})
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 AppCard(
//                   height: 80,
//                   width: Get.width,
//                   radius: 20,
//                   color: AppColor.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColor.blue.withOpacity(0.2),
//                       spreadRadius: 0.5,
//                       blurRadius: 5,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                   children: [
//                     Row(
//                       children: [
//                         ClipOval(
//                           child: Material(
//                             child: InkWell(
//                               onTap: () {
//                                 // setState(() {
//                                 //   isChecked2 = !isChecked2;
//                                 // });
//                               },
//                               child: SizedBox(
//                                 width: 30,
//                                 height: 30,
//                                 child: Center(
//                                   child: Transform.scale(
//                                     scale: 1.2,
//                                     child: Checkbox(
//                                       value: isChecked2,
//                                       onChanged: (bool? value) {
//                                         // setState(() {
//                                         //   isChecked2 = value!;
//                                         // });
//                                       },
//                                       checkColor: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Text(
//                           'Project Test',
//                           style: AppBasicStyle(
//                               fontColor: AppColor.black,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         Spacer(),
//                         AppIconButton(
//                             svgPath: 'assets/svgs/arrow-right.svg',
//                             size: 25,
//                             color: AppColor.grey,
//                             editColor: true,
//                             onPressed: () {})
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             )