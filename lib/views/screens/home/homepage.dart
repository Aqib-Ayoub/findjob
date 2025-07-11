import 'package:findjob/controllers/login_provider.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/cached_network_image.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/heading_widget.dart';
import 'package:findjob/views/common/search.dart';
import 'package:findjob/views/screens/auth/profile.dart';
import 'package:findjob/views/screens/jobs/job_list.dart';
import 'package:findjob/views/screens/jobs/widgets/PopularJobs.dart';
import 'package:findjob/views/screens/jobs/widgets/Recentlist.dart';
import 'package:findjob/views/screens/search/widgets/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      'https://imgs.search.brave.com/l0Xmc6G-daKFtHTlxFw8vwXoGXPbl7-dUyzH9qFp4a0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9hcGkvbWVk/aWEvc21hbGwvMTA2/NjUzNTUvc3RvY2st/cGhvdG8tM2QtYWJz/dHJhY3QtYW5kLWZ1/dHVyaXN0aWMtbGV0/dGVyLXM';
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    loginNotifier.getPrefs();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          action: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ProfilePage(drawer: false));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  child: CachedNetworkImage(
                    image: imageUrl,
                    height: 25.h,
                    width: 25.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(color: Color(kDark.value)),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search \n Find & Apply',
                  style: appstyle(30, Color(kDark.value), FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                SearchWidget(
                  onTap: () {
                    Get.to(() => SearchPage());
                  },
                ),
                SizedBox(height: 30.h),
                HeadingWidget(
                  text: 'Popular Jobs',
                  onTap: () {
                    Get.to(() => JobListPage());
                  },
                ),
                SizedBox(height: 15.h),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.w)),
                  child: Popularjobs(),
                ),
                SizedBox(height: 15.h),
                HeadingWidget(
                  text: 'Recently Posted Jobs',
                  onTap: () {
                    Get.to(() => JobListPage());
                  },
                ),
                SizedBox(height: 15.h),
                RecentJobs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
