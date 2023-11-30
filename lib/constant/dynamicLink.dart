import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
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
      final response = UserRepository()
          .emailActivation(
        id: uri.queryParameters['user_id'],
        string_activation: uri.queryParameters['user_uuid']!,
      )
          .then((value) {
        Get.snackbar('Success Email Activation',
            'Welcome JobFortech ! You can login now');
        EasyLoading.show(status: 'loading...');
        Future.delayed(const Duration(seconds: 3), () {
          EasyLoading.dismiss();
          Get.offAll(() => WelcomeUserView(isAboutUs: false));
        });
      }).catchError((e) {
        Get.snackbar('Error', e.toString(),
            duration: const Duration(seconds: 5),
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Get.theme.colorScheme.onSecondary);
      });
      break;

    default:
      Get.to(() => const NotFoundView());
  }
}
