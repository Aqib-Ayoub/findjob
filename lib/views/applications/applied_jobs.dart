import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:flutter/material.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableText(
          text: 'Applied Jobs',
          style: appstyle(30, Color(kDark.value), FontWeight.bold),
        ),
      ),
    );
  }
}
