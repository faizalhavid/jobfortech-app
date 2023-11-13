import 'package:flutter/material.dart';
import 'package:jobfortech2/constant/theme.dart';

Container AppBadge(
    {Widget? child,
    Color? backgroundColor = AppColor.red,
    double width = 10,
    double height = 2,
    double radius = 30,
    bool showOutline = false,
    Color? outlineColor = AppColor.blue,
    double? padding = 15}) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: padding!, vertical: padding * 0.2),
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      border: showOutline ? Border.all(color: outlineColor!, width: 1) : null,
    ),
    child: Center(child: child),
  );
}

InkWell AppBadgeButton({
  Widget? child,
  Color? backgroundColor = AppColor.red,
  double width = 10,
  double height = 2,
  double radius = 30,
  double? padding = 15,
  Function()? onPressed,
}) {
  return InkWell(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    radius: radius,
    splashColor: AppColor.grey,
    highlightColor: AppColor.grey.withOpacity(0.5),
    onTap: onPressed,
    child: AppBadge(
      padding: padding,
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      child: child,
      radius: radius,
    ),
  );
}
