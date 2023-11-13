import 'package:flutter/material.dart';

import 'package:jobfortech2/constant/theme.dart';

Ink AppCard({
  List<Widget>? children,
  double width = 200,
  double? height,
  double spacing = 20,
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
      boxShadow: boxShadow,
      border: is_outline
          ? Border.all(
              color: outline_color,
              width: 2,
            )
          : null,
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: horizontal
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children
                        ?.map((child) => Padding(
                              padding: EdgeInsets.only(right: spacing),
                              child: child,
                            ))
                        .toList() ??
                    [],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children
                        ?.map((child) => Padding(
                              padding: EdgeInsets.only(bottom: spacing),
                              child: child,
                            ))
                        .toList() ??
                    [],
              ),
      ),
    ),
  );
}
