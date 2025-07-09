import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/exports.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/screens/auth/non_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(color: Color(kDark.value)),
          ),
        ),
      ),
      body:
          loginNotifier.loggedIn == false
              ? NonUser()
              : Center(
                child: ReusableText(
                  text: 'Applied Jobs',
                  style: appstyle(30, Color(kDark.value), FontWeight.bold),
                ),
              ),
    );
  }
}
