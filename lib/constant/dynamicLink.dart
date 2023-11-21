import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/views/change_password_view.dart';
import 'package:jobfortech2/app/modules/Dashboard/views/not_found_view.dart';

Future<void> initLinks() async {
  FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData data) {
    final Uri? deepLink = data?.link;

    print("deepLink : $deepLink");
    if (deepLink != null) {
      handleDeepLink(deepLink);
    }
  }).onError((e) {
    Get.snackbar('Error', e.toString());
  });
}

void handleDeepLink(Uri uri) {
  switch (uri.path) {
    case '/forgot-password':
      Get.to(() => ChangePasswordView(
            uri.queryParameters['user_uuid']!,
            uri.queryParameters['user_id']!,
          ));
      break;
    default:
      Get.to(() => const NotFoundView());
  }
}
