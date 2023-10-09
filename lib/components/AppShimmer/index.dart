import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:shimmer/shimmer.dart';

Shimmer AppShimmer({
  Color baseColor = AppColor.smoke,
  Color highlightColor = AppColor.lightGrey2,
  required Widget child,
  bool isBlur = false,
}) {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: isBlur
        ? BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: child,
          )
        : child,
  );
}
