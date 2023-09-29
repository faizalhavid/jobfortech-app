import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:shimmer/shimmer.dart';

Shimmer AppShimmer(
    {Color baseColor = AppColor.smoke,
    Color highlightColor = AppColor.lightGrey2,
    required Widget child}) {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: child,
  );
}
