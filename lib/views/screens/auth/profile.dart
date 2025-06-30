import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/cached_network_image.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.drawer});
  final bool drawer;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
            child:
                widget.drawer == false
                    ? BackBtn()
                    : DrawerWidget(color: Color(kDark.value)),
          ),
        ),
      ),
      body: Container(child: Center(child: Text('Profile Page'))),
    );
  }
}
