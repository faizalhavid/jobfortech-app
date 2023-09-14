import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/constant/theme.dart';

class ChatNotification {
  final String sender;
  final String latestMessage;
  final String time;
  final bool isRead;
  final String? unreadCount;
  final VoidCallback? onTap;

  ChatNotification({
    required this.sender,
    required this.latestMessage,
    required this.time,
    this.isRead = false,
    this.unreadCount,
    this.onTap,
  });
}

class ChatNotificationComponent extends StatelessWidget {
  final ChatNotification chatNotification;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? trailingStyle;
  final Color containerColor;

  ChatNotificationComponent({
    Key? key,
    required this.chatNotification,
    this.titleStyle,
    this.subtitleStyle,
    this.trailingStyle,
    this.containerColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chatNotification.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        color: containerColor,
        child: ListTile(
          leading: CircleAvatar(
            child: Text(chatNotification.sender[0]),
          ),
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatNotification.sender,
                  style: titleStyle,
                ),
                SizedBox(height: 5.0),
                Text(
                  chatNotification.latestMessage,
                  style: subtitleStyle?.copyWith(
                        height: 1.5,
                      ) ??
                      TextStyle(height: 1.5),
                ),
              ],
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chatNotification.time,
                style: trailingStyle ??
                    AppBasicStyle(fontSize: 12, fontColor: AppColor.grey),
              ),
              if (!chatNotification.isRead &&
                  chatNotification.unreadCount != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.blue,
                    child: Text(
                      chatNotification.unreadCount!,
                      style: AppBasicStyle(
                          fontSize: 10, fontColor: AppColor.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
