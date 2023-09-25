import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:jobfortech/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/navigation.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/services/Firebase_Database.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthController extends GetxController {
  late GoogleSignInAccount? currentUser;

  final database = FirebaseDatabase.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  RxBool eyeIconPassword = true.obs;

  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  void init() {
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }

  void registering(GlobalKey<FormState> formKey) async {
    var connection = await checkConnection();

    if (connection) {
      final jobRoleCollection = database.ref('jobRoles');
      if (formKey.currentState!.validate()) {
        User? user = await registerWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        if (user != null) {
          UserModel userModel = UserModel(
            uid: user.uid,
            email: email.text,
            name: '',
            bio: 'you can edit this bio',
            phoneNumber: '',
            photoProfile: '',
            techRoles: '',
            birthDate: '',
            address: '',
            country: '',
          );
          UserRepository userRepository = UserRepository();
          await userRepository.addUser(userModel, user.uid);
        }
      }
    }
  }

  void logging(GlobalKey<FormState> formKey) async {
    var connection = await checkConnection();

    if (connection) {
      print('${email.text} ${password.text}');
      if (formKey.currentState!.validate()) {
        User? user = await loginWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
      }
    }
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

        if (isNewUser) {
          UserModel userModel = UserModel(
            uid: userCredential.user!.uid,
            email: email.text,
            name: '',
            bio: 'lorem ipsum dolor sit amet',
            phoneNumber: '',
            photoProfile: '',
            techRoles: '',
            birthDate: '',
            address: '',
            country: '',
          );
          UserRepository userRepository = UserRepository();
          await userRepository.addUser(userModel, userCredential.user!.uid);
        }
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

  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      Get.dialog(
        AlertDialog(
          title: Text('Email verification'),
          content: Text('Please check your email to verify your account'),
          actions: [
            TextButton(
              onPressed: () async {
                await user?.sendEmailVerification();
                Get.back();
              },
              child: Text('Resend email'),
            ),
            TextButton(
              onPressed: () async {
                // malah kirim email ke user wkwkwkw
                String url = 'mailto:$email';
                if (await canLaunch(url)) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text('Verify now'),
            ),
          ],
        ),
        barrierDismissible: false,
      );
      await user?.sendEmailVerification();
      while (!(await user!.emailVerified)) {
        await user.reload();
        user = auth.currentUser;
        await Future.delayed(Duration(seconds: 5));
      }
      EasyLoading.showToast(
        'Register Success ! Please Login',
        toastPosition: EasyLoadingToastPosition.bottom,
        duration: Duration(seconds: 2),
      );
      Get.offAll(() => LoginView());
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.dialog(
          AlertDialog(
            title: Text('Email already in use'),
            content: Text('Do you want Login?'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.to(() => LoginView());
                },
                child: Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        );
      }
      return null;
    } catch (e) {
      print('An error occurred while registering: $e');
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      // Pastikan user tidak null sebelum melakukan navigasi
      if (user != null) {
        Get.offAll(() => NavigationView());
      } else {
        Get.snackbar(
          'Error',
          'User login failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Get.snackbar(
          'Error',
          'Email and password invalid',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      return null;
    }
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
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
