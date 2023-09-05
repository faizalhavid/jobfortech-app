import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Container AppAvatar(
    {String url = "https://cdn-icons-png.flaticon.com/512/727/727399.png"}) {
  return Container(
    margin: EdgeInsets.only(left: 20.0),
    child: CircleAvatar(
      backgroundImage: NetworkImage(url),
    ),
  );
}
