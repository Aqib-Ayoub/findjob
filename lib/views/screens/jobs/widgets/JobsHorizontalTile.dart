import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
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
                          18,
                          Color(kDark.value),
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                HeightSpacer(size: 15.h),
                ReusableText(
                  text: job.title,
                  style: appstyle(18, Color(kDark.value), FontWeight.w600),
                ),
                HeightSpacer(size: 5),
                ReusableText(
                  text: job.location,
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ReusableText(
                          text: job.salary,
                          style: appstyle(
                            16,
                            Color(kDark.value),
                            FontWeight.w600,
                          ),
                        ),
                        ReusableText(
                          text: "/${job.period}",
                          style: appstyle(
                            18,
                            Color(kDarkGrey.value),
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(kLight.value),
                      child: Icon(Ionicons.chevron_forward),
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
