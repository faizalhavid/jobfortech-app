import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/providers/user_provider.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:flutter/services.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'dart:convert';

import 'package:jobfortech/app/modules/Dashboard/views/navigation.dart';

class AuthController extends GetxController {
  RxBool eyeIconPassword = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var jobRoleDropdownCtrl = TextEditingController();
  var birthDate = TextEditingController();
  var address = TextEditingController();
  var country = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    name.dispose();
    jobRoleDropdownCtrl.dispose();
    birthDate.dispose();
    address.dispose();
    country.dispose();
  }

  String? validateName(String value) {
    final nameRegExp = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty || value == '') {
      return 'Name is required';
    } else if (!nameRegExp.hasMatch(value)) {
      return 'Name must be a-z or A-Z';
    }
    return null;
  }

  String? validateEmail(String value) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (value.isEmpty || value == '') {
      return 'Name is required';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Email invalid format';
    }
    return null;
  }

  String? validatePassword(String value) {
    final passwordRegExp = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty || value == '') {
      return 'Name is required';
    } else if (!passwordRegExp.hasMatch(value)) {
      return 'Name must be a-z or A-Z';
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty || value == '') {
      return 'Confirm password is required';
    } else if (value != password.text) {
      return 'Confirm password not match';
    }
    return null;
  }

  String? validateDate(value) {
    if (value.isEmpty || value == '') {
      return 'Date is required';
    }
    return null;
  }

  String? validateAddress(value) {
    if (value.isEmpty || value == '') {
      return 'Address is required';
    }
    return null;
  }

  void registering() {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'loading...');
      Future.delayed(Duration(seconds: 2), () {
        EasyLoading.dismiss();
        Get.offAll(() => LoginView());
      });
    }
  }
}

class LoadingController extends GetxController {
  RxBool isLoading = true.obs;
}

class UserController extends GetxController with StateMixin<User?> {
  final userProvider = UserProvider();
  Rx<User?> user = User().obs;
  getData() {
    userProvider.getUser(1).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   getUser();
  // }

  // Future<User?> getUser() async {
  //   try {
  //     final jsonString = await rootBundle.loadString('assets/json/user.json');
  //     final Map<String, dynamic> userData = json.decode(jsonString);
  //     user.value = User.fromJson(userData);
  //   } catch (e) {
  //     print('Error fetching user: $e');
  //     return null;
  //   }
  // }
}
