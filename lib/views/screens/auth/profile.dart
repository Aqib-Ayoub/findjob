import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/exports.dart';
import 'package:findjob/controllers/login_provider.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/cached_network_image.dart';
import 'package:findjob/views/common/custom_outline_btn.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:findjob/views/screens/auth/non_user.dart';
import 'package:findjob/views/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.drawer});
  final bool drawer;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child:
                widget.drawer == false
                    ? BackBtn()
                    : DrawerWidget(color: Color(kDark.value)),
          ),
        ),
      ),
      body:loginNotifier.loggedIn ==false ? NonUser() :  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Consumer<LoginNotifier>(
            builder: (context, loginNotifier, child) {
              return CustomOutlineBtn(
                onTab: () {
                  zoomNotifier.currentIndex = 0;
                  loginNotifier.logout();
                  Get.to(() => MainScreen());
                },
                width: width,
                height: 60,
                text: 'Logout',
                color: Color(kLight.value),
                background: Color(Colors.red.value),
              );
            },
          ),
        ),
      ),
    );
  }
}
