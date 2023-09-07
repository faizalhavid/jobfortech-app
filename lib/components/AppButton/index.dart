import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

ElevatedButton AppButton(
    {required String text,
    required Function() onPressed,
    Color backgroundColor = AppColor.darkBlue,
    Color textColor = Colors.white,
    double width = double.infinity,
    double height = 48,
    double borderRadius = 99,
    String type = 'default',
    Widget? prefix,
    Widget? suffix,
    double spacing = 8}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: AppButtonStyle(
      type: type,
      backgroundColor: backgroundColor,
      textColor: textColor,
      width: width,
      height: height,
      borderRadius: borderRadius,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefix != null) prefix,
        SizedBox(
          width: spacing,
        ),
        Text(
          text,
          style: AppBasicStyle(
              fontSize: 16,
              fontColor: type == 'default' ? AppColor.white : AppColor.darkBlue,
              fontWeight: FontWeight.bold),
        ),
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
  required Color textColor,
  required double width,
  required double height,
  required double borderRadius,
}) {
  ButtonStyle buttonStyle;

  switch (type) {
    case 'default':
      buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(textColor),
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
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        elevation: MaterialStateProperty.all<double>(0.0),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: backgroundColor),
          ),
        ),
      );
      break;

    default:
      buttonStyle = ButtonStyle();
  }

  return ElevatedButton.styleFrom().merge(buttonStyle);
}
