import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/theme.dart';

class SearchWokView extends GetView {
  final List<Work> work;
  const SearchWokView(this.work, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
        title: TextFormField(
          cursorColor: AppColor.white,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: AppBasicStyle(
              fontColor: AppColor.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            prefix: Icon(
              Icons.search,
              color: AppColor.white,
            ),
            filled: true,
            fillColor: AppColor.white.withOpacity(0.1),
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text(
          'SearchWokView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
