import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobfortech/app/modules/Profile/controllers/profile_controller.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppTextInput/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class EditProfileView extends GetView<ProfileController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dropdown = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _birthdate = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final controller = Get.put(ProfileController());
  String _selectedCountryCode = '+62';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeaderbar(
          backgroundColor: AppColor.blue,
          automaticallyImplyLeading: true,
          leading: Text(
            'Edit Profile',
            style: AppBasicStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontColor: AppColor.white),
          ),
        ),
        body: AppSafeArea(
          safearea: resSafeArea,
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
                            : null);
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
            const SizedBox(height: 20),
            AppTextInput(labelText: 'Full Name', hintText: ''),
            const SizedBox(height: 20),
            AppTextInput(
              readOnly: true,
              labelText: 'Your Tech, Role',
              hintText: '',
              suffix: PopupMenuButton<String>(
                icon: SvgPicture.asset('assets/svgs/arrows-alt-arrow-down.svg',
                    width: 20, height: 20),
                onSelected: (String newValue) {
                  _dropdown.text = newValue;
                },
                itemBuilder: (BuildContext context) {
                  return [
                    'Android Developer',
                    'UI/UX',
                    'Backend Developer',
                    'Frontend Developer',
                  ].map((String value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList();
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Contact',
              style: AppTitleHeader,
            ),
            AppTextInput(
              readOnly: true,
              labelText: '',
              hintText: '',
              prefix: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCountryCode,
                            icon: SvgPicture.asset(
                                'assets/svgs/arrows-alt-arrow-down.svg',
                                width: 20,
                                height: 20),
                            items: const [
                              DropdownMenuItem(
                                  value: '+62',
                                  child: Text(
                                    '+62',
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w600),
                                  )),
                              DropdownMenuItem(
                                  value: '+1',
                                  child: Text(
                                    '+1',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )),
                            ],
                            onChanged: (String? newValue) {
                              // setState(() {
                              //   _selectedCountryCode = newValue!;
                              // });
                            },
                          ),
                        ),
                      ),
                      Text('')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextInput(
              labelText: 'Email',
              hintText: '',
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextInput(
                readOnly: true,
                labelText: 'Birth Date',
                hintText: '',
                suffix: const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColor.blue,
                )),
            const SizedBox(
              height: 20,
            ),
            AppTextInput(
              labelText: 'Address',
              hintText: '',
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextInput(
              readOnly: true,
              labelText: 'City',
              hintText: '',
              suffix: PopupMenuButton<String>(
                icon: SvgPicture.asset('assets/svgs/arrows-alt-arrow-down.svg',
                    width: 20, height: 20),
                onSelected: (String newValue) {
                  _dropdown.text = newValue;
                },
                itemBuilder: (BuildContext context) {
                  return [
                    'Indonesia',
                    'Ameriika',
                    'China',
                    'Korea',
                  ].map((String value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList();
                },
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Link Account',
              style: AppTitleHeader,
            ),
            const SizedBox(height: 20),
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
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 20,
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ));
  }
}
