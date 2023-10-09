import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

Column AppDropDown(
    {required String label,
    String hintText = 'Select',
    String errorText = 'Invalid',
    Function(String)? onChanged,
    required List<String> items,
    required TextEditingController controller,
    Widget Function(BuildContext, String)? listItemBuilder}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: AppBasicStyle(
          fontColor: AppColor.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      CustomDropdown(
        excludeSelected: true,
        onChanged: onChanged,
        listItemBuilder: listItemBuilder,
        items: items,
        controller: controller,
        hintText: hintText,
        errorText: errorText,
      ),
    ],
  );
}
