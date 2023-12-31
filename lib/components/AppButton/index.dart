import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

ElevatedButton AppButton({
  required Widget child,
  required Function() onPressed,
  Color backgroundColor = AppColor.darkBlue,
  Color? overlayColor = AppColor.lightBlue,
  double width = double.infinity,
  double height = 48,
  double borderRadius = 99,
  String type = 'default',
  Widget? prefix,
  Widget? suffix,
  double spacing = 8,
  Color outlineColor = AppColor.whitebone,
  FocusNode? focusNode,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    focusNode: focusNode,
    style: AppButtonStyle(
      type: type,
      backgroundColor: backgroundColor,
      width: width,
      height: height,
      borderRadius: borderRadius,
      outlineColor: outlineColor,
      overlayColor: overlayColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefix != null) prefix,
        SizedBox(
          width: spacing,
        ),
        child,
        SizedBox(
          width: spacing,
        ),
        if (suffix != null) suffix,
      ],
    ),
  );
}

ButtonStyle AppButtonStyle({
  required String type,
  required Color backgroundColor,
  required double width,
  required double height,
  required double borderRadius,
  Color outlineColor = AppColor.whitebone,
  Color? overlayColor = AppColor.lightBlue,
}) {
  ButtonStyle buttonStyle;

  switch (type) {
    case 'default':
      buttonStyle = ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.1),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        overlayColor: MaterialStateProperty.all<Color>(overlayColor!),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      );
      break;

    case 'outline':
      buttonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(AppColor.lightBlue),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        elevation: MaterialStateProperty.all<double>(0.0),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: outlineColor,
              )),
        ),
      );
      break;

    case 'disabled':
      buttonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(AppColor.grey),
        backgroundColor: MaterialStateProperty.all<Color>(AppColor.lightGrey2),
        foregroundColor: MaterialStateProperty.all<Color>(AppColor.grey),
        elevation: MaterialStateProperty.all<double>(0.0),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      );
      break;

    default:
      buttonStyle = ButtonStyle();
  }

  return ElevatedButton.styleFrom().merge(buttonStyle);
}
