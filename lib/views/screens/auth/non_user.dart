import 'package:findjob/views/common/cached_network_image.dart';
import 'package:findjob/views/common/custom_outline_btn.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/styled_container.dart';
import 'package:findjob/views/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class NonUser extends StatelessWidget {
  const NonUser({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://avatars.githubusercontent.com/u/52028089?s=96&v=4';
    return buildStyledContainer(
      context,
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(99.w)),
            child: CachedNetworkImage(
              image: imageUrl,
              fit: BoxFit.cover,
              width: 70.w,
              height: 70..w,
            ),
          ),
          HeightSpacer(size: 20.h),
          ReusableText(
            text: 'To access content please login',
            style: appstyle(12, Color(kDarkGrey.value), FontWeight.normal),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
            child: CustomOutlineBtn(
              onTab: () {
                Get.to(() => LoginPage());
              },
              width: width,
              height: 40.h,
              text: 'Proceed to Login',
              color: Color(kOrange.value),
            ),
          ),
        ],
      ),
    );
  }
}
