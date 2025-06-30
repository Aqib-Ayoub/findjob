import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.text, required this.child, this.action});

  final String? text;
  final Widget child;
  final List<Widget>? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(),
      backgroundColor: Color(kLight.value),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: child,
      actions: action,
      title: ReusableText(
        text: text ?? '',
        style: appstyle(16, Color(kDark.value), FontWeight.w600),
      ),
    );
  }
}
