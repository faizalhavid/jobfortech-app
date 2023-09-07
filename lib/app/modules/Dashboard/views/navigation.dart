import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NavigationViewView extends GetView {
  const NavigationViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NavigationViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
