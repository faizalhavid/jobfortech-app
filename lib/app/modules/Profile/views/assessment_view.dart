import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Profile/views/language_view.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class AssessmentView extends StatefulWidget {
  const AssessmentView({Key? key}) : super(key: key);

  @override
  _WorkDetailViewState createState() =>
      _WorkDetailViewState(); // Perubahan di sini
}

class _WorkDetailViewState extends State<AssessmentView> {
  bool isChecked2 = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.blue;
    }
    return AppColor.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
          title: Text('Profile Assessment',
              style: AppBasicStyle(
                  fontSize: 16,
                  fontColor: AppColor.white,
                  fontWeight: FontWeight.w600)),
          automaticallyImplyLeading: true),
      body: AppSafeArea(safearea: {
        'horizontal': 20,
        'vertical': 20
      }, children: [
        Column(
          children: [
            Text(
              'Before you start you need to complete these profile assessment',
              style: AppBasicStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            AppCard(
              height: 80,
              width: Get.width,
              radius: 20,
              color: AppColor.white,
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
                  children: [
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isChecked2 = !isChecked2;
                            });
                          },
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  value: isChecked2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked2 = value!;
                                    });
                                  },
                                  checkColor: Colors.white,
                                ),
                              ),
                            ),
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
                          'Profile Check',
                          style: AppBasicStyle(
                              fontColor: AppColor.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '*Required',
                          style: AppBasicStyle(
                              fontSize: 12,
                              fontColor: AppColor.red,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Spacer(),
                    AppIconButton(
                        svgPath: 'assets/svgs/arrow-right.svg',
                        size: 25,
                        color: AppColor.grey,
                        editColor: true,
                        onPressed: () {})
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => LanguageView());
              },
              child: AppCard(
                height: 80,
                width: Get.width,
                radius: 20,
                color: AppColor.white,
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
                    children: [
                      ClipOval(
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isChecked2 = !isChecked2;
                              });
                            },
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Center(
                                child: Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    value: isChecked2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked2 = value!;
                                      });
                                    },
                                    checkColor: Colors.white,
                                  ),
                                ),
                              ),
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
                            'Language & Personality Test',
                            style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '*Required',
                            style: AppBasicStyle(
                                fontSize: 12,
                                fontColor: AppColor.red,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Spacer(),
                      AppIconButton(
                          svgPath: 'assets/svgs/arrow-right.svg',
                          size: 25,
                          color: AppColor.grey,
                          editColor: true,
                          onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            AppCard(
              height: 80,
              width: Get.width,
              radius: 20,
              color: AppColor.white,
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
                  children: [
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isChecked2 = !isChecked2;
                            });
                          },
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  value: isChecked2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked2 = value!;
                                    });
                                  },
                                  checkColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Skill Test',
                      style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    AppIconButton(
                        svgPath: 'assets/svgs/arrow-right.svg',
                        size: 25,
                        color: AppColor.grey,
                        editColor: true,
                        onPressed: () {})
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            AppCard(
              height: 80,
              width: Get.width,
              radius: 20,
              color: AppColor.white,
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
                  children: [
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isChecked2 = !isChecked2;
                            });
                          },
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  value: isChecked2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked2 = value!;
                                    });
                                  },
                                  checkColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Project Test',
                      style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    AppIconButton(
                        svgPath: 'assets/svgs/arrow-right.svg',
                        size: 25,
                        color: AppColor.grey,
                        editColor: true,
                        onPressed: () {})
                  ],
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
