import 'package:flutter/material.dart';
import 'package:jobfortech/constant/theme.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool isPreviousMessageFromSameSender;
  final String? senderName;
  final bool showSenderName;

  MessageBubble({
    required this.text,
    required this.isSender,
    required this.isPreviousMessageFromSameSender,
    this.senderName,
    this.showSenderName = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (showSenderName && !isSender) ...[
            Text(senderName ?? "",
                style: AppBasicStyle(
                    fontColor: AppColor.osean,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 2),
          ],
          Container(
            margin: EdgeInsets.only(
              top: isPreviousMessageFromSameSender ? 4 : 10,
              bottom: 8,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: isSender ? AppColor.darkBlue : AppColor.lightBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: isSender
                    ? (isPreviousMessageFromSameSender
                        ? Radius.circular(0)
                        : Radius.circular(12))
                    : Radius.circular(0),
                bottomRight: isSender
                    ? Radius.circular(0)
                    : (isPreviousMessageFromSameSender
                        ? Radius.circular(0)
                        : Radius.circular(12)),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(color: isSender ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
