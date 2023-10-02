import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/controllers/auth_controller.dart';
import 'package:jobfortech/app/modules/Profile/controllers/profile_controller.dart';
import 'package:jobfortech/app/modules/Profile/views/profile_assesment_view.dart';
import 'package:jobfortech/app/modules/Profile/views/edit_profile_view.dart';
import 'package:jobfortech/app/modules/Profile/views/latest_work_view.dart';
import 'package:jobfortech/app/modules/Profile/views/payroll_view.dart';
import 'package:jobfortech/app/modules/Profile/views/referral_program_view.dart';
import 'package:jobfortech/app/modules/Profile/views/reviews_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppListTile/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeaderbar(
        height: 100,
        backgroundColor: AppColor.blue,
        toolbarHeight: 70,
        leading: Row(
          children: [
            AppAvatar(radius: 20, outlineColor: AppColor.white),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jaxson Rosser',
                  style: AppBasicStyle(
                    fontSize: 16,
                    fontColor: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rooserjaxon@mail.com',
                  style: AppBasicStyle(
                    fontSize: 14,
                    fontColor: AppColor.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: AppSafeArea(
        safearea: {'horizontal': 16, 'vertical': 20},
        children: [
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/user-rounded.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Edit Profile',
            onTap: () {
              Get.to(() => EditProfileView());
              print('Edit Profile tapped');
            },
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/assessment.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Profile Assessment',
            onTap: () {
              Get.to(() => ProfileAssessment());
              print('Profile Assessment tapped');
            },
          ),
          SizedBox(
            height: 5,
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/money-bill.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Payroll',
            onTap: () {
              Get.to(() => PayrollView());
              print('Payroll tapped');
            },
            trailing: AppBadge(
                child: Text(
                  '1',
                  style: AppBasicStyle(
                      fontSize: 12,
                      fontColor: AppColor.white,
                      fontWeight: FontWeight.bold),
                ),
                radius: 20,
                height: 5,
                backgroundColor: AppColor.blue),
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/notes-list.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Latest Work',
            onTap: () {
              Get.to(() => LatestWorkView());
              print('Latest Work tapped');
            },
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/reviews-icon.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Reviews',
            onTap: () {
              Get.to(() => ReviewsView());
              print('Reviews tapped');
            },
            trailing: AppBadge(
                child: Text(
                  '1',
                  style: AppBasicStyle(
                      fontSize: 12,
                      fontColor: AppColor.white,
                      fontWeight: FontWeight.bold),
                ),
                radius: 20,
                height: 5,
                backgroundColor: AppColor.blue),
          ),
          AppListTile(
            leading: AppIcon(
                svgPath: 'assets/svgs/money-ticket.svg',
                color: AppColor.blue,
                size: 26),
            text: 'Referral Program',
            onTap: () {
              Get.to(() => ReferralProgramView());
              print('Referral Program tapped');
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
              print('About US tapped');
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
              final logoutCOntroller = Get.put(AuthController());
              logoutCOntroller.googleSignOut();
            },
          ),
        ],
      ),
    );
  }
}
