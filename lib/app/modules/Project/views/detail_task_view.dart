import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailTaskView extends GetView {
  final taskId;
  const DetailTaskView(this.taskId, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailTaskView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailTaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
