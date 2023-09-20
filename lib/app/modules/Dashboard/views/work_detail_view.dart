import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkDetailView extends StatefulWidget {
  const WorkDetailView({Key? key}) : super(key: key);

  @override
  _WorkDetailViewState createState() => _WorkDetailViewState();
}

class _WorkDetailViewState extends State<WorkDetailView> {
  bool isChecked = false;
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
    return AppColor.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Detail'),
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
                      'E- Commerce Project',
                      style: AppTitleHeader,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'assets/images/company-2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Company Name',
                          style: AppBasicStyle(
                              fontColor: AppColor.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        AppIconButton(
                            svgPath: 'assets/svgs/drop-down-up-outline.svg',
                            onPressed: () {})
                      ],
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet vulputate sit molestie varius. Fringilla molestie amet vulputate sit molestie varius. Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet vulputate sit molestie varius. Fringilla molestie amet vulputate sit molestie varius.',
                      style: AppBasicStyle(
                        fontSize: 13,
                        fontColor: AppColor.grey,
                        height: 2,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        AppBadge(
                            showOutline: true,
                            backgroundColor: AppColor.white,
                            width: 12,
                            height: 5,
                            child: Text(
                              'Mobile',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue, fontSize: 9),
                            )),
                        SizedBox(
                          width: 6,
                        ),
                        AppBadge(
                            showOutline: true,
                            backgroundColor: AppColor.white,
                            width: 12,
                            height: 5,
                            child: Text(
                              'Front End',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue, fontSize: 9),
                            )),
                        SizedBox(
                          width: 6,
                        ),
                        AppBadge(
                            showOutline: true,
                            backgroundColor: AppColor.white,
                            width: 12,
                            height: 5,
                            child: Text(
                              'Back End',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue, fontSize: 9),
                            )),
                        SizedBox(
                          width: 6,
                        ),
                        AppBadge(
                            showOutline: true,
                            backgroundColor: AppColor.white,
                            width: 12,
                            height: 5,
                            child: Text(
                              'E-Commerce',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue, fontSize: 9),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/calender-day.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Posted on 15th dec 22',
                          style: AppBasicStyle(
                              fontColor: AppColor.black,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        AppIcon(svgPath: 'assets/svgs/jam-day.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '3 Months Development',
                          style: AppBasicStyle(
                              fontColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        AppIcon(svgPath: 'assets/svgs/dolar.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'IDR 6,5 - 8 JT',
                          style: AppBasicStyle(
                              fontColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        AppIcon(svgPath: 'assets/svgs/location.svg', size: 20),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Indonesia',
                          style: AppBasicStyle(
                              fontColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Team Profile',
                      style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Front End Dev',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/circle.png',
                          height: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'assets/images/circle.png',
                          height: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        AppAvatar(radius: 10),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '1/3',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Back End Dev',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/circle.png',
                          height: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'assets/images/circle.png',
                          height: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'assets/images/circle.png',
                          height: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '0/3',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Mobile End Dev',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/circle.png',
                          height: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        AppAvatar(radius: 10),
                        SizedBox(
                          width: 4,
                        ),
                        AppAvatar(radius: 10),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '2/3',
                          style: AppBasicStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'One Position left as a Mobile Developer!',
                      style: AppBasicStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        ClipOval(
                          child: Material(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: Center(
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'I agree with the',
                              style: AppBasicStyle(
                                  fontSize: 12, fontColor: AppColor.grey),
                            ),
                            Text(
                              ' Terms and Conditions',
                              style: AppBasicStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
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
                                width: 24,
                                height: 24,
                                child: Center(
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
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'I agree with the',
                              style: AppBasicStyle(
                                  fontSize: 12, fontColor: AppColor.grey),
                            ),
                            Text(
                              ' Privacy Policy',
                              style: AppBasicStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppButton(
                        backgroundColor: AppColor.lightOrange,
                        child: Text(
                          'Waiting Approval',
                          style: AppBasicStyle(
                              fontColor: AppColor.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        suffix: AppIcon(
                            svgPath: 'assets/svgs/time-2.svg', size: 20),
                        onPressed: () {})
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
