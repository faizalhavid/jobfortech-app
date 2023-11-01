import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/utils/functions.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/components/TableReportWork/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class DetailParticipantsView extends GetView {
  final User user;
  const DetailParticipantsView({Key? key, required this.user})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> socialMedia = [];
    user.profile!.socialMedia!.forEach((value) {
      final socialName = socialMediaName(value);
      socialMedia.add(socialName);
    });
    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Detail Participants',
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppStack(
              safearea: {'horizontal': 25, 'vertical': 20},
              backgroundcolor: AppColor.white,
              spacing: 10,
              cAlignment: CrossAxisAlignment.center,
              children: [
                AppAvatar(radius: 40, path: user.profile?.photoProfile),
                Container(
                  width: Get.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ' ${user.profile?.firstName} ${user.profile?.lastName}',
                        style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.verified_outlined,
                        size: 16,
                        color: AppColor.darkBlue,
                      ),
                    ],
                  ),
                ),
                Text(
                  user.profile!.position!,
                  style: AppBasicStyle(
                    fontColor: AppColor.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chip(
                      label: Text(
                        'Senior',
                        style: AppBasicStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: AppColor.lightBlue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Chip(
                      avatar: const Icon(
                        Icons.star,
                        color: AppColor.yellow,
                        size: 14,
                      ),
                      label: Text(
                        '4.9',
                        style: AppBasicStyle(
                          fontSize: 14,
                          fontColor: AppColor.yellow,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: AppColor.lightGrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      ' ${user.email}',
                      style:
                          AppBasicStyle(fontColor: AppColor.grey, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading:
                        AppIcon(svgPath: 'assets/svgs/email.svg', size: 24),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      ' ${user.profile?.phoneNumber}',
                      style:
                          AppBasicStyle(fontColor: AppColor.grey, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading:
                        AppIcon(svgPath: 'assets/svgs/phone.svg', size: 24),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      ' ${user.profile?.location}',
                      style:
                          AppBasicStyle(fontColor: AppColor.grey, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading:
                        AppIcon(svgPath: 'assets/svgs/location.svg', size: 24),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    trailing: Wrap(
                      children: [
                        ...socialMedia
                            .map(
                              (e) => Container(
                                width: 35,
                                height: 35,
                                child: AppIcon(
                                  svgPath: 'assets/svgs/${e.toLowerCase()}.svg',
                                ),
                              ),
                            )
                            .toList()
                      ],
                    ),
                    title: Text(
                      'Social Media',
                      style: AppBasicStyle(
                          fontColor: AppColor.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            AppStack(
              safearea: {'horizontal': 25, 'vertical': 20},
              backgroundcolor: AppColor.lightGrey,
              children: [
                buildReportJob(
                  project: '12',
                  outsource: '12',
                  skills: user.profile!.skills!,
                ),
                Text(
                  'Latest Client',
                  style: AppBasicStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontColor: AppColor.black),
                ),
                Wrap(
                  children: [Text('project history')],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
