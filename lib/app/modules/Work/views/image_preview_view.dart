import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/constant/theme.dart';

class ImagePreview extends GetView {
  final Gallery gallery;
  const ImagePreview({Key? key, required this.gallery}) : super(key: key);
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gallery.title!,
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Image.network(
                gallery.image!,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              gallery.description!,
              style: AppBasicStyle(
                fontColor: AppColor.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
