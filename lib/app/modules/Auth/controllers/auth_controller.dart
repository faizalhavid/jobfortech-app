import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobfortech/app/modules/Auth/providers/user_provider.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:flutter/services.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';

class AuthController extends GetxController {
  late GoogleSignInAccount? currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
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

  void init() {
    super.onInit();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      currentUser = account;
      if (currentUser != null) {
        // Get.offAll(() => Navigation());
        print('auth ok');
      }
    });
    _googleSignIn.signInSilently();
  }

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

  Future<void> googleSignIn() async {
    try {
      await _googleSignIn.signIn();
      EasyLoading.show(status: 'loading...');
      Future.delayed(Duration(seconds: 2), () {
        EasyLoading.dismiss();
        Get.offAll(() => LoginView());
      });
    } on PlatformException catch (e) {
      print(' error : ${e}');
    }
  }

  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
    } on PlatformException catch (e) {
      print(' error : ${e}');
    }
  }
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
}
