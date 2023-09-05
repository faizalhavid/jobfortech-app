import 'package:flutter/material.dart';

ListView Hstack({List<Widget>? children, double spacing = 10}) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: children!
        .map((e) => Padding(
              padding: EdgeInsets.only(right: spacing),
              child: e,
            ))
        .toList(),
  );
}
