import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

TextField AppTextInput({
  String hintText = 'TextInput hint',
  String labelText = 'TextInput label',
  String errorText = 'TextInput error',
  bool obscureText = false,
  Widget? suffix,
  Widget prefix = const Text('Prefix'),
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  // required TextInputAction textInputAction,
  // required FocusNode focusNode,
  // required Function(String) validator,
  // required Function(String) onFieldSubmitted,
  // required Function(String) onChanged,
}) {
  return TextField(
    controller: controller,

    decoration: AppTextInputDecoration(
      suffix: suffix,
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
}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: suffix,
    hintText: hintText,
    labelText: labelText,
    labelStyle: AppBasicStyle(
      fontColor: AppColor.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.grey,
        width: 1,
      ),
    ),
  );
}
