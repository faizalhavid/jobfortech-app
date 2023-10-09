import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/constant/theme.dart';

CircleAvatar AppAvatar(
    {double? radius,
    Color outlineColor = AppColor.white,
    Color backgroundColor = AppColor.blue,
    ImageProvider? image,
    String? path}) {
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
            image: path != null
                ? NetworkImage(path)
                : const AssetImage('assets/images/default-avatar.png')
                    as ImageProvider<Object>,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
