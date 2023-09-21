import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/views/completed_task_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/my_task_detail.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyTaskView extends GetView {
  const MyTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.5,
        title: Row(
          children: [
            const Text('My Task'),
            SizedBox(
              width: 180,
            ),
            AppIcon(
              svgPath: 'assets/svgs/search.svg',
              editColor: true,
              color: AppColor.white,
              size: 20,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: Get.width,
              color: AppColor.blue,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E-Commerce Project',
                      style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To Do',
                              style: AppBasicStyle(
                                fontColor: AppColor.white,
                              ),
                            ),
                            Text(
                              '100',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'On Going',
                              style: AppBasicStyle(
                                fontColor: AppColor.white,
                              ),
                            ),
                            Text(
                              '100',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Done',
                              style: AppBasicStyle(
                                fontColor: AppColor.white,
                              ),
                            ),
                            Text(
                              '100',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Update',
                              style: AppBasicStyle(
                                fontColor: AppColor.white,
                              ),
                            ),
                            Text(
                              '20/12/2022',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => MyTaskDetailView());
              },
              child: AppCard(
                  height: 80,
                  width: 320,
                  radius: 20,
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blue.withOpacity(0.2),
                      spreadRadius: 2.5,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: CircularPercentIndicator(
                            radius: 25,
                            lineWidth: 3,
                            animation: true,
                            percent: 0.30,
                            center: new Text(
                              "30%",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: AppColor.blue,
                            backgroundColor: AppColor.lightGrey2,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature MNOP',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Due date: 23 / 12 / 22',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  '30/100',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        AppIcon(
                            svgPath: 'assets/svgs/arrow-right.svg',
                            size: 20,
                            editColor: true,
                            color: AppColor.grey),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 16,
            ),
            AppCard(
                height: 80,
                width: 320,
                radius: 20,
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blue.withOpacity(0.2),
                    spreadRadius: 2.5,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: CircularPercentIndicator(
                          radius: 25,
                          lineWidth: 3,
                          animation: true,
                          percent: 0.30,
                          center: new Text(
                            "30%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColor.blue,
                          backgroundColor: AppColor.lightGrey2,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feature MNOP',
                            style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due date: 23 / 12 / 22',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                '30/100',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/arrow-right.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.grey),
                    ],
                  ),
                ]),
            SizedBox(
              height: 16,
            ),
            AppCard(
                height: 80,
                width: 320,
                radius: 20,
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blue.withOpacity(0.2),
                    spreadRadius: 2.5,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: CircularPercentIndicator(
                          radius: 25,
                          lineWidth: 3,
                          animation: true,
                          percent: 0.30,
                          center: new Text(
                            "30%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColor.blue,
                          backgroundColor: AppColor.lightGrey2,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feature MNOP',
                            style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due date: 23 / 12 / 22',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                '30/100',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/arrow-right.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.grey),
                    ],
                  ),
                ]),
            SizedBox(
              height: 16,
            ),
            AppCard(
                height: 80,
                width: 320,
                radius: 20,
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blue.withOpacity(0.2),
                    spreadRadius: 2.5,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: CircularPercentIndicator(
                          radius: 25,
                          lineWidth: 3,
                          animation: true,
                          percent: 0.30,
                          center: new Text(
                            "30%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColor.blue,
                          backgroundColor: AppColor.lightGrey2,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feature MNOP',
                            style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due date: 23 / 12 / 22',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                '30/100',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/arrow-right.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.grey),
                    ],
                  ),
                ]),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => CompletedTaskView());
              },
              child: AppCard(
                  height: 80,
                  width: 320,
                  radius: 20,
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blue.withOpacity(0.2),
                      spreadRadius: 2.5,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColor.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '100%',
                              style: AppBasicStyle(
                                fontColor: AppColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature MNOP',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Due date: 23 / 12 / 22',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  '30/100',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        AppIcon(
                            svgPath: 'assets/svgs/arrow-right.svg',
                            size: 20,
                            editColor: true,
                            color: AppColor.grey),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 16,
            ),
            AppCard(
                height: 80,
                width: 320,
                radius: 20,
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blue.withOpacity(0.2),
                    spreadRadius: 2.5,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '100%',
                            style: AppBasicStyle(
                              fontColor: AppColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feature MNOP',
                            style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due date: 23 / 12 / 22',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                '30/100',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/arrow-right.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.grey),
                    ],
                  ),
                ]),
            SizedBox(
              height: 16,
            ),
            AppCard(
                height: 80,
                width: 320,
                radius: 20,
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blue.withOpacity(0.2),
                    spreadRadius: 2.5,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '100%',
                            style: AppBasicStyle(
                              fontColor: AppColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feature MNOP',
                            style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due date: 23 / 12 / 22',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                '30/100',
                                style: AppBasicStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      AppIcon(
                          svgPath: 'assets/svgs/arrow-right.svg',
                          size: 20,
                          editColor: true,
                          color: AppColor.grey),
                    ],
                  ),
                ]),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
