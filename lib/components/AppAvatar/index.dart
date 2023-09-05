import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

CircleAvatar AppAvatar({double? radius = 20}) {
  return CircleAvatar(
    radius: radius,
    backgroundImage: AssetImage('assets/images/default-avatar.png'),
  );
}
