import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:jobfortech/services/Firebase_Database.dart';

class ProfileController extends GetxController {
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  RxList<String> jobRole = RxList<String>([]);

  final user = FirebaseAuth.instance.currentUser;
  var name = TextEditingController();
  var email = TextEditingController();
  var bio = TextEditingController();
  var phoneNumber = TextEditingController();
  var jobRoles = TextEditingController();
  var birthDate = TextEditingController();
  var address = TextEditingController();
  var country = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> pickImageFromGallery() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    selectedImage.value = image;
  }

  void editProfileHandling(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        if (user != null) {
          UserModel userModel = UserModel(
            email: email.text,
            name: name.text,
            bio: bio.text,
            phoneNumber: phoneNumber.text,
            photoProfile: '',
            techRoles: jobRoles.text,
            birthDate: birthDate.text,
            address: address.text,
            country: country.text,
          );
          UserRepository userRepository = UserRepository();
          await userRepository.updateUser(userModel, user!.uid);
          EasyLoading.showToast('Update Success');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> getJobRole() async {
    final jobroles = await FirebaseDatabase.instance
        .ref()
        .child('jobRoles')
        .get()
        .then((DataSnapshot? snapshot) {
      if (snapshot != null) {
        if (snapshot.value is List) {
          List<dynamic> values = snapshot.value as List<dynamic>;
          jobRole.addAll(values
              .where((value) => value != null)
              .map((value) => value['label'].toString()));
        } else {
          print('Invalid job roles data format.');
        }
      }
    });
  }

  Future<void> getUser() async {
    final userRef =
        FirebaseDatabase.instance.ref().child('user/${this.user!.uid}');
    final snapshot = await userRef.get();

    print('user :${snapshot.value} ${this.user!.uid}');

    if (snapshot != null) {
      if (snapshot.value is Map) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        name.text = values['name'].toString();
        email.text = values['email'].toString();
        bio.text = values['bio'].toString();
        phoneNumber.text = values['phoneNumber'].toString();
        jobRoles.text = values['techRoles'].toString();
        birthDate.text = values['birthDate'].toString();
        address.text = values['address'].toString();
        country.text = values['country'].toString();
      } else {
        print('Invalid user data format.');
      }
    } else {
      print('The user does not exist in the database.');
    }
  }
}
