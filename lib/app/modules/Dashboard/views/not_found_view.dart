import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/constant/theme.dart';

class NotFoundView extends GetView {
  const NotFoundView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '404',
                  style: AppBasicStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.sentiment_dissatisfied,
                  size: 38,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Page not found',
              style: AppBasicStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontColor: AppColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
