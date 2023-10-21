import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/components/AppDialog/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/components/AppToast/index.dart';
import 'package:jobfortech/constant/theme.dart';
import 'dart:async';

class ProfileController extends GetxController {
  RxInt badgecount = 1.obs;

  final user = FirebaseAuth.instance.currentUser;
  var firts_name = TextEditingController();
  var last_name = TextEditingController();
  var email = TextEditingController();
  var bio = TextEditingController();
  var phoneNumber = TextEditingController();
  var jobRoles = TextEditingController();
  var birthDate = TextEditingController();
  var address = TextEditingController();
  var country = TextEditingController();
  var expertise = TextEditingController();

  var social_name = TextEditingController();
  var social_url = TextEditingController();
  Rx<File> image = Rx<File>(File(''));
  Rx<File> cv_file = Rx<File>(File(''));
  final RxList<String> positionsList = RxList<String>([
    'Frontend Developer',
    'Backend Developer',
    'Fullstack Developer',
    'Mobile Developer',
    'UI/UX Designer',
    'Data Scientist',
    'Data Analyst',
    'Product Manager',
    'Project Manager',
    'Business Analyst',
    'DevOps Engineer',
    'QA Engineer',
    'Software Engineer',
    'Other',
  ]);
  final RxList<String> expertiseTag = RxList<String>([]);
  final RxList<String> expertiseOptions = RxList<String>([]);
  final Rx<List<Map<String, String>>> userSocial =
      Rx<List<Map<String, String>>>([]);

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

  final userRepo = UserRepository();

  @override
  void onInit() {
    super.onInit();
    fetchingExpertise();
  }

  @override
  void onClose() {
    social_name.dispose();
    social_url.dispose();
  }

  // socmed

  void getSocmedIndex(int index) {
    if (index >= 0 && index < userSocial.value.length) {
      social_name.text = userSocial.value[index]['name']!;
      social_url.text = userSocial.value[index]['url']!;
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
    userSocial.update((val) {
      val![index]['name'] = social_name.text;
      val[index]['url'] = social_url.text;
    });

    update();
  }

  void deleteSocmed(int index) {
    userSocial.value.removeAt(index);
    userSocial.update((val) {});
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      final imageCropper = ImageCropper();
      final croppedImage = await imageCropper.cropImage(
        sourcePath: pickedImage.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (croppedImage != null) {
        final croppedFile = File(croppedImage.path);
        AppDialog(
          title: 'Upload Image',
          content: AppStack(
            cAlignment: CrossAxisAlignment.center,
            mAlignment: MainAxisAlignment.center,
            children: [
              Image.file(
                croppedFile,
                fit: BoxFit.cover,
              ),
              Text('Are you sure want to upload this image?',
                  style: AppBasicStyle(fontColor: AppColor.grey)),
            ],
          ),
          onConfirm: () async {
            image.value = croppedFile;
            print('imageeee : ${image.value}');
            final uploadImage =
                await UserRepository().updateUserPhoto(image: image.value);
            if (uploadImage) {
              AppToast(message: 'Image uploaded successfully');
              Get.back();
            } else {
              AppToast(message: 'Something went error !');
              Get.back();
            }
          },
          onCancel: () {
            Get.back();
          },
        );
      }
    }
  }

  Future<void> pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (pickedFile != null) {
      PlatformFile file = pickedFile.files.first;
      cv_file.value = File(file.path!);
      AppDialog(
          title: 'Are you sure want to upload this file?',
          content: AppStack(
            cAlignment: CrossAxisAlignment.center,
            mAlignment: MainAxisAlignment.center,
            children: [
              Text(file.name, style: AppBasicStyle(fontColor: AppColor.grey)),
            ],
          ),
          onConfirm: () async {
            final uploadFile =
                await UserRepository().uploadPDF(pdfFile: cv_file.value);
            if (uploadFile) {
              AppToast(message: 'File uploaded successfully');
              Get.back();
            } else {
              AppToast(message: 'Something went error !');
              Get.back();
            }
          },
          onCancel: () {
            Get.back();
          });
    }
  }

  Future<void> readFile(PlatformFile file) async {}

// Execute
  void editProfileHandling(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'loading...');
      try {
        final upload = await userRepo.updateUser(
          body: {
            'first_name': firts_name.text,
            'last_name': last_name.text,
            'email': email.text,
            'description': bio.text,
            'phone_number': phoneNumber.text,
            'position': jobRoles.text,
            'location': address.text,
            'expertise': expertiseTag,
            'social_media': userSocial.value
                .map((social) => social['url']!.startsWith('http')
                    ? social['url']
                    : 'https://${social['url']}')
                .toList(),
          },
        );
        EasyLoading.dismiss();
        AppToast(message: 'Profile updated successfully');
      } catch (e) {
        EasyLoading.dismiss();
        AppToast(message: 'Something went wrong');
        print('error : $e');
      }
    }
  }

  Future<void> fetchingExpertise() async {
    final expertiseData = await userRepo.getExpertise();
    expertiseOptions.assignAll(expertiseData);
  }
}
