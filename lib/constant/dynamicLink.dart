import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/views/change_password_view.dart';
import 'package:jobfortech2/app/modules/Auth/views/welcome_user_view.dart';
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

  final PendingDynamicLinkData? data =
      await FirebaseDynamicLinks.instance.getInitialLink();
  final Uri? deepLink = data?.link;

  if (deepLink != null) {
    handleDeepLink(deepLink);
  }
}

void handleDeepLink(Uri uri) {
  switch (uri.path) {
    case '/forgot-password':
      Get.to(() => ChangePasswordView(
            uri.queryParameters['user_uuid']!,
            uri.queryParameters['user_id']!,
          ));
      break;
    case '/welcome-user':
      Get.to(() => WelcomeUserView(
            uri.queryParameters['user_id']!,
            uri.queryParameters['user_uuid']!,
          ));
      break;

    default:
      Get.to(() => const NotFoundView());
  }
}
