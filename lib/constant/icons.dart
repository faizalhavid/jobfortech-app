import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/theme.dart';

SvgPicture AppIcon({
  required String svgPath,
  double size = 12.0,
  bool editColor = false,
  Color color = AppColor.blue,
}) {
  return SvgPicture.asset(
    svgPath,
    width: size,
    height: size,
    colorFilter: editColor ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}

Stack AppIconButton({
  required String svgPath,
  required Function() onPressed,
  double size = 24.0,
  Color color = AppColor.blue,
  bool isbadge = false,
}) {
  return Stack(
    children: [
      IconButton(
        onPressed: onPressed,
        splashRadius: 20,
        icon: AppIcon(
          svgPath: svgPath,
          size: size,
          color: color,
        ),
      ),
      if (isbadge) // Hanya menambahkan Positioned jika isbadge true
        const Positioned(
          top: 6,
          right: 8,
          child: Icon(Icons.brightness_1, size: 8, color: AppColor.red),
        ),
    ],
  );
}

CircleAvatar AppSkillsIcon({required String skill}) {
  var svgPath = '';

  switch (skill) {
    case 'javascript':
      svgPath = 'assets/svgs/nodejs-logo.svg';
      break;
    case 'golang':
      svgPath = 'assets/svgs/golang-logo.svg';
      break;
    case 'python':
      svgPath = 'assets/svgs/phyton-logo.svg';
      break;
    case 'php':
      svgPath = 'assets/svgs/php-logo.svg';
      break;
    case 'java':
      svgPath = 'assets/svgs/java-logo.svg';
      break;
    default:
      svgPath = 'assets/svgs/golang-logo.svg';
  }

  return CircleAvatar(
    backgroundColor: AppColor.white,
    child: SvgPicture.asset(
      svgPath,
      width: 35,
      height: 35,
    ),
  );
}
