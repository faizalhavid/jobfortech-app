import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/theme.dart';

SvgPicture AppIcon({
  required String svgPath,
  double size = 12.0,
  bool isColor = false,
  Color color = AppColor.blue,
}) {
  return SvgPicture.asset(
    svgPath,
    width: size,
    height: size,
    colorFilter: isColor ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}

IconButton AppIconButton({
  required String svgPath,
  required Function() onPressed,
  double size = 24.0,
  Color color = AppColor.blue,
}) {
  return IconButton(
    onPressed: onPressed,
    splashRadius: 20,
    icon: AppIcon(
      svgPath: svgPath,
      size: size,
      color: color,
    ),
  );
}
