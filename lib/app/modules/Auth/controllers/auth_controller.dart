import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:jobfortech/app/modules/Auth/views/email_verify_view.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/navigation.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/services/Firebase_Database.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthController extends GetxController {
  late GoogleSignInAccount? currentUser;
  final database = FirebaseDatabase.instance;
  RxBool eyeIconPassword = true.obs;
  RxBool eyeIconConfirmPassword = true.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  RxBool emailVerified = false.obs;
  RxBool emailVerifySuccess = false.obs;

  void init() {
    super.onInit();
  }

  // Future<void> googleSignIn() async {
  //   var connection = await checkConnection();
  //   try {
  //     if (connection) {
  //       await _googleSignIn.signIn();

  //       Future.delayed(Duration(seconds: 2), () {
  //         EasyLoading.dismiss();
  //         Get.offAll(() => LoginView());
  //       });
  //     }
  //   } on PlatformException catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Something went wrong',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: AppColor.red,
  //       colorText: AppColor.white,
  //     );
  //     print('Error: $e');
  //   }
  // }

  Future<void> googleSignIn() async {
    var connection = await checkConnection();
    try {
      if (connection) {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        EasyLoading.show(status: 'loading...');
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        bool isNewUser = userCredential.additionalUserInfo!.isNewUser;

        // if (isNewUser) {
        //   UserModel userModel = UserModel(
        //     uid: userCredential.user!.uid,
        //     email: email,
        //     name: '',
        //     bio: '',
        //     phoneNumber: '',
        //     photoProfile: '',
        //     techRoles: '',
        //     birthDate: '',
        //     address: '',
        //     country: '',
        //   );
        //   UserRepository userRepository = UserRepository();
        //   await userRepository.addUser(userModel, userCredential.user!.uid);
        // }
        EasyLoading.dismiss();
        Get.offAll(() => NavigationView());
      }
    } on PlatformException catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.red,
        colorText: AppColor.white,
      );
      print(e);
    }
  }

  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      EasyLoading.show(status: 'loading...');
      Future.delayed(Duration(seconds: 2), () {
        EasyLoading.dismiss();
        Get.offAll(() => LoginView());
      });
    } on PlatformException catch (e) {
      print(' error : ${e}');
    }
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none ||
        connectivityResult == ConnectionState.waiting) {
      Get.snackbar(
        'No Internet',
        'Please check your internet connection',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.grey,
        colorText: AppColor.white,
      );
      return false;
    }
    return true;
  }

  sendEmailVerification() {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    Get.snackbar(
      'Success',
      'Email verification has been sent',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}


// class UserController extends GetxController with StateMixin<User?> {
//   final userProvider = UserProvider();
//   Rx<User?> user = User().obs;
//   getData() {
//     userProvider.getUser(1).then((data) {
//       change(data, status: RxStatus.success());
//     }, onError: (err) {
//       change(null, status: RxStatus.error(err.toString()));
//     });
//   }
// }
