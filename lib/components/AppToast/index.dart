import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> AppToast(
    {required String message,
    EasyLoadingToastPosition position =
        EasyLoadingToastPosition.bottom}) async {
  return await EasyLoading.showToast(
    message,
    toastPosition: position,
  );
}
