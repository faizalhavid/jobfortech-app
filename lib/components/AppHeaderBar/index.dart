import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

AppBar AppHeaderbar({
  required Widget title,
  bool centerTitle = true,
  bool automaticallyImplyLeading = true,
  Widget? actions,
  PreferredSizeWidget? bottom,
  double? elevation,
  Color? backgroundColor,
  Brightness? brightness,
  IconThemeData? iconTheme,
  TextTheme? textTheme,
  bool primary = true,
  double? titleSpacing,
  bool expandAppbar = false,
  String type = 'dashboard',
  double? toolbarHeight,
  double? leadingWidth,
  bool? backwardsCompatibility,
  Widget? leading,
  ShapeBorder? shape,
  Color? shadowColor,
  Key? key,
}) {
  return AppBar(
    title: Padding(padding: const EdgeInsets.only(top: 30), child: title),
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
    actions: [
      Padding(
          padding: const EdgeInsets.only(top: 20, right: 20), child: actions)
    ],
    bottom: expandAppbar ? AppHeaderBottom(type: type) : null,
    elevation: 0,
    backgroundColor: backgroundColor,
    iconTheme: iconTheme,
    primary: primary,
    titleSpacing: titleSpacing,
    toolbarHeight: toolbarHeight,
    leading: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25), child: leading),
    shape: shape,
    shadowColor: shadowColor,
    key: key,
  );
}

PreferredSize AppHeaderBottom({required String type}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150),
    child: Container(
      color: AppColor.blue,
      height: 135,
      alignment: Alignment.center,
      child: AppHeaderContent(type: type),
    ),
  );
}

Container AppHeaderContent({
  required String type,
}) {
  Container typeContent;
  switch (type) {
    case 'dashboard':
      typeContent = Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: AppBasicStyle(fontColor: AppColor.white),
                    ),
                    Row(
                      children: [
                        Text(
                          'Jaxson Rosser',
                          style: AppBasicStyle(
                            fontColor: AppColor.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 5),
                        AppIcon(
                          svgPath: 'assets/svgs/verified-check.svg',
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available',
                      style: AppBasicStyle(fontColor: AppColor.white),
                    ),
                    Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: true,
                      onChanged: (value) {
                        value = !value;
                      },
                      hoverColor: AppColor.white,
                      focusColor: AppColor.white,
                      inactiveThumbColor: AppColor.grey,
                      inactiveTrackColor: AppColor.grey,
                      thumbColor:
                          MaterialStateProperty.all<Color>(AppColor.white),
                      trackColor:
                          MaterialStateProperty.all<Color>(AppColor.tosca),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/images/fe-icon.png', fit: BoxFit.cover),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Front-End Developer',
                      style: AppBasicStyle(
                          fontColor: AppColor.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        AppBadge(
                          child: Text(
                            'Rockstar',
                            style: AppBasicStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          backgroundColor: AppColor.white,
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star,
                            color: AppColor.yellow, size: 16),
                        Text(
                          '4.9',
                          style: AppBasicStyle(
                            fontSize: 14,
                            fontColor: AppColor.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
      break;

    case 'work-desk':
      typeContent = AppCard(
          color: AppColor.white,
          height: 100,
          width: Get.width,
          children: [
            Row(
              children: [
                Text('new assignment',
                    style: AppBasicStyle(fontWeight: FontWeight.w600))
              ],
            )
          ]);
      break;

    default:
      typeContent = Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'JobForTech',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      );
  }
  return typeContent;
}
