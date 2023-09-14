import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class PayrollView extends GetView {
  const PayrollView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payroll'),
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
                          'Payroll',
                          style: AppTitleHeader,
                        ),
                        AppButton(
                            child: Text(
                              'Sign In with Google',
                              style: AppBasicStyle(
                                  fontSize: 16,
                                  fontColor: AppColor.darkBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                            width: 14,
                            borderRadius: 10,
                            onPressed: () {},
                            suffix: AppIcon(
                                svgPath: 'assets/svgs/cash-out.svg', size: 23))
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'Your Balance',
                      style: AppBasicStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontColor: AppColor.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            AppIcon(
                              svgPath: 'assets/svgs/arrows-alt-arrow-down.svg',
                              size: 22,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'IDR',
                              style: AppBasicStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '12.345.678',
                          style: AppBasicStyle(
                              fontSize: 30,
                              fontColor: AppColor.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        AppIcon(
                            svgPath: 'assets/svgs/eye-opened.svg',
                            size: 25,
                            color: AppColor.blue,
                            editColor: true),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/bank-bca.png',
                                width: 45,
                                height: 45,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 9),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Jaxon Rosser',
                                      style: AppBasicStyle(
                                          fontSize: 15,
                                          fontColor: AppColor.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '0123456789',
                                      style: AppBasicStyle(
                                          fontSize: 12,
                                          fontColor: AppColor.grey,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              AppIcon(
                                  svgPath: 'assets/svgs/setting.svg', size: 25),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Incoming Invoice',
                      style: AppBasicStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontColor: AppColor.black),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppCard(
                      width: Get.width,
                      height: 150,
                      color: AppColor.lightBlue,
                      outline_color: AppColor.blue,
                      is_outline: true,
                      radius: 10,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'INV/1235-ABC',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  '12 Dec 2022',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColor.black),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: TextSpan(
                                style: AppBasicStyle(
                                  fontSize: 12,
                                  fontColor: AppColor.black,
                                  fontWeight: FontWeight.w500,
                                ).copyWith(height: 2),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'You receive a new payment from '),
                                  TextSpan(
                                    text: 'Project name/ Company name.',
                                    style: TextStyle(
                                      color: AppColor.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Payment',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  'Rp. 7.200.000',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                AppIcon(
                                    svgPath: 'assets/svgs/download.svg',
                                    size: 18)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppCard(
                      width: Get.width,
                      height: 150,
                      color: Colors.transparent,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'INV/1235-ABC',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  '12 Dec 2022',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColor.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: TextSpan(
                                style: AppBasicStyle(
                                  fontSize: 12,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w500,
                                ).copyWith(height: 2),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'You receive a new payment from '),
                                  TextSpan(
                                    text: 'Project name/ Company name.',
                                    style: TextStyle(
                                      color: AppColor.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Payment',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  'Rp. 7.200.000',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                AppIcon(
                                    svgPath: 'assets/svgs/download.svg',
                                    size: 18)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppCard(
                      width: Get.width,
                      height: 150,
                      color: Colors.transparent,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'INV/1235-ABC',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  '12 Dec 2022',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColor.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: TextSpan(
                                style: AppBasicStyle(
                                  fontSize: 12,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w500,
                                ).copyWith(height: 2),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'You receive a new payment from '),
                                  TextSpan(
                                    text: 'Project name/ Company name.',
                                    style: TextStyle(
                                      color: AppColor.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Payment',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  'Rp. 7.200.000',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                AppIcon(
                                    svgPath: 'assets/svgs/download.svg',
                                    size: 18)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppCard(
                      width: Get.width,
                      height: 150,
                      color: Colors.transparent,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'INV/1235-ABC',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  '12 Dec 2022',
                                  style: AppBasicStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColor.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: TextSpan(
                                style: AppBasicStyle(
                                  fontSize: 12,
                                  fontColor: AppColor.grey,
                                  fontWeight: FontWeight.w500,
                                ).copyWith(height: 2),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'You receive a new payment from '),
                                  TextSpan(
                                    text: 'Project name/ Company name.',
                                    style: TextStyle(
                                      color: AppColor.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Payment',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  'Rp. 7.200.000',
                                  style: AppBasicStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                AppIcon(
                                    svgPath: 'assets/svgs/download.svg',
                                    size: 18)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
