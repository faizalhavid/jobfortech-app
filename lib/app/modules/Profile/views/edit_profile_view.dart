import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/modules/Profile/controllers/profile_controller.dart';
import 'package:jobfortech/app/modules/Profile/views/expertise_search_view.dart';
import 'package:jobfortech/app/utils/globalController.dart';
import 'package:jobfortech/app/utils/validation.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppDialog/index.dart';
import 'package:jobfortech/components/AppDropDown/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppStack/index.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/components/AppToast/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
            final profile = user.profile;
            final biodata = user.profile?.description == '' ||
                    user.profile?.description == null
                ? 'No biodata'
                : user.profile?.description ?? '';

            controller.firts_name.text = user.firstName!;
            controller.last_name.text = user.lastName!;
            controller.email.text = user.email!;
            controller.bio.text = profile?.description ?? 'No biodata';
            controller.phoneNumber.text = user.phoneNumber!;
            controller.cv_file.value = File(profile?.resume ?? '');

            final socialList =
                (profile?.socialMedia as List<dynamic>?)?.map((e) {
                      return {
                        'name': e['name'].toString(),
                        'url': e['url'].toString(),
                      };
                    })?.toList() ??
                    [];

            controller.userSocial.value = socialList;

            final skills =
                profile?.skills?.map((e) => e['label'].toString()).toList() ??
                    [];

            // ... continue with the rest of the code

            // controller.jobRoles.text = user.profile!.jobRole!;
            // controller.birthDate.text = user.profile!.birthDate!;
            // controller.address.text = user.profile!.address!;
            // controller.country.text = user.profile!.country!;

            return AppSafeArea(
              safearea: resSafeArea,
              spacing: 20,
              children: [
                Text(
                  'Account',
                  style: AppTitleHeader,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Obx(
                          () => controller.image.value!.path.isEmpty
                              ? AppAvatar(
                                  backgroundColor: AppColor.smoke,
                                  radius: 40,
                                  outlineColor: AppColor.blue,
                                  path: user.profile?.photoProfile ?? null,
                                )
                              : AppAvatar(
                                  backgroundColor: AppColor.smoke,
                                  radius: 40,
                                  outlineColor: AppColor.blue,
                                  image: FileImage(controller.image.value!),
                                ),
                        ),
                        Positioned(
                          right: -15,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {
                              controller.pickImage(ImageSource.gallery);
                            },
                            icon: AppIcon(
                                svgPath: 'assets/svgs/upload-image.svg',
                                size: 20),
                            splashRadius: 25,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: Get.width * 0.55,
                        child: Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Expertise',
                                    style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  controller.tags.isNotEmpty
                                      ? IconButton(
                                          splashRadius: 20,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.mode_edit_outline_outlined,
                                            color: AppColor.blue,
                                          ))
                                      : SizedBox()
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              controller.tags.isNotEmpty
                                  ? Column(
                                      children: [
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          runAlignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            for (var tag
                                                in controller.tags.take(3))
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 5, bottom: 5),
                                                child: Chip(
                                                  backgroundColor: AppColor
                                                      .lightBlue
                                                      .withOpacity(0.6),
                                                  label: Text(
                                                    tag,
                                                    style: AppBasicStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontColor: AppColor.blue,
                                                    ),
                                                  ),
                                                  deleteIconColor:
                                                      AppColor.blue,
                                                  onDeleted: () {
                                                    controller.tags.remove(tag);
                                                  },
                                                ),
                                              ),
                                            controller.tags.length >= 3
                                                ? Chip(
                                                    backgroundColor:
                                                        AppColor.smoke,
                                                    label: Text(
                                                      '${controller.tags.length - 3} + more',
                                                      style: AppBasicStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontColor:
                                                            AppColor.blue,
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox()
                                          ],
                                        ),
                                      ],
                                    )
                                  : AppButton(
                                      height: 40,
                                      width: Get.width * 0.3,
                                      backgroundColor: AppColor.blue,
                                      child: Text(
                                        'Add Expertise',
                                        style: AppBasicStyle(
                                          fontColor: AppColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(() => ExpertiseSearchView());
                                      },
                                    ),
                            ],
                          );
                        }))
                  ],
                ),
                AppTextInput(
                  maxLines: 2,
                  controller: controller.bio,
                  hintText: biodata,
                  labelText: 'Bio',
                  errorText: 'Invalid bio',
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    return validateEmpty(value!, 'Bio is required');
                  },
                ),
                AppTextInput(
                  controller: controller.firts_name,
                  labelText: 'First Name',
                  hintText: '${user.firstName}',
                  errorText: 'Invalid first name',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return validateEmpty(value!, 'First name is required');
                  },
                ),
                AppTextInput(
                  controller: controller.last_name,
                  labelText: 'First Name',
                  hintText: ' ${user.lastName}',
                  errorText: 'Invalid last name',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return validateEmpty(value!, 'last name is required');
                  },
                ),
                // AppDropDown(
                //   label: 'Job Role',
                //   items: skills.isEmpty ? ['No data'] : skills,
                //   controller: controller.jobRoles,
                //   errorText: 'Invalid job role',
                // ),
                // AppTextInput(
                //   controller: controller.birthDate,
                //   onTap: () {
                //     showDate(context, controller.birthDate);
                //   },
                //   readOnly: true,
                //   labelText: 'Birth Date',
                //   hintText: 'Enter birth date',
                //   errorText: 'Invalid birth date',
                //   suffix: IconButton(
                //     onPressed: () {
                //       showDate(context, controller.birthDate);
                //     },
                //     icon: const Icon(
                //       Icons.calendar_today,
                //       color: AppColor.blue,
                //     ),
                //   ),
                //   keyboardType: TextInputType.datetime,
                //   validator: (value) {
                //     return validateEmpty(value!, 'Birth date is required');
                //   },
                // ),
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
                  initialCountryCode: "ID",
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
                  validator: (value) {
                    return validateEmpty(value!, 'Email is required');
                  },
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
                Obx(
                  () => InkWell(
                    onTap: () {
                      controller.cv_file.value != ''
                          ? controller.pickFile()
                          : SfPdfViewer.network(
                              controller.cv_file.value.path,
                              key: GlobalKey(),
                            ).toString();
                    },
                    borderRadius: BorderRadius.circular(10),
                    splashColor: AppColor.blue.withOpacity(0.5),
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
                                controller.cv_file.value.path != ''
                                    ? controller.cv_file.value.path
                                        .split('/')
                                        .last
                                    : 'Upload Cv',
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
