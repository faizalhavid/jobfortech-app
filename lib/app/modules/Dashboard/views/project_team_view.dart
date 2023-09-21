import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/views/team_profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class ProjectTeamView extends GetView {
  const ProjectTeamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Team'),
      ),
      body: AppSafeArea(
        safearea: {'horizontal': 3, 'vertical': 10},
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.to(() => TeamProfileView());
                  },
                  child: AppCard(
                    height: 100,
                    width: 350,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppAvatar(radius: 20),
                          SizedBox(
                            width: 16,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Makenna Carder',
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
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Front End Developer',
                                    style: AppBasicStyle(
                                        fontSize: 12, fontColor: AppColor.grey),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
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
                                      SizedBox(
                                        width: 8,
                                      ),
                                      AppBadge(
                                          height: 3,
                                          width: 10,
                                          backgroundColor: AppColor.lightBlue,
                                          child: Text(
                                            'Senior',
                                            style: AppBasicStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              AppIcon(
                                  svgPath: 'assets/svgs/document-text.svg',
                                  size: 25)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                AppCard(
                  height: 100,
                  width: 350,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppAvatar(radius: 20),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Makenna Carder',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Front End Developer',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    AppBadge(
                                        height: 3,
                                        width: 10,
                                        backgroundColor: AppColor.lightBlue,
                                        child: Text(
                                          'Senior',
                                          style: AppBasicStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/document-text.svg',
                                size: 25)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                AppCard(
                  height: 100,
                  width: 350,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppAvatar(radius: 20),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Makenna Carder',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Front End Developer',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    AppBadge(
                                        height: 3,
                                        width: 10,
                                        backgroundColor: AppColor.lightBlue,
                                        child: Text(
                                          'Senior',
                                          style: AppBasicStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/document-text.svg',
                                size: 25)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                AppCard(
                  height: 100,
                  width: 350,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppAvatar(radius: 20),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Makenna Carder',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Front End Developer',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    AppBadge(
                                        height: 3,
                                        width: 10,
                                        backgroundColor: AppColor.lightBlue,
                                        child: Text(
                                          'Senior',
                                          style: AppBasicStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/document-text.svg',
                                size: 25)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                AppCard(
                  height: 100,
                  width: 350,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppAvatar(radius: 20),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Makenna Carder',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Front End Developer',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    AppBadge(
                                        height: 3,
                                        width: 10,
                                        backgroundColor: AppColor.lightBlue,
                                        child: Text(
                                          'Senior',
                                          style: AppBasicStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/document-text.svg',
                                size: 25)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                AppCard(
                  height: 100,
                  width: 350,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppAvatar(radius: 20),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Makenna Carder',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Front End Developer',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    AppBadge(
                                        height: 3,
                                        width: 10,
                                        backgroundColor: AppColor.lightBlue,
                                        child: Text(
                                          'Senior',
                                          style: AppBasicStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/document-text.svg',
                                size: 25)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                AppCard(
                  height: 100,
                  width: 350,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppAvatar(radius: 20),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Makenna Carder',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Front End Developer',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    AppBadge(
                                        height: 3,
                                        width: 10,
                                        backgroundColor: AppColor.lightBlue,
                                        child: Text(
                                          'Senior',
                                          style: AppBasicStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/document-text.svg',
                                size: 25)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                AppCard(
                  height: 100,
                  width: 350,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppAvatar(radius: 20),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Makenna Carder',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Front End Developer',
                                  style: AppBasicStyle(
                                      fontSize: 12, fontColor: AppColor.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    AppBadge(
                                        height: 3,
                                        width: 10,
                                        backgroundColor: AppColor.lightBlue,
                                        child: Text(
                                          'Senior',
                                          style: AppBasicStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AppIcon(
                                svgPath: 'assets/svgs/document-text.svg',
                                size: 25)
                          ],
                        )
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
