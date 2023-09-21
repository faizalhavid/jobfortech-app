import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:jobfortech/app/modules/Dashboard/views/messages_detail_view.dart';
import 'package:jobfortech/app/modules/Profile/views/profile_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppBadge/AppMessages/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class MessagesView extends GetView {
  const MessagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notifyState = Get.put(DashboardController());
    return Scaffold(
      appBar: AppHeaderbar(
        expandAppbar: true,
        type: 'default',
        leading: InkWell(
          child: AppAvatar(),
          onTap: () {
            Get.to(() => ProfileView());
          },
        ),
        title: AppIcon(
          svgPath: 'assets/svgs/jobfortech-logo.svg',
          size: 24,
          editColor: true,
          color: AppColor.white,
        ),
        actions: Obx(
          () => AppIconButton(
            svgPath: 'assets/svgs/notifications-bell.svg',
            onPressed: () {
              notifyState.isNotify.value = !notifyState.isNotify.value;
            },
            isbadge: notifyState.isNotify.value,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChatNotificationComponent(
              containerColor: AppColor.lightBlue,
              chatNotification: ChatNotification(
                  sender: 'Job For Tech',
                  latestMessage:
                      'Lorem ipsum dolor sit amet consectetur. Fringilla molestie Fringilla molestie Fringilla ',
                  time: '15:51',
                  unreadCount: '2',
                  onTap: () {
                    Get.to(() => MessagesDetailView());
                  }),
              titleStyle: AppBasicStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitleStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              trailingStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
            ),
            ChatNotificationComponent(
              chatNotification: ChatNotification(
                  sender: 'Social Media Project',
                  latestMessage:
                      'Craig Rosser : Lorem ipsum dolor sit amet consectetur molestie Fringilla molestietieii',
                  time: '15:59',
                  unreadCount: '11'),
              titleStyle: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitleStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              trailingStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
            ),
            ChatNotificationComponent(
              chatNotification: ChatNotification(
                  sender: 'Finance App Project',
                  latestMessage:
                      'Craig Rosser : Lorem ipsum dolor sit amet consectetur molestie Fringilla molestietieii',
                  time: '13:29',
                  unreadCount: '2'),
              titleStyle: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitleStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              trailingStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
            ),
            ChatNotificationComponent(
              chatNotification: ChatNotification(
                  sender: 'E-Commerce Project',
                  latestMessage:
                      'Craig Rosser : Lorem ipsum dolor sit amet consectetur molestie Fringilla molestietieii',
                  time: '14:10',
                  unreadCount: '1'),
              titleStyle: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitleStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              trailingStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
            ),
            ChatNotificationComponent(
              chatNotification: ChatNotification(
                  sender: 'Shopee',
                  latestMessage:
                      'Craig Rosser : Lorem ipsum dolor sit amet consectetur molestie Fringilla molestietieii',
                  time: 'yesterday',
                  unreadCount: '11'),
              titleStyle: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitleStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              trailingStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
            ),
            ChatNotificationComponent(
              chatNotification: ChatNotification(
                sender: 'Education App Project',
                latestMessage:
                    'Craig Rosser : Lorem ipsum dolor sit amet consectetur molestie Fringilla molestietieii',
                time: '02/23/2023',
              ),
              titleStyle: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitleStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              trailingStyle:
                  AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}
