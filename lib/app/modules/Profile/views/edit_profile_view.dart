import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

  final List<String> social = [
    'LinkedIn',
    'Github',
  ];

  final List<Map<String, dynamic>> userSocial = [
    {'label': 'LinkedIn', 'url': 'linkedin.com'},
    {'label': 'Github', 'url': 'github.com'},
  ];
  // 'Dribble',
  // 'Behance',
  // 'Instagram',
  // 'Facebook',
  // 'Twitter'
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
                            // final pickImage = await controller.getImage();
                            // print(pickImage);
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
                Expanded(
                  child: SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: userSocial.length,
                      itemBuilder: (context, index) {
                        final String iconPath = userSocial[index]['label'];
                        return ListTile(
                          leading: AppIcon(
                            svgPath:
                                'assets/svgs/${iconPath.toLowerCase()}.svg',
                            size: 30,
                          ),
                          title: Text(
                            userSocial[index]['label'],
                            style: AppBasicStyle(
                              fontSize: 14,
                              fontColor: AppColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: AppIcon(
                            svgPath: 'assets/svgs/link-minimalistic.svg',
                            size: 22,
                          ),
                          subtitle: Text(
                            userSocial[index]['url'],
                            style: AppBasicStyle(
                              fontSize: 12,
                              fontColor: AppColor.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () {
                            popupSocmed(
                              social: social,
                              url: userSocial[index]['url'],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
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
                      popupSocmed(social: social);
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
                            child: Text(
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

  Future<void> popupSocmed({required List<String> social, String? url}) {
    return AppDialog(
      title: 'Add Social Media',
      content: AppStack(children: [
        // AppDropDown(
        //   label: 'Job Role',
        //   items: social,
        //   controller: controller.jobRoles,
        //   errorText: 'Invalid job role',
        // ),
        AppDropDown(
          label: 'Social Media',
          items: social,
          controller: controller.jobRoles,
          onChanged: (value) {
            social.add(value);
          },
          errorText: 'Invalid job role',
          listItemBuilder: (context, result) {
            print('assets/svgs/${result.toLowerCase()}.svg');
            return Row(
              children: [
                AppIcon(svgPath: 'assets/svgs/${result.toLowerCase()}.svg'),
                SizedBox(
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
        // AppTextInput(
        //   controller: controller.social_name,
        //   onChanged: (value) {
        //     controller.social_name.text = value;
        //   },
        //   labelText: 'Social Media Name',
        //   hintText: 'Input name',
        //   keyboardType: TextInputType.text,
        // ),
        AppTextInput(
          initialValue: url,
          controller: controller.social_name,
          onChanged: (value) {
            controller.social_url.text = value;
            social.add(value);
          },
          labelText: 'Social Media Url',
          hintText: 'Input url',
          keyboardType: TextInputType.url,
        )
      ]),
      onConfirm: () {},
      onCancel: () {
        Get.back();
      },
    );
  }
}
