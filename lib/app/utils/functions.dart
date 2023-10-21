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

String socialMediaName(String url) {
  if (url.contains('github')) {
    return 'Github';
  } else if (url.contains('linkedin')) {
    return 'Linkedin';
  } else if (url.contains('behance')) {
    return 'Behance';
  } else if (url.contains('medium')) {
    return 'Medium';
  } else if (url.contains('dribble')) {
    return 'Dribble';
  } else if (url.contains('facebook')) {
    return 'Facebook';
  } else if (url.contains('twitter')) {
    return 'Twitter';
  } else if (url.contains('instagram')) {
    return 'Instagram';
  } else {
    return 'Other';
  }
}
