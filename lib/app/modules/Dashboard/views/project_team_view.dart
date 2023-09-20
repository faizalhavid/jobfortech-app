import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectTeamView extends GetView {
  const ProjectTeamView({Key? key}) : super(key: key);
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Row(
                  children: [
                    SizedBox(
                      child: CircularPercentIndicator(
                        radius: 25,
                        lineWidth: 3,
                        animation: true,
                        percent: 0.30,
                        center: new Text(
                          "30%",
                          style: AppBasicStyle(
                            fontColor: AppColor.white,
                            fontSize: 12,
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColor.white,
                        backgroundColor: AppColor.darkBlue,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              '25/100',
                              style: AppBasicStyle(
                                  fontSize: 12, fontColor: AppColor.white),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              'Updated : 23/12/22',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Due : 23/12/22',
                              style: AppBasicStyle(
                                  fontColor: AppColor.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  Text(
                    'On Going',
                    style: AppBasicStyle(
                        fontColor: AppColor.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '5',
                    style: AppBasicStyle(
                        fontColor: AppColor.grey, fontWeight: FontWeight.bold),
                  ),
                  AppIcon(svgPath: 'drop-down-up-outline.svg', size: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
