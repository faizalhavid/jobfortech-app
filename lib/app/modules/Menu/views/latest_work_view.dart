import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class LatestWorkView extends GetView {
  const LatestWorkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Latest Work'),
        ),
        body: AppSafeArea(safearea: {
          'horizontal': 8,
          'vertical': 10
        }, children: [
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
                        height: 20,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
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
                                height: 8,
                              ),
                              Text(
                                'Dec 15th, 21 - March 21th, 23',
                                style: AppBasicStyle(
                                    fontSize: 9,
                                    fontColor: AppColor.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  AppBadgeButton(
                                      child: Text(
                                        'Completed',
                                        style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11),
                                      ),
                                      backgroundColor: AppColor.lightBlue,
                                      height: 6),
                                  Spacer(),
                                  Text(
                                    'Your Rating',
                                    style: AppBasicStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 50,
                            right: 0,
                            child: Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
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
                                height: 8,
                              ),
                              Text(
                                'Dec 15th, 21 - March 21th, 23',
                                style: AppBasicStyle(
                                    fontSize: 9,
                                    fontColor: AppColor.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  AppBadgeButton(
                                      child: Text(
                                        'Completed',
                                        style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11),
                                      ),
                                      backgroundColor: AppColor.lightBlue,
                                      height: 6),
                                  Spacer(),
                                  Text(
                                    'Your Rating',
                                    style: AppBasicStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 50,
                            right: 0,
                            child: Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
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
                                height: 8,
                              ),
                              Text(
                                'Dec 15th, 21 - March 21th, 23',
                                style: AppBasicStyle(
                                    fontSize: 9,
                                    fontColor: AppColor.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  AppBadgeButton(
                                      child: Text(
                                        'Completed',
                                        style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11),
                                      ),
                                      backgroundColor: AppColor.lightBlue,
                                      height: 6),
                                  Spacer(),
                                  Text(
                                    'Your Rating',
                                    style: AppBasicStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 50,
                            right: 0,
                            child: Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
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
                                height: 8,
                              ),
                              Text(
                                'Dec 15th, 21 - March 21th, 23',
                                style: AppBasicStyle(
                                    fontSize: 9,
                                    fontColor: AppColor.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  AppBadgeButton(
                                      child: Text(
                                        'Completed',
                                        style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11),
                                      ),
                                      backgroundColor: AppColor.lightBlue,
                                      height: 6),
                                  Spacer(),
                                  Text(
                                    'Your Rating',
                                    style: AppBasicStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 50,
                            right: 0,
                            child: Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
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
                                height: 8,
                              ),
                              Text(
                                'Dec 15th, 21 - March 21th, 23',
                                style: AppBasicStyle(
                                    fontSize: 9,
                                    fontColor: AppColor.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  AppBadgeButton(
                                      child: Text(
                                        'Completed',
                                        style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11),
                                      ),
                                      backgroundColor: AppColor.lightBlue,
                                      height: 6),
                                  Spacer(),
                                  Text(
                                    'Your Rating',
                                    style: AppBasicStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 50,
                            right: 0,
                            child: Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
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
                                height: 8,
                              ),
                              Text(
                                'Dec 15th, 21 - March 21th, 23',
                                style: AppBasicStyle(
                                    fontSize: 9,
                                    fontColor: AppColor.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  AppBadgeButton(
                                      child: Text(
                                        'Completed',
                                        style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11),
                                      ),
                                      backgroundColor: AppColor.lightBlue,
                                      height: 6),
                                  Spacer(),
                                  Text(
                                    'Your Rating',
                                    style: AppBasicStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 50,
                            right: 0,
                            child: Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
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
                                height: 8,
                              ),
                              Text(
                                'Dec 15th, 21 - March 21th, 23',
                                style: AppBasicStyle(
                                    fontSize: 9,
                                    fontColor: AppColor.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  AppBadgeButton(
                                      child: Text(
                                        'Completed',
                                        style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11),
                                      ),
                                      backgroundColor: AppColor.lightBlue,
                                      height: 6),
                                  Spacer(),
                                  Text(
                                    'Your Rating',
                                    style: AppBasicStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 50,
                            right: 0,
                            child: Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ))
        ]));
  }
}
