import 'package:flutter/material.dart';

ListTile AppListTile(
    {Widget? leading,
    required String text,
    required VoidCallback onTap,
    Text? subtitle,
    ListTileTitleAlignment titleAlign = ListTileTitleAlignment.center}) {
  return ListTile(
    titleAlignment: titleAlign,
    leading: leading,
    title: Text(text),
    subtitle: subtitle,
    onTap: onTap,
  );
}
