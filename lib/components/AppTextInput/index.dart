import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobfortech/constant/theme.dart';

TextFormField AppTextInput({
  String hintText = 'TextInput hint',
  String labelText = 'TextInput label',
  String errorText = 'TextInput error',
  bool obscureText = false,
  Widget? suffix,
  Widget? prefix,
  TextInputType keyboardType = TextInputType.text,
  bool readOnly = false,
  Function(String)? onChanged,
  TextInputAction? textInputAction,
  FocusNode? focusNode,
  String? Function(String?)? validator,
  Function(String)? onFieldSubmitted,
  List<TextInputFormatter>? inputFormatters,
  Function()? onTap,
  int? maxLines = 1,
  TextEditingController? controller,
}) {
  return TextFormField(
    controller: controller,
    inputFormatters: inputFormatters,
    readOnly: readOnly,
    onChanged: onChanged,
    maxLines: maxLines,
    decoration: AppTextInputDecoration(
      suffix: suffix,
      prefix: prefix,
      hintText: hintText,
      labelText: labelText,
    ),
    obscureText: obscureText,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onTap: onTap,
    validator: validator,
  );
}

InputDecoration AppTextInputDecoration({
  Widget? suffix,
  required String hintText,
  required String labelText,
  Widget? prefix,
}) {
  return InputDecoration(
    label: Text(
      labelText,
      style: AppBasicStyle(
        height: 1,
        fontColor: AppColor.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.start,
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: suffix,
    suffixStyle: AppBasicStyle(fontSize: 12),
    prefixIcon: prefix,
    prefixStyle: AppBasicStyle(fontSize: 12),
    hintText: hintText,
    errorMaxLines: 2,
    hintStyle: AppBasicStyle(
      height: 2,
      fontColor: AppColor.grey,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      textAlign: TextAlign.start,
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.grey,
        width: 0.5,
      ),
    ),
  );
}
