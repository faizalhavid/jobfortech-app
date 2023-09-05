import 'package:flutter/material.dart';

ListView AppVstack({List<Widget>? children, double spacing = 10}) {
  return ListView(
    children: children!
        .map((e) => Padding(
              padding: EdgeInsets.only(bottom: spacing),
              child: e,
            ))
        .toList(),
  );
}
