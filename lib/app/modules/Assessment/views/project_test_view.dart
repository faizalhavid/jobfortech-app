import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProjectTestView extends GetView {
  const ProjectTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectTestView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectTestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
