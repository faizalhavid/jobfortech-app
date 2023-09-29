import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Profile/controllers/profile_controller.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppDropDown/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:jobfortech/utils/functions.dart';
import 'package:jobfortech/utils/validation.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileView extends GetView<ProfileController> {
  final controller = Get.put(ProfileController());
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
          child: AppSafeArea(
            safearea: resSafeArea,
            spacing: 30,
            children: [
              Text(
                'Account',
                style: AppTitleHeader,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () {
                      final selectedImage = controller.selectedImage.value;

                      return AppAvatar(
                        radius: 40,
                        image: selectedImage != null
                            ? FileImage(
                                File(selectedImage.path),
                              )
                            : null,
                      );
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            controller.pickImageFromGallery();
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          'Ut porttitor vel convallis id neque molestie. Nunc odio fermentum dolor pharetra eget.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: AppBasicStyle(
                              fontSize: 9.5,
                              fontColor: AppColor.grey,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  )
                ],
              ),
              FutureBuilder(
                future: controller.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppTextInput(
                      controller: controller.name,
                      onChanged: (value) {
                        controller.address.text = value;
                      },
                      labelText: 'Full Name',
                      hintText: 'Enter address',
                      errorText: 'Invalid address',
                      keyboardType: TextInputType.streetAddress,
                    );
                  } else {
                    return Center(
                      child: AppShimmer(
                        child: Container(
                          height: 40,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.smoke,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.getJobRole(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppDropDown(
                      label: 'Job Role',
                      items: controller.jobRole,
                      controller: controller.jobRoles,
                      errorText: 'Invalid job role',
                    );
                  } else {
                    return Center(
                      child: AppShimmer(
                        child: Container(
                          height: 40,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.smoke,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Text(
                'Contact',
                style: AppTitleHeader,
              ),
              FutureBuilder(
                future: controller.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppTextInput(
                      controller: controller.phoneNumber,
                      onChanged: (value) {
                        controller.phoneNumber.text = value;
                      },
                      labelText: 'Phone Number',
                      hintText: 'Enter Phone number',
                      errorText: 'Invalid phone number',
                      keyboardType: TextInputType.phone,
                    );
                  } else {
                    return Center(
                      child: AppShimmer(
                        child: Container(
                          height: 40,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.smoke,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppTextInput(
                      controller: controller.email,
                      onChanged: (value) {
                        controller.email.text = value;
                      },
                      labelText: 'Email',
                      hintText: 'Enter email address',
                      errorText: 'Invalid email address',
                      keyboardType: TextInputType.emailAddress,
                    );
                  } else {
                    return Center(
                      child: AppShimmer(
                        child: Container(
                          height: 40,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.smoke,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppTextInput(
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
                        icon: const Icon(Icons.calendar_today),
                      ),
                      keyboardType: TextInputType.datetime,
                    );
                  } else {
                    return Center(
                      child: AppShimmer(
                        child: Container(
                          height: 40,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.smoke,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppTextInput(
                      controller: controller.address,
                      onChanged: (value) {
                        controller.address.text = value;
                      },
                      labelText: 'Address',
                      hintText: 'Enter address',
                      errorText: 'Invalid address',
                      maxLines: 3,
                      keyboardType: TextInputType.streetAddress,
                    );
                  } else {
                    return Center(
                      child: AppShimmer(
                        child: Container(
                          height: 40,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.smoke,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.getJobRole(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AppDropDown(
                      label: 'Country',
                      items: countryList,
                      controller: controller.country,
                      errorText: 'Invalid country',
                    );
                  } else {
                    return Center(
                      child: AppShimmer(
                        child: Container(
                          height: 40,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.smoke,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Text(
                'Link Account',
                style: AppTitleHeader,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppIcon(
                            svgPath: 'assets/svgs/social-media-logo.svg',
                            size: 25),
                        SizedBox(width: 8),
                        Text(
                          'Linked In',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '@username_linkedin',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.osean,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(width: 5),
                        AppIcon(
                            svgPath: 'assets/svgs/link-minimalistic.svg',
                            size: 18),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/github.png',
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Git Hub',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '@username_github',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.osean,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(width: 5),
                        AppIcon(
                            svgPath: 'assets/svgs/link-minimalistic.svg',
                            size: 18),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Add Links',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.osean,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(width: 5),
                    AppIcon(svgPath: 'assets/svgs/button-tambah.svg', size: 18)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.editProfileHandling(formKey);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ));
  }
}
