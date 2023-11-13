import 'package:flutter/material.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/auth_controller.dart';
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
      appBar: AppHeaderbar(
        height: 100,
        backgroundColor: AppColor.blue,
        toolbarHeight: 70,
        leading: Row(
          children: [
            GetX<UserController>(
              builder: (controller2) {
                return AppAvatar(
                    radius: 20,
                    outlineColor: AppColor.white,
                    path: controller2.user.value.profile?.photoProfile ?? null);
              },
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                GetX<UserController>(
                  builder: (controller2) {
                    return Text(
                      controller2.user.value.firstName ?? 'No data',
                      style: AppBasicStyle(
                        fontSize: 16,
                        fontColor: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                GetX<UserController>(
                  builder: (controller) {
                    final email = controller.user.value.email ?? 'No';
                    return Text(
                      '$email',
                      style: AppBasicStyle(
                        fontSize: 12,
                        fontColor: AppColor.white,
                      ),
                    );
                  },
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
                  textAlign: TextAlign.center,
                ),
                radius: 20,
                height: 25,
                width: 25,
                backgroundColor: AppColor.blue),
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
              final authController = Get.put(AuthController());
              authController.logout();
            },
          ),
        ],
      ),
    );
  }
}
