import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';

class ProfileController extends GetxController {
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  RxList<String> jobRole = RxList<String>([]);
  RxInt badgecount = 1.obs;

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
  var social_name = TextEditingController();
  var social_url = TextEditingController();
  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // getUser();
  }

  @override
  void onClose() {
    social_name.dispose();
    social_url.dispose();
  }

  Future getImage() async {
    final pickFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      selectedImage.value = pickFile;
    }
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
}
