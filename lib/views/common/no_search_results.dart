import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoSearchResults extends StatelessWidget {
  const NoSearchResults({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/optimized_search.png'),
          WidthSpacer(width: 20),
          ReusableText(
            text: text,
            style: appstyle(18, Color(kDark.value), FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
