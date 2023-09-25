// VALIDATION
import 'package:flutter/material.dart';

String? validateName(String value) {
  final nameRegExp = RegExp(r'^[a-zA-Z]+$');
  if (value.isEmpty || value == '') {
    return 'Name is required';
  } else if (!nameRegExp.hasMatch(value)) {
    return 'Name must be a-z or A-Z';
  }
  return null;
}

String? validateEmail(String value) {
  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (value.isEmpty || value == '') {
    return 'Name is required';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Email invalid format';
  }
  return null;
}

String? validatePassword(String value) {
  final passwordRegExp =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');
  if (value.isEmpty || value == '') {
    return 'Name is required';
  } else if (!passwordRegExp.hasMatch(value)) {
    return 'Password must be at least 8 characters, 1 uppercase, 1 lowercase, and 1 number';
  }
  return null;
}

String? validateConfirmPassword(String value, TextEditingController password) {
  if (value.isEmpty || value == '') {
    return 'Confirm password is required';
  } else if (value != password.text) {
    return 'Confirm password not match';
  }
  return null;
}

String? validateDate(value) {
  if (value.isEmpty || value == '') {
    return 'Date is required';
  }
  return null;
}

String? validateAddress(value) {
  if (value.isEmpty || value == '') {
    return 'Address is required';
  }
  return null;
}

String? validatePhoneNumber(value) {
  if (value.isEmpty || value == '') {
    return 'Phone number is required';
  }
}
