import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/constant/theme.dart';

class ImagePreview extends GetView {
  final imageUrl;
  const ImagePreview({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Gallery Company',
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
