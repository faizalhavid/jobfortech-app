import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class CompletedTaskView extends GetView {
  const CompletedTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.5,
        title: Row(
          children: [
            const Text('Completed Task'),
            SizedBox(
              width: 120,
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
      body: AppSafeArea(
        safearea: {'horizontal': 8, 'vertical': 10},
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wednesday 21/12/22',
                      style: AppBasicStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tuesday 20/12/22',
                      style: AppBasicStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monday 20/12/22',
                      style: AppBasicStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature ABCD',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Task 26',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '13:32',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 12),
                        )
                      ],
                    ),
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
