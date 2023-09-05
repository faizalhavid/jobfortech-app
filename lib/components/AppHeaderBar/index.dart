import 'package:flutter/material.dart';
import '../../constant/theme.dart';

AppBar AppHeaderbar({
  required String title,
  bool centerTitle = true,
  bool automaticallyImplyLeading = true,
  List<Widget>? actions,
  PreferredSizeWidget? bottom,
  double? elevation,
  Color? backgroundColor,
  Brightness? brightness,
  IconThemeData? iconTheme,
  TextTheme? textTheme,
  bool primary = true,
  double? titleSpacing,
  double? toolbarOpacity,
  double? bottomOpacity,
  double? toolbarHeight,
  double? leadingWidth,
  bool? backwardsCompatibility,
  Widget? leading,
  bool excludeHeaderSemantics = false,
  ShapeBorder? shape,
  Color? shadowColor,
  Key? key,
}) {
  return AppBar(
    title: Text(title,
        style: AppBasicStyle(
          fontSize: 16,
          fontColor: AppColor.white,
          fontWeight: FontWeight.w600,
        )),
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
    actions: actions,
    bottom: bottom,
    elevation: elevation,
    backgroundColor: backgroundColor,
    iconTheme: iconTheme,
    primary: primary,
    titleSpacing: titleSpacing,
    toolbarHeight: toolbarHeight,
    leadingWidth: leadingWidth,
    leading: leading,
    excludeHeaderSemantics: excludeHeaderSemantics,
    shape: shape,
    shadowColor: shadowColor,
    key: key,
  );
}
