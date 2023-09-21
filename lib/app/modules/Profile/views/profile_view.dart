import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Profile/views/edit_profile_view.dart';
import 'package:jobfortech/app/modules/Profile/views/latest_work_view.dart';
import 'package:jobfortech/app/modules/Profile/views/payroll_view.dart';
import 'package:jobfortech/app/modules/Profile/views/referral_program_view.dart';
import 'package:jobfortech/app/modules/Profile/views/reviews_view.dart';
import 'package:jobfortech/components/AppListTile/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
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
              }),
          AppListTile(
              leading: AppIcon(
                  svgPath: 'assets/svgs/money-bill.svg',
                  color: AppColor.blue,
                  size: 26),
              text: 'Payroll',
              onTap: () {
                Get.to(() => PayrollView());
                print('Payroll tapped');
              }),
          AppListTile(
              leading: AppIcon(
                  svgPath: 'assets/svgs/notes-list.svg',
                  color: AppColor.blue,
                  size: 26),
              text: 'Latest Work',
              onTap: () {
                Get.to(() => LatestWorkView());
                print('Latest Work tapped');
              }),
          AppListTile(
              leading: AppIcon(
                  svgPath: 'assets/svgs/reviews-icon.svg',
                  color: AppColor.blue,
                  size: 26),
              text: 'Reviews',
              onTap: () {
                Get.to(() => ReviewsView());
                print('Reviews tapped');
              }),
          AppListTile(
              leading: AppIcon(
                  svgPath: 'assets/svgs/money-ticket.svg',
                  color: AppColor.blue,
                  size: 26),
              text: 'Referral Program',
              onTap: () {
                Get.to(() => ReferralProgramView());
                print('Referral Program tapped');
              }),
          AppListTile(
              leading: AppIcon(
                  svgPath: 'assets/svgs/info-circle.svg',
                  color: AppColor.blue,
                  size: 26),
              text: 'About Us',
              onTap: () {
                print('About US tapped');
              }),
          AppListTile(
              leading: AppIcon(
                  svgPath: 'assets/svgs/headphones-round.svg',
                  color: AppColor.blue,
                  size: 26),
              text: 'Help Center',
              onTap: () {
                print('Help Center tapped');
              }),
          AppListTile(
              leading: AppIcon(
                  svgPath: 'assets/svgs/action-logout.svg',
                  color: AppColor.blue,
                  size: 26),
              text: 'Log Out',
              onTap: () {
                print('Log Out tapped');
              }),
        ],
      ),
    );
  }
}
