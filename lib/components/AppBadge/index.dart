import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

Container AppBadge({
  Widget? child,
  Color? backgroundColor = AppColor.red,
  double width = 10,
  double height = 2,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: child,
  );
}
