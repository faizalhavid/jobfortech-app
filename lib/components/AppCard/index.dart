import 'package:flutter/material.dart';

import 'package:jobfortech/constant/theme.dart';

Container AppCard(
    {List<Widget>? children,
    double width = 200,
    double height = 150,
    Color? color = AppColor.blue,
    double radius = 30,
    bool horizontal = false,
    bool is_outline = false,
    Color outline_color = AppColor.blue}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: is_outline ? Border.all(color: outline_color) : null,
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
