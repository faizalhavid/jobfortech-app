import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Menu/views/edit_profile_view.dart';
import 'package:jobfortech/app/modules/Menu/views/latest_work_view.dart';
import 'package:jobfortech/app/modules/Menu/views/payroll_view.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
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
          _buildProfileButton(
              path: 'assets/svgs/user-rounded.svg',
              text: 'Edit Profile',
              onTap: () {
                Get.to(() => EditProfileView());
                print('Edit Profile tapped');
              }),
          _buildProfileButton(
              path: 'assets/svgs/money-bill.svg',
              text: 'Payroll',
              onTap: () {
                Get.to(() => PayrollView());
                print('Payroll tapped');
              }),
          _buildProfileButton(
              path: 'assets/svgs/notes-list.svg',
              text: 'Latest Work',
              onTap: () {
                Get.to(() => LatestWorkView());
                print('Latest Work tapped');
              }),
          _buildProfileButton(
              path: 'assets/svgs/reviews-icon.svg',
              text: 'Reviews',
              onTap: () {
                print('Reviews tapped');
              }),
          _buildProfileButton(
              path: 'assets/svgs/money-ticket.svg',
              text: 'Referral Program',
              onTap: () {
                print('Referral Program tapped');
              }),
          _buildProfileButton(
              path: 'assets/svgs/info-circle.svg',
              text: 'About Us',
              onTap: () {
                print('About US tapped');
              }),
          _buildProfileButton(
              path: 'assets/svgs/headphones-round.svg',
              text: 'Help Center',
              onTap: () {
                print('Help Center tapped');
              }),
          _buildProfileButton(
              path: 'assets/svgs/action-logout.svg',
              text: 'Log Out',
              onTap: () {
                print('Log Out tapped');
              }),
        ],
      ),
    );
  }

  Widget _buildProfileButton(
      {required String path,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: AppIcon(svgPath: path, color: AppColor.blue, size: 26),
      title: Text(text),
      onTap: onTap,
    );
  }
}
