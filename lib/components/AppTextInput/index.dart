import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

TextField AppTextInput({
  String hintText = 'TextInput hint',
  String labelText = 'TextInput label',
  String errorText = 'TextInput error',
  bool obscureText = false,
  Widget? suffix,
  Widget? prefix,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  bool readOnly = false,
  Function(String)? onChanged,
  // required TextInputAction textInputAction,
  // required FocusNode focusNode,
  // required Function(String) validator,
  // required Function(String) onFieldSubmitted,
  // required Function(String) onChanged,
}) {
  return TextField(
    controller: controller, readOnly: readOnly,
    onChanged: onChanged,
    decoration: AppTextInputDecoration(
      suffix: suffix,
      prefix: prefix,
      hintText: hintText,
      labelText: labelText,
    ),
    obscureText: obscureText,
    keyboardType: keyboardType,
    // textInputAction: textInputAction,
    // focusNode: focusNode,
    // onChanged: onChanged,
    // onSubmitted: onFieldSubmitted,
  );
}

InputDecoration AppTextInputDecoration({
  Widget? suffix,
  required String hintText,
  required String labelText,
  Widget? prefix,
  EdgeInsets contentPadding = const EdgeInsets.all(0),
}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: suffix,
    suffixStyle: AppBasicStyle(fontSize: 12),
    prefixIcon: prefix,
    prefixStyle: AppBasicStyle(fontSize: 12),
    hintText: hintText,
    labelText: labelText,
    contentPadding: contentPadding,
    labelStyle: AppBasicStyle(
      fontColor: AppColor.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.start,
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.grey,
        width: 1,
      ),
    ),
  );
}
