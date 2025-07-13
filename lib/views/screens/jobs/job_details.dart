import 'package:findjob/controllers/exports.dart';
import 'package:findjob/models/request/bookmarks/book_res.dart';
import 'package:findjob/models/response/bookmarks/bookmark_res.dart';
import 'package:findjob/models/response/jobs/get_job.dart';
import 'package:findjob/services/helpers/jobs_helper.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/custom_outline_btn.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/pages_loader.dart';
import 'package:findjob/views/common/styled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({
    super.key,
    required this.title,
    required this.id,
    required this.agentName,
  });
  final String title;
  final String id;
  final String agentName;

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  late Future<GetJobRes> job;

  @override
  void initState() {
    getJob();
    super.initState();
  }

  getJob() {
    job = JobsHelper.getJob(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifiere = Provider.of<LoginNotifier>(context);
    return Consumer<JobsNotifier>(
      builder: (context, jobsNotifier, child) {
        jobsNotifier.getJob(widget.id);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              action: [
                loginNotifiere.loggedIn == true
                    ? Consumer<BookNotifier>(
                      builder: (context, bookNotifier, child) {
                        bookNotifier.getBookmark(widget.id);
                        return GestureDetector(
                          //TODO
                          onTap: () {
                            if (bookNotifier.bookmark == true) {
                              bookNotifier.deleteBookmark(
                                bookNotifier.bookmarkId,
                              );
                            } else {
                              BookmarkReqRes model = BookmarkReqRes(
                                job: widget.id,
                              );
                              var newModel = bookmarkReqResToJson(model);
                              bookNotifier.addBookmark(newModel);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Icon(
                              bookNotifier.bookmark == false
                                  ? Fontisto.bookmark
                                  : Fontisto.bookmark_alt,
                            ),
                          ),
                        );
                      },
                    )
                    : SizedBox.shrink(),
              ],
              child: BackBtn(),
            ),
          ),
          body: buildStyledContainer(
            context,
            FutureBuilder(
              future: job,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: PageLoader());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final job = snapshot.data;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Stack(
                      children: [
                        ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Container(
                              width: width,
                              height: hieght * 0.27,

                              decoration: BoxDecoration(
                                color: Color(kLightGrey.value),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/jobs.png'),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(9.w),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30.w,
                                    backgroundImage: NetworkImage(
                                      job!.imageUrl,
                                    ),
                                  ),

                                  HeightSpacer(size: 10),
                                  ReusableText(
                                    text: job.title,
                                    style: appstyle(
                                      16,
                                      Color(kDark.value),
                                      FontWeight.w600,
                                    ),
                                  ),
                                  HeightSpacer(size: 5),
                                  ReusableText(
                                    text: job.location,
                                    style: appstyle(
                                      16,
                                      kDarkGrey,
                                      FontWeight.w600,
                                    ),
                                  ),
                                  HeightSpacer(size: 15),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomOutlineBtn(
                                          width: width * 0.26,
                                          text: job.contract,
                                          color: Color(kOrange.value),
                                        ),

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
                                              text: '/${job.period}',
                                              style: appstyle(
                                                16,
                                                Color(kDarkGrey.value),
                                                FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            HeightSpacer(size: 20.w),
                            ReusableText(
                              text: 'Description',
                              style: appstyle(
                                16,
                                Color(kDark.value),
                                FontWeight.w600,
                              ),
                            ),
                            HeightSpacer(size: 10),
                            Text(
                              job.description,
                              textAlign: TextAlign.justify,
                              style: appstyle(
                                12,
                                Color(kDarkGrey.value),
                                FontWeight.w600,
                              ),
                            ),
                            HeightSpacer(size: 20.w),
                            ReusableText(
                              text: 'Requirements',
                              style: appstyle(
                                16,
                                Color(kDark.value),
                                FontWeight.w600,
                              ),
                            ),
                            HeightSpacer(size: 10),
                            SizedBox(
                              height: hieght * 0.6,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: job.requirements.length,
                                itemBuilder: (context, index) {
                                  var requirements = job.requirements[index];
                                  String bullit = '\u2022 ';
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 12.w),
                                    child: Text(
                                      '$bullit $requirements',
                                      style: appstyle(
                                        12,
                                        Color(kDarkGrey.value),
                                        FontWeight.normal,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.w),
                            child: CustomOutlineBtn(
                              height: hieght * 0.06,
                              text:
                                  loginNotifiere.loggedIn == false
                                      ? 'Please Login'
                                      : 'Apply',
                              color: Color(kLight.value),
                              background: Color(kOrange.value),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
