import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

Container AppBadge({
  Widget? child,
  Color? backgroundColor = AppColor.red,
  double width = 10,
  double height = 2,
  double radius = 30,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: child,
  );
}

InkWell AppBadgeButton({
  Widget? child,
  Color? backgroundColor = AppColor.red,
  double width = 10,
  double height = 2,
  double radius = 30,
  Function()? onPressed,
}) {
  return InkWell(
    splashColor: AppColor.grey,
    highlightColor: AppColor.blue,
    onTap: onPressed,
    child: AppBadge(
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      child: child,
      radius: radius,
    ),
  );
}