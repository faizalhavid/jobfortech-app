import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class ReferralProgramView extends GetView {
  const ReferralProgramView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Referral Program')),
        body: AppSafeArea(safearea: {
          'horizontal': 16,
          'vertical': 20
        }, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: [
                Image.asset('assets/images/referral-program.png'),
                SizedBox(
                  height: 22,
                ),
                Text(
                  'Adipiscing, mauris elementum.',
                  style: AppBasicStyle(
                      fontColor: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Mattis odio aliquet dolor tristique volutpat phasellus consequat. Vel viverra.',
                  style: AppBasicStyle(
                    fontSize: 14,
                    fontColor: AppColor.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                AppCard(
                    width: Get.width,
                    height: 50,
                    color: AppColor.lightGrey,
                    radius: 10,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          Text(
                            'JAXONTECH123',
                            style: AppBasicStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                AppIcon(
                                    svgPath: 'assets/svgs/copy.svg', size: 16),
                                Text(
                                  'Copy',
                                  style: AppBasicStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontColor: AppColor.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 160,
                      child: AppButton(
                          text: 'LinkedIn',
                          type: 'outline',
                          prefix: AppIcon(
                              svgPath: 'assets/svgs/social-media-logo.svg',
                              size: 18),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: 160,
                      child: AppButton(
                          text: 'WhatsApp',
                          prefix: AppIcon(
                              svgPath: 'assets/svgs/whatsapp.svg', size: 23),
                          onPressed: () {}),
                    ),
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
