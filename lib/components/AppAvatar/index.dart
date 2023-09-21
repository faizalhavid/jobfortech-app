import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobfortech/constant/theme.dart';

CircleAvatar AppAvatar({
  double? radius,
  Color outlineColor = AppColor.white,
  Color backgroundColor = AppColor.blue,
  ImageProvider? image,
}) {
  return CircleAvatar(
      radius: (radius ?? 20) + 2,
      backgroundColor: outlineColor,
      child: CircleAvatar(
        radius: radius ?? 20,
        backgroundColor: backgroundColor,
        child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              color: Colors.transparent,
              image: DecorationImage(
                image: image ?? AssetImage('assets/images/default-avatar.png'),
                fit: BoxFit.cover, // atau sesuaikan dengan kebutuhan Anda
              ),
            )),
      ));
}
