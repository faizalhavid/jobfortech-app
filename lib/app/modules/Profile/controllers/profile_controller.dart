import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:jobfortech2/app/utils/functions.dart';
import 'package:jobfortech2/components/AppDialog/index.dart';
import 'package:jobfortech2/components/AppStack/index.dart';
import 'package:jobfortech2/components/AppToast/index.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'dart:async';

class ProfileController extends GetxController {
  RxInt badgecount = 1.obs;
  Rx<List<User>> works = Rx<List<User>>([]);

  var first_name = TextEditingController();
  var last_name = TextEditingController();
  var email = TextEditingController();
  var bio = TextEditingController();
  var phoneNumber = TextEditingController();
  var jobRoles = TextEditingController();
  var birthDate = TextEditingController();
  var address = TextEditingController();
  var country = TextEditingController();
  var skill = TextEditingController();
  var photoProfile = Rx<String>('');
  var social_name = TextEditingController();
  var social_url = TextEditingController();
  var cv_path = Rx<String>('');
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
  final RxList<String> skillTag = RxList<String>([]);
  final RxList<String> skillOptions = RxList<String>([
    'python',
    'java',
    'javascript',
    'c++',
    'c#',
    'php',
    'ruby',
    'go',
    'swift',
    'kotlin',
    'dart',
    'react',
    'vue',
    'angular',
    'laravel',
    'django',
    'spring',
    'flutter',
    'react native',
    'ionic',
    'android',
    'ios',
    'mysql',
    'mongodb',
    'postgresql',
    'sql server',
    'oracle',
    'firebase',
    'aws',
    'azure',
    'gcp',
    'docker',
    'kubernetes',
    'jenkins',
    'git',
    'github',
    'gitlab',
    'bitbucket',
    'jira',
    'trello',
    'figma',
    'adobe xd',
    'sketch',
    'photoshop',
    'illustrator',
    'after effect',
    'premiere pro',
    'corel draw',
    'corel photo paint',
    'corel video studio',
    'corel motion studio',
    'corel painter',
  ]);
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
    fetchUser();
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
            final uploadImage = await UserRepository()
                .updateUserPhoto(image: image.value); //upload server
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

// Execute
  void editProfileHandling(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'loading...');
      try {
        final upload = await userRepo.updateUser(
          body: {
            'first_name': first_name.text,
            'last_name': last_name.text,
            'email': email.text,
            'description': bio.text,
            'phone_number': phoneNumber.text,
            'position': jobRoles.text,
            'location': address.text,
            'skill': skillTag,
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

  Future<void> fetchUser() async {
    try {
      final User userData = await UserRepository().getUser();

      first_name.text = userData.firstName!;
      last_name.text = userData.lastName!;
      email.text = userData.email!;
      bio.text = userData.profile!.description!;
      phoneNumber.text = userData.phoneNumber!;
      jobRoles.text = userData.profile!.position!;
      address.text = userData.profile!.location!;
      skillTag.assignAll(userData.profile!.skills!.cast<String>());
      userSocial.value =
          (userData.profile?.socialMedia as List<dynamic>?)?.map((e) {
                return {
                  'name': socialMediaName(e.toString()),
                  'url': e.toString(),
                };
              }).toList() ??
              [];
      photoProfile.value = userData.profile!.photoProfile!;
      cv_path.value = userData.profile!.resume!;
      print('cv : ${userData.profile!.resume.split('/').last}');
      update();
    } catch (e) {
      print('error fetch user $e');
    }
  }

  // Future<void> fetchingExpertise() async {
  //   final expertiseData = await userRepo.getExpertise();
  //   expertiseOptions.assignAll(expertiseData);
  // }
}
