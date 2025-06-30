import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn({super.key, this.width, this.height, required this.text, this.onTab, required this.color, required this.background});
  final double? width;
  final double? height;
  final String text;
  final void Function()? onTab;
  final Color color;
  final Color background;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(9)),
          color: background,
          border: Border.all(
            width: 1,
            color: color
          )
        ),
        child: Center(
          child: ReusableText(text: text, style: appstyle(14, color, FontWeight.bold)),
        ),
      ),
    );
  }
}