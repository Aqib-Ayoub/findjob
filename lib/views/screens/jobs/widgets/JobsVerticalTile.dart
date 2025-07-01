import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:findjob/views/screens/jobs/job_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/route_manager.dart';

class JobsVerticalTile extends StatelessWidget {
  const JobsVerticalTile({super.key, required this.job});

  final JobsResponse job;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => JobDetails(
              title: job.title,
              id: job.id,
              agentName: job.agentId,
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            height: hieght * 0.1,
            width: width,
            decoration: BoxDecoration(
              color: Color(kLightGrey.value),
              borderRadius: BorderRadius.all(Radius.circular(9.w)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.w,
                          backgroundImage: NetworkImage(job.imageUrl),
                        ),
                        WidthSpacer(width: 10.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: job.company,
                              style: appstyle(
                                16,
                                Color(kDark.value),
                                FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.5,
                              child: ReusableText(
                                text: job.title,
                                style: appstyle(
                                  12,
                                  Color(kDarkGrey.value),
                                  FontWeight.w500,
                                ),
                              ),
                            ),
                            ReusableText(
                              text: '${job.salary} per ${job.period}',
                              style: appstyle(
                                12,
                                Color(kDarkGrey.value),
                                FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 18.w,
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
