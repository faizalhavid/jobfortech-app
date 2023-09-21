import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class TeamProfileView extends GetView {
  const TeamProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Team Profile'),
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
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppAvatar(
                                radius: 40,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Makenna Donin',
                                    style: AppBasicStyle(
                                        fontColor: AppColor.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.verified_outlined,
                                    size: 15,
                                    color: AppColor.darkBlue,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: AppColor.lightGrey2,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Back End Developer',
                                style: AppBasicStyle(
                                  fontColor: AppColor.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppBadge(
                                    height: 3,
                                    width: 10,
                                    backgroundColor: AppColor.lightBlue,
                                    child: Text(
                                      'Senior',
                                      style: AppBasicStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: AppColor.yellow,
                                    size: 14,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            AppIcon(svgPath: 'assets/svgs/email.svg', size: 20),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Carrollfisher@.example.com',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            AppIcon(svgPath: 'assets/svgs/phone.svg', size: 20),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '(+14) 81-4121-412',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            AppIcon(
                                svgPath: 'assets/svgs/location.svg', size: 20),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '141B, Baker Street ',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Social Media',
                              style: AppBasicStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            AppIcon(
                              svgPath: 'assets/svgs/social-media-logo.svg',
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              'assets/images/github.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/dribbble.svg', size: 20)
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Project',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  '12',
                                  style: AppBasicStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Outsource',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  '4',
                                  style: AppBasicStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Skills',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: 110,
                                  child: Stack(
                                    children: [
                                      AppIcon(
                                          svgPath:
                                              'assets/svgs/nodejs-logo.svg',
                                          size: 35),
                                      Positioned(
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: AppColor.lightBlue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: AppIcon(
                                              svgPath:
                                                  'assets/svgs/golang-logo.svg',
                                              size: 40),
                                        ),
                                        left: 18,
                                      ),
                                      Positioned(
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: AppIcon(
                                              svgPath:
                                                  'assets/svgs/phyton-logo.svg',
                                              size: 30),
                                        ),
                                        left: 36,
                                      ),
                                      Positioned(
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: AppIcon(
                                              svgPath:
                                                  'assets/svgs/java-logo.svg',
                                              size: 30),
                                        ),
                                        left: 54,
                                      ),
                                      Positioned(
                                        child: AppIcon(
                                            svgPath: 'assets/svgs/php-logo.svg',
                                            size: 35),
                                        left: 72,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Latest Client',
                          style: AppBasicStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontColor: AppColor.black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/company-01.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Image.asset(
                                  'assets/images/company-02.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Image.asset(
                                  'assets/images/company-03.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Image.asset(
                                  'assets/images/company-04.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Image.asset(
                                  'assets/images/company-05.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/company-06.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Image.asset(
                                  'assets/images/company-07.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Image.asset(
                                  'assets/images/company-08.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ));
  }
}
