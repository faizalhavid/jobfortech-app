import 'package:flutter/material.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        height: 70.0,
        child: Row(
          children: [
            AppIconButton(svgPath: 'assets/svgs/link.svg', onPressed: () {}),
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Ketik pesan...',
                  hintStyle: TextStyle(color: AppColor.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColor.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: AppIconButton(
                svgPath: 'assets/svgs/send.svg',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
