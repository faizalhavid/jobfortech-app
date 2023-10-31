import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/constant/theme.dart';

class DetailCompanyView extends GetView {
  final Company company;
  const DetailCompanyView({required this.company, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Detail Company',
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text(
          company.name!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
