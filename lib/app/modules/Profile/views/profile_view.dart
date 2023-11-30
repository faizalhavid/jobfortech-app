import 'package:flutter/material.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech2/app/modules/Auth/views/change_password.dart';
import 'package:jobfortech2/app/modules/Auth/views/email_verify_view.dart';
import 'package:jobfortech2/app/modules/Auth/views/welcome_user_view.dart';
import 'package:jobfortech2/app/modules/Profile/controllers/profile_controller.dart';
import 'package:jobfortech2/app/modules/Profile/views/edit_profile_view.dart';
import 'package:jobfortech2/app/modules/Profile/views/payroll_view.dart';
import 'package:jobfortech2/app/utils/globalController.dart';
import 'package:jobfortech2/components/AppAvatar/index.dart';
import 'package:jobfortech2/components/AppBadge/index.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/components/AppListTile/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSafeArea(
        safearea: {'horizontal': 16, 'vertical': 40},
        children: [
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/user-rounded.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Edit Profile',
            onTap: () {
              Get.to(() => EditProfileView());
            },
          ),
          SizedBox(
            height: 5,
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/reset-password.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Change Password',
            onTap: () {
              Get.to(() => ChangePasswordView());
            },
          ),
          SizedBox(
            height: 5,
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/info-circle.svg',
                color: AppColor.blue,
                size: 26),
            text: 'About Us',
            onTap: () {
              Get.to(() => WelcomeUserView(isAboutUs: true));
            },
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/headphones-round.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Help Center',
            onTap: () {
              print('Help Center tapped');
            },
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/action-logout.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Log Out',
            onTap: () {
              final authController = Get.put(AuthController());
              authController.logout();
            },
          ),
        ],
      ),
    );
  }
}
