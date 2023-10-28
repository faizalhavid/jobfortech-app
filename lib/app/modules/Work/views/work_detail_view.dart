import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkDetailView extends GetView {
  final Work work;
  const WorkDetailView({Key? key, required this.work}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          work.position!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
