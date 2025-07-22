import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/exports.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/cached_network_image.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:findjob/views/screens/auth/non_user.dart';
import 'package:findjob/views/screens/auth/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    String imageUrl =
        'https://imgs.search.brave.com/l0Xmc6G-daKFtHTlxFw8vwXoGXPbl7-dUyzH9qFp4a0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9hcGkvbWVk/aWEvc21hbGwvMTA2/NjUzNTUvc3RvY2st/cGhvdG8tM2QtYWJz/dHJhY3QtYW5kLWZ1/dHVyaXN0aWMtbGV0/dGVyLXM';

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
      body:
          loginNotifier.loggedIn == false
              ? NonUser()
              : Column(
                children: [
                  // Chat list
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      children: [
                        // Uploader message
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 6.h),
                            padding: EdgeInsets.all(12.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello! We liked your resume.',
                                  style: appstyle(
                                    14,
                                    Colors.black87,
                                    FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '10:12 AM',
                                  style: appstyle(
                                    10,
                                    Colors.grey,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Applicant message
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 6.h),
                            padding: EdgeInsets.all(12.h),
                            decoration: BoxDecoration(
                              color: Color(kLightBlue.value),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Thank you! When can we talk?',
                                  style: appstyle(
                                    14,
                                    Colors.white,
                                    FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '10:14 AM',
                                  style: appstyle(
                                    10,
                                    Colors.white70,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Another uploader message
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 6.h),
                            padding: EdgeInsets.all(12.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Let\'s connect tomorrow at 11 AM.',
                                  style: appstyle(
                                    14,
                                    Colors.black87,
                                    FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '10:15 AM',
                                  style: appstyle(
                                    10,
                                    Colors.grey,
                                    FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Let\'s connect tomorrow at 11 AM.',
                                  style: appstyle(
                                    14,
                                    Colors.black87,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Chat input
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Image icon
                        IconButton(
                          icon: Icon(Icons.image, color: Color(kDark.value)),
                          onPressed: () {
                            // Image picker logic goes here
                          },
                        ),
                        // Text field
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type a message...",
                              hintStyle: appstyle(
                                14,
                                Colors.grey,
                                FontWeight.normal,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 10.h,
                              ),
                            ),
                          ),
                        ),
                        // Send button
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Color(kLightBlue.value),
                          ),
                          onPressed: () {
                            // Send message logic goes here
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
