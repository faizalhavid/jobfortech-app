import 'package:flutter/material.dart';

Future<void> showDate(
    BuildContext context, TextEditingController birthDate) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (selectedDate != null) {
    birthDate.text = selectedDate.toString().split(' ')[0];
  }
}
