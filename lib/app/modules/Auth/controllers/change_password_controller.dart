import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech2/components/AppToast/index.dart';

class ChangePasswordController extends GetxController {
  final eyeIconPassword = true.obs;
  final eyeIconConfirmPassword = true.obs;
  final eyeOldPassword = true.obs;
  final keyForm = GlobalKey<FormState>();
  final old_password = TextEditingController();
  final new_password = TextEditingController();
  final confirm_password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    old_password.dispose();
    new_password.dispose();
    confirm_password.dispose();
    super.onClose();
  }

  void changePassword() async {
    if (keyForm.currentState!.validate()) {
      EasyLoading.show(status: 'loading...');
      await UserRepository()
          .changePassword(
              new_password.text, confirm_password.text, old_password.text)
          .then((value) {
        AppToast(message: 'Success Change Password');
        Future.delayed(const Duration(seconds: 3), () {
          EasyLoading.dismiss();
          Get.off(() => LoginView());
        });
      }).catchError((e) {
        EasyLoading.dismiss();
        Get.snackbar('Error', e.toString(),
            duration: const Duration(seconds: 5),
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Get.theme.colorScheme.onSecondary);
      });
    }
  }
}
