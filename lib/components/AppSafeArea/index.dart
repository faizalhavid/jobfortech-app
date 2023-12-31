import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ListView AppSafeArea(
    {List<Widget>? children,
    Map<String, double> safearea = const {'horizontal': 40, 'vertical': 90},
    double spacing = 10,
    bool isScrollable = true,
    bool isLoading = true,
    Axis scrollDirection = Axis.vertical}) {
  return ListView(
    scrollDirection: scrollDirection,
    physics: isScrollable ? null : NeverScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(
        horizontal: safearea['horizontal']!, vertical: safearea['vertical']!),
    children: children!
        .map((e) => Padding(
              padding: EdgeInsets.only(bottom: spacing),
              child: e,
            ))
        .toList(),
  );
}
