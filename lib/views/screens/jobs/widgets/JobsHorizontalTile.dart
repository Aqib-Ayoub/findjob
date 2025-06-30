import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobsHorizontalTile extends StatelessWidget {
  const JobsHorizontalTile({super.key, this.onTap, required this.job});
  final void Function()? onTap;
  final JobsResponse job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.w)),
          child: Container(
            height: hieght * 0.27,
            width: width * 0.7,
            decoration: BoxDecoration(
              color: Color(kLightGrey.value),
              image: DecorationImage(
                image: AssetImage('assets/images/jobs.png'),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(job.imageUrl),
                    ),
                    WidthSpacer(width: 15.w),
                    Container(
                      width: 160.w,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Color(kLight.value),
                        borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      ),
                      child: ReusableText(
                        text: job.company,
                        style: appstyle(
                          22,
                          Color(kDark.value),
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
