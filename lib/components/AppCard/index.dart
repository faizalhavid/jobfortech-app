import 'package:flutter/material.dart';

import 'package:jobfortech/constant/theme.dart';

Container AppCard({
  List<Widget>? children,
  double width = 200,
  double height = 150,
  Color? color = AppColor.blue,
  double radius = 30,
  bool horizontal = false,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: horizontal
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children ?? [],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children ?? [],
            ),
    ),
  );
}
