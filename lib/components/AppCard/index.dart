import 'package:flutter/material.dart';

import 'package:jobfortech/constant/theme.dart';

Ink AppCard({
  List<Widget>? children,
  double width = 200,
  double height = 150,
  Color? color,
  double radius = 30,
  bool horizontal = false,
  bool is_outline = false,
  Color outline_color = AppColor.blue,
  List<BoxShadow>? boxShadow,
  Function()? onTap,
}) {
  return Ink(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: boxShadow),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      // splashColor: AppColor.blue.withOpacity(0.2),
      child: horizontal
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children ?? [],
              ))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children ?? [],
                //       ),
              ),
            ),
    ),
  );
}
