import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/custom_outline_btn.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/screens/mainscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset('assets/images/page3.png'),
            SizedBox(
              height: 20.h,
            ),
            ReusableText(text: 'Welcome to FindJob', style: appstyle(30, Color(kLight.value), FontWeight.w600),),
            SizedBox(
              height: 15.h,
      
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text('Discover your dream job with FindJob — explore thousands of opportunities, apply in seconds, and take the next step in your career journey.',textAlign: TextAlign.center, style: appstyle(14, Color(kLight.value), FontWeight.normal),),
            ),
            SizedBox(height: 15,),
            CustomOutlineBtn(
              onTab: (){
                Get.to(()=> MainScreen());
              },
              text: 'Continue as guest',
              height: hieght * 0.05,
              width: width *0.9,
              color: Color(kLight.value),
              background: Color(kLightBlue.value),
            
            ),

          ],
        ),
      ),
    );
  }
}