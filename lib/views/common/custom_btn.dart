import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.color, this.onTap});

  final String text;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: hieght * 0.065,
        decoration: BoxDecoration(
          color: Color(kOrange.value),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appstyle(16, color ?? Color(kLight.value), FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
