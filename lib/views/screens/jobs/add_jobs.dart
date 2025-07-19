import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddJobs extends StatelessWidget {
  const AddJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kLightBlue.value),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.w),
        child: CustomAppBar(child: BackBtn()),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(kLightBlue.value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
