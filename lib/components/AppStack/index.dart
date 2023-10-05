import 'package:flutter/material.dart';

Container AppStack({
  List<Widget>? children,
  double spacing = 10,
  Color? backgroundcolor,
  Map<String, double> safearea = const {'horizontal': 0, 'vertical': 0},
  MainAxisAlignment mAlignment = MainAxisAlignment.start,
  CrossAxisAlignment cAlignment = CrossAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
}) {
  return Container(
    color: backgroundcolor ?? null,
    padding: EdgeInsets.symmetric(
        horizontal: safearea['horizontal']!, vertical: safearea['vertical']!),
    child: Column(
      mainAxisAlignment: mAlignment,
      crossAxisAlignment: cAlignment,
      mainAxisSize: mainAxisSize,
      children: children!
          .map((e) => Padding(
                padding: EdgeInsets.only(bottom: spacing),
                child: e,
              ))
          .toList(),
    ),
  );
}
