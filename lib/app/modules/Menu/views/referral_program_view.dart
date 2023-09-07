import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReferralProgramView extends GetView {
  const ReferralProgramView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReferralProgramView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReferralProgramView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
