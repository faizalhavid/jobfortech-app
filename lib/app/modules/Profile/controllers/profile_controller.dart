import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';
import 'package:jobfortech/components/AppToast/index.dart';

class ProfileController extends GetxController {
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

  final Rx<List<Map<String, String>>> userSocial =
      Rx<List<Map<String, String>>>([
    {
      'name': 'Facebook',
      'url': 'https://facebook.com/',
    },
    {
      'name': 'Twitter',
      'url': 'https://twitter.com/',
    },
    {
      'name': 'Instagram',
      'url': 'https://instagram.com/',
    }
  ]);

  final Rx<List<String>> socialList = Rx<List<String>>([
    'Facebook',
    'Twitter',
    'Instagram',
    'Dribble',
    'Github',
    'Linkedin',
    'Behance',
    'Medium',
  ]);

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

  void getSocmedIndex(int index) {
    if (index >= 0 && index < userSocial.value.length) {
      social_name.text = userSocial.value[index]['name']!;
      social_url.text = userSocial.value[index]['url']!;

      userSocial.value.removeAt(index);
    }
  }

  void addSocmed() {
    userSocial.update((val) {
      val!.add({
        'name': social_name.text,
        'url': social_url.text,
      });
    });
    social_name.clear();
    social_url.clear();
  }

  void editSocmed(int index) {
    social_name.text = userSocial.value[index]['name']!;
    social_url.text = userSocial.value[index]['url']!;
    userSocial.value.removeAt(index);
  }

  void deleteSocmed(int index) {
    userSocial.value.removeAt(index);
    userSocial.update((val) {});
  }

  Rx<String?> imageUrl = Rx<String?>(null);

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      String uploadedImageUrl = await uploadImageToServer(pickedImage);

      imageUrl.value = uploadedImageUrl;
    }
  }

  Future<String> uploadImageToServer(XFile pickedImage) async {
    try {
      final upload = await UserRepository().updateUser(body: {
        'photo_profile': await pickedImage.readAsBytes(),
      });
      final file_path = upload.profile?.photoProfile;
      return file_path;
    } catch (e) {
      print('error upload : $e');
      return 'Error Upload';
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
