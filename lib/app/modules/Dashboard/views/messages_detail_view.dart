import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/components/AppAvatar/index.dart';
import 'package:jobfortech2/components/AppChat/index.dart';
import 'package:jobfortech2/components/AppNav/index_messages_send.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class MessagesDetailView extends GetView {
  const MessagesDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.5,
        title: Row(
          children: [
            AppAvatar(radius: 15),
            SizedBox(width: 10),
            const Text('E-Commerce Project'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AppSafeArea(
              safearea: {'horizontal': 25, 'vertical': 15},
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      MessageBubble(
                        text: 'Lorem ipsum consectetur. ',
                        isSender: false,
                        isPreviousMessageFromSameSender: true,
                        senderName: "John Doe",
                        showSenderName: false,
                      ),
                      MessageBubble(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet vulputate sit molestie varius.',
                        isSender: false,
                        isPreviousMessageFromSameSender: false,
                        senderName: "Craig Rosser",
                        showSenderName: true,
                      ),
                      MessageBubble(
                        text: 'Lorem ipsum dolor sit amet consectetur.',
                        isSender: true,
                        isPreviousMessageFromSameSender: false,
                        senderName: "Alexander",
                        showSenderName: false,
                      ),
                      MessageBubble(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Fringilla molestie amet ',
                        isSender: false,
                        isPreviousMessageFromSameSender: false,
                        senderName: "Makenna Donin",
                        showSenderName: true,
                      ),
                      MessageBubble(
                        text:
                            'Lorem ipsum Lorem ipsum dolor sit amet consectetur. Fringilla molestie.',
                        isSender: false,
                        isPreviousMessageFromSameSender: true,
                        senderName: "John Doe",
                        showSenderName: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomBottomNavBar(),
        ],
      ),
    );
  }
}
