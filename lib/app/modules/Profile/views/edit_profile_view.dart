import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech/app/modules/Profile/controllers/profile_controller.dart';
import 'package:jobfortech/app/utils/globalController.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppDialog/index.dart';
import 'package:jobfortech/components/AppDropDown/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/components/AppToast/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/app/utils/functions.dart';
import 'package:jobfortech/app/utils/validation.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileView extends GetView<ProfileController> {
  final controller = Get.put(ProfileController());

  UserRepository userRepo = UserRepository();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> countryList = [
    'Mobile developer',
    'UI UX',
    'Backend developer',
    'Frontend developer'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
        backgroundColor: AppColor.blue,
        automaticallyImplyLeading: true,
        leading: Text(
          'Edit Profile',
          style: AppBasicStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontColor: AppColor.white),
        ),
      ),
      body: Form(
        key: formKey,
        child: GetX<UserController>(
          builder: (userController) {
            final user = userController.user.value;
            final biodata = user.profile?.description == '' ||
                    user.profile?.description == null
                ? 'No biodata'
                : user.profile?.description ?? '';
            final List<String> skills = user.profile!.skills!
                .map((e) => e['label'].toString())
                .toList();
            return AppSafeArea(
              safearea: resSafeArea,
              spacing: 20,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppAvatar(
                      backgroundColor: AppColor.smoke,
                      radius: 40,
                      outlineColor: AppColor.white,
                      path: user.profile?.photoProfile ?? null,
                    ),
                    AppStack(
                      spacing: 5,
                      cAlignment: CrossAxisAlignment.end,
                      children: [
                        AppButton(
                          backgroundColor: AppColor.blue,
                          height: 35,
                          width: 80,
                          child: Text(
                            'Upload Photo',
                            style: AppBasicStyle(
                                fontSize: 12,
                                fontColor: AppColor.white,
                                fontWeight: FontWeight.w500),
                          ),
                          spacing: 0,
                          onPressed: () async {
                            final pickedImage =
                                await controller.pickImage(ImageSource.gallery);
                          },
                        ),
                        Text(
                          biodata,
                          style: AppBasicStyle(
                            fontSize: 12,
                            fontColor: AppColor.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                AppTextInput(
                  controller: controller.name,
                  onChanged: (value) {
                    controller.name.text = value;
                  },
                  labelText: 'Full Name',
                  hintText: '${user.firstName} ${user.lastName}',
                  errorText: 'Invalid address',
                  keyboardType: TextInputType.streetAddress,
                ),
                AppDropDown(
                  label: 'Job Role',
                  items: skills.isEmpty ? ['No data'] : skills,
                  controller: controller.jobRoles,
                  errorText: 'Invalid job role',
                ),
                AppTextInput(
                  controller: controller.birthDate,
                  onTap: () {
                    showDate(context, controller.birthDate);
                  },
                  readOnly: true,
                  labelText: 'Birth Date',
                  hintText: 'Enter birth date',
                  errorText: 'Invalid birth date',
                  suffix: IconButton(
                    onPressed: () {
                      showDate(context, controller.birthDate);
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      color: AppColor.blue,
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                Text(
                  'Contact',
                  style: AppTitleHeader,
                ),
                IntlPhoneField(
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownTextStyle: AppBasicStyle(
                    height: 2,
                    fontColor: AppColor.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                  showCountryFlag: false,
                  decoration: AppTextInputDecoration(
                    hintText:
                        '${user.phoneNumber!.isEmpty ? 'No phone number' : user.phoneNumber}',
                  ),
                  languageCode: "id",
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
                AppTextInput(
                  controller: controller.email,
                  onChanged: (value) {
                    controller.email.text = value;
                  },
                  labelText: 'Email',
                  hintText: '${user.email!.isEmpty ? 'No email' : user.email}',
                  errorText: 'Invalid email address',
                  keyboardType: TextInputType.emailAddress,
                ),
                Text(
                  'Link Account',
                  style: AppTitleHeader,
                ),
                Obx(() {
                  final double itemHeight = Get.height * 0.1;
                  final double listHeight = itemHeight *
                      controller.userSocial.value.length.toDouble();

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: listHeight,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.userSocial.value.length,
                      itemBuilder: (context, index) {
                        if (controller.userSocial.value.isNotEmpty) {
                          final String iconPath =
                              controller.userSocial.value[index]['name']!;
                          return ListTile(
                            leading: AppIcon(
                              svgPath:
                                  'assets/svgs/${iconPath.toLowerCase()}.svg',
                              size: 30,
                            ),
                            title: Text(
                              controller.userSocial.value[index]['name']!,
                              style: AppBasicStyle(
                                fontSize: 14,
                                fontColor: AppColor.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: AppIconButton(
                              svgPath: 'assets/svgs/link-minimalistic.svg',
                              size: 22,
                              onPressed: () {
                                AppDialog(
                                  title: 'Delete Social Media',
                                  content: Text(
                                    'Are you sure want to delete ${controller.userSocial.value[index]['name']}?',
                                    maxLines: 2,
                                    style: AppBasicStyle(
                                      fontSize: 14,
                                      fontColor: AppColor.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onConfirm: () {
                                    controller.deleteSocmed(index);
                                    AppToast(message: 'Delete Success');
                                    Get.back();
                                  },
                                  onCancel: () {
                                    Get.back();
                                  },
                                );
                              },
                            ),
                            subtitle: Text(
                              controller.userSocial.value[index]['url']!,
                              style: AppBasicStyle(
                                fontSize: 12,
                                fontColor: AppColor.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onTap: () {
                              controller.getSocmedIndex(index);
                              showSocialMediaDialog(
                                title: 'Edit Social Media',
                                item: controller.socialList.value,
                                nameController: controller.social_name,
                                urlController: controller.social_url,
                                onConfirm: () {
                                  controller.editSocmed(index);
                                  Get.back();
                                },
                                onCancel: () {
                                  Get.back();
                                },
                              );
                            },
                          );
                        } else {
                          return Container(
                            child: Text('Social Link Empty'),
                          );
                        }
                      },
                    ),
                  );
                }),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.2, vertical: 0.1),
                  child: AppButton(
                    type: 'outline',
                    outlineColor: AppColor.transparent,
                    child: const Text(
                      'Add Links',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.osean,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () {
                      showSocialMediaDialog(
                        title: 'Add Social Media',
                        item: controller.socialList.value,
                        nameController: controller.social_name,
                        urlController: controller.social_url,
                        onConfirm: () {
                          controller.addSocmed();
                          Get.back();
                        },
                        onCancel: () {
                          Get.back();
                        },
                      );
                    },
                    suffix: AppIcon(
                      svgPath: 'assets/svgs/button-tambah.svg',
                      size: 18,
                    ),
                  ),
                ),
                Text(
                  'CV',
                  style: AppTitleHeader,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.blue),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: Get.width * 0.6,
                            child: const Text(
                              'filee.pdf',
                              overflow: TextOverflow.ellipsis,
                            )),
                        IconButton(
                            onPressed: () {},
                            splashRadius: 15,
                            icon: const Icon(
                              Icons.close,
                              color: AppColor.blue,
                              size: 14,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: AppButton(
                      child: Text(
                        'Save',
                        style: AppBasicStyle(
                            fontColor: AppColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        controller.editProfileHandling(formKey);
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

void showSocialMediaDialog({
  required String title,
  required List<String> item,
  required TextEditingController nameController,
  required TextEditingController urlController,
  required VoidCallback onConfirm,
  required dynamic Function() onCancel,
}) {
  AppDialog(
    title: title,
    content: AppStack(
      children: [
        AppDropDown(
          isSearch: true,
          label: 'Social Media',
          items: item,
          controller: nameController,
          errorText: 'Invalid job role',
          listItemBuilder: (context, result) {
            return Row(
              children: [
                AppIcon(
                  svgPath: 'assets/svgs/${result.toLowerCase()}.svg',
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  result,
                  style: AppBasicStyle(
                    fontColor: AppColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            );
          },
        ),
        AppTextInput(
          controller: urlController,
          labelText: 'Social Media Url',
          hintText: 'Input url',
          keyboardType: TextInputType.url,
        )
      ],
    ),
    onConfirm: onConfirm,
    onCancel: onCancel,
  );
}
