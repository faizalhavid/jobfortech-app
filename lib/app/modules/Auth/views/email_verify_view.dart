import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EmailVerifyView extends GetView {
  const EmailVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmailVerifyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmailVerifyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
