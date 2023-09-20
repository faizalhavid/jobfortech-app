import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/views/work_detail_view.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class FindWorksView extends GetView {
  const FindWorksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> TopIndustri = [
      'Fintech',
      'Ecommerce',
      'Website',
      'Fintech',
      'Ecommerce',
      'Website',
      'Fintech',
      'Ecommerce',
      'Website'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Works'),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Works',
                          style: AppTitleHeader,
                        ),
                        AppIconButton(
                            svgPath: 'assets/svgs/refresh.svg',
                            onPressed: () {})
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        AppCard(
                          height: 190,
                          width: 150,
                          radius: 15,
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
                                Image.asset(
                                  'assets/images/company.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Spacer(),
                                AppIcon(
                                    svgPath: 'assets/svgs/arrow-right.svg',
                                    size: 18)
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'E-Commerce Project',
                              style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Company Name',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 11),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' BE : ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey, fontSize: 7),
                                ),
                                Text(
                                  ' 2/3  ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.blue,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' FE : ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey, fontSize: 7),
                                ),
                                Text(
                                  ' 1/3  ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.blue,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' MF : ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey, fontSize: 7),
                                ),
                                Text(
                                  ' 3/3  ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.blue,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        AppCard(
                          height: 190,
                          width: 150,
                          radius: 15,
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
                                Image.asset(
                                  'assets/images/company.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Spacer(),
                                AppIcon(
                                    svgPath: 'assets/svgs/arrow-right.svg',
                                    size: 18)
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'E-Commerce Project',
                              style: AppBasicStyle(
                                fontColor: AppColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Company Name',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 11),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' BE : ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey, fontSize: 7),
                                ),
                                Text(
                                  ' 2/3  ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.blue,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' FE : ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey, fontSize: 7),
                                ),
                                Text(
                                  ' 1/3  ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.blue,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' MF : ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey, fontSize: 7),
                                ),
                                Text(
                                  ' 3/3  ',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.blue,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    AppCard(
                      height: 190,
                      width: 150,
                      radius: 15,
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
                            Image.asset(
                              'assets/images/company.png',
                              width: 50,
                              height: 50,
                            ),
                            Spacer(),
                            AppIcon(
                                svgPath: 'assets/svgs/arrow-right.svg',
                                size: 18)
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'E-Commerce Project',
                          style: AppBasicStyle(
                            fontColor: AppColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Company Name',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey, fontSize: 11),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' BE : ',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 7),
                            ),
                            Text(
                              ' 2/3  ',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue,
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' FE : ',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 7),
                            ),
                            Text(
                              ' 1/3  ',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue,
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' MF : ',
                              style: AppBasicStyle(
                                  fontColor: AppColor.grey, fontSize: 7),
                            ),
                            Text(
                              ' 3/3  ',
                              style: AppBasicStyle(
                                  fontColor: AppColor.blue,
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Text(
                          'Find Job',
                          style: AppTitleHeader,
                        ),
                        Spacer(),
                        AppIconButton(
                            svgPath: 'assets/svgs/card.svg', onPressed: () {})
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: TopIndustri.length,
                        padding: EdgeInsets.only(
                            bottom: 10.0, left: 5.0, right: 5.0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => WorkDetailView());
                            },
                            child: AppCard(
                                color: AppColor.white,
                                width: 230,
                                height: 100,
                                radius: 15,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/company-2.png',
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Mobile Dev',
                                            style: AppBasicStyle(
                                              fontColor: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Company Name',
                                            style: AppBasicStyle(
                                              fontColor: AppColor.grey,
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            'Flutter, Middle, Freelance',
                                            style: AppBasicStyle(
                                              fontColor: AppColor.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              AppIcon(
                                                  svgPath:
                                                      'assets/svgs/dolar.svg'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'IDR 6.5 - 8 jt',
                                                style: AppBasicStyle(
                                                  fontColor: AppColor.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
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
