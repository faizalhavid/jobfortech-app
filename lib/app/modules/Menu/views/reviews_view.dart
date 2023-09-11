import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class ReviewsView extends GetView {
  const ReviewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arrowController = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: AppSafeArea(
        safearea: {'horizontal': 8, 'vertical': 10},
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppIcon(
                          svgPath: 'assets/svgs/fillter.svg',
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Fillter',
                          style: AppBasicStyle(
                              fontSize: 13, fontColor: AppColor.grey),
                        ),
                        Spacer(),
                        AppIcon(
                          svgPath: 'assets/svgs/sort.svg',
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Sort',
                          style: AppBasicStyle(
                              fontSize: 13, fontColor: AppColor.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/company.png'),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project : E-Commerce',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Company Name',
                              style: AppBasicStyle(
                                  fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColor.yellow,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AppColor.yellow,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AppColor.yellow,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AppColor.yellow,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AppColor.yellow,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4.9',
                                  style: AppBasicStyle(
                                    fontSize: 12,
                                    fontColor: AppColor.yellow,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Dec 15th, 21 - March 21th, 23',
                              style: AppBasicStyle(
                                  fontSize: 9,
                                  fontColor: AppColor.grey,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        Spacer(),
                        Obx(
                          () => AppIconButton(
                            svgPath: arrowController.isArrowUp.value
                                ? 'assets/svgs/drop-down-up-outline.svg'
                                : 'assets/svgs/drop-down-outline.svg',
                            onPressed: () {
                              arrowController.toggleArrowDirection();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Obx(() => AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: arrowController.isArrowUp.value
                              ? AppCard(
                                  width: Get.width,
                                  height: 180,
                                  color: AppColor.lightGrey,
                                  radius: 0,
                                  children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppIcon(
                                              svgPath:
                                                  'assets/svgs/jobfortech-logo.svg',
                                              size: 6),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'HR',
                                                style: AppBasicStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                width: 230,
                                                child: Text(
                                                  '“Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet vulputate sit molestie varius. Fringilla molestie amet vulputate sit molestie varius.”',
                                                  style: AppBasicStyle(
                                                    fontSize: 10,
                                                    fontColor: AppColor.grey,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/default-avatar.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Consultant Name',
                                                style: AppBasicStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                width: 230,
                                                child: Text(
                                                  '“Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet vulputate sit molestie varius. Fringilla molestie amet vulputate sit molestie varius.”',
                                                  style: AppBasicStyle(
                                                    fontSize: 10,
                                                    fontColor: AppColor.grey,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ])
                              : Container(),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
