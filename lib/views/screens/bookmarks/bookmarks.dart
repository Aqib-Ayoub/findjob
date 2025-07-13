import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/exports.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/cached_network_image.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/screens/auth/non_user.dart';
import 'package:findjob/views/screens/auth/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  String imageUrl =
      'https://imgs.search.brave.com/l0Xmc6G-daKFtHTlxFw8vwXoGXPbl7-dUyzH9qFp4a0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9hcGkvbWVk/aWEvc21hbGwvMTA2/NjUzNTUvc3RvY2st/cGhvdG8tM2QtYWJz/dHJhY3QtYW5kLWZ1/dHVyaXN0aWMtbGV0/dGVyLXM';

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Bookmark',
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
                  text: 'Bookmarks Page',
                  style: appstyle(30, Color(kDark.value), FontWeight.bold),
                ),
              ),
    );
  }
}
