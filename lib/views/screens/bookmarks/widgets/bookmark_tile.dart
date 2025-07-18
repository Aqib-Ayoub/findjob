import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/models/request/bookmarks/all_bookmarks.dart';

import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/custom_outline_btn.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:findjob/views/screens/jobs/job_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BookmarkTile extends StatelessWidget {
  const BookmarkTile({super.key, required this.bookmark});
  final AllBookMarks bookmark;

  @override
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => JobDetails(
              title: bookmark.job.title,
              id: bookmark.job.id,
              agentName: bookmark.job.agentId,
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
              color: Color(0x09000000),
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
                          backgroundImage: NetworkImage(bookmark.job.imageUrl),
                        ),
                        WidthSpacer(width: 10.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: bookmark.job.company,
                              style: appstyle(
                                12,
                                Color(kDark.value),
                                FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.5,
                              child: ReusableText(
                                text: bookmark.job.title,
                                style: appstyle(
                                  12,
                                  Color(kDarkGrey.value),
                                  FontWeight.w500,
                                ),
                              ),
                            ),
                            ReusableText(
                              text:
                                  '${bookmark.job.salery} per ${bookmark.job.period}',
                              style: appstyle(
                                12,
                                Color(kDarkGrey.value),
                                FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        CustomOutlineBtn(
                          width: 90.w,
                          height: 36.h,

                          text: 'View',
                          color: Color(kLightBlue.value),
                        ),
                      ],
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
