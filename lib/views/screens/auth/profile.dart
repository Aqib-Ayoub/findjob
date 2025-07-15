import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/exports.dart';
import 'package:findjob/models/response/auth/profile_model.dart';
import 'package:findjob/services/helpers/auth_helper.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/cached_network_image.dart';
import 'package:findjob/views/common/custom_outline_btn.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/pages_loader.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/common/styled_container.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:findjob/views/screens/auth/non_user.dart';
import 'package:findjob/views/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.drawer});
  final bool drawer;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<ProfileRes> userProfile;
  String username = '';

  @override
  void initState() {
    super.initState();
    getProfile();
    getName();
  }

  getProfile() {
    var loginNotifier = Provider.of<LoginNotifier>(context, listen: false);
    if (widget.drawer == false && loginNotifier.loggedIn == true) {
      userProfile = AuthHelper.getProfile();
    } else if (widget.drawer == true && loginNotifier.loggedIn == true) {
      userProfile = AuthHelper.getProfile();
    } else {}
  }

  getName() async {
    var loginNotifier = Provider.of<LoginNotifier>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.drawer == false && loginNotifier.loggedIn == true) {
      setState(() {
        username = prefs.getString('username') ?? '';
      });
    } else if (widget.drawer == true && loginNotifier.loggedIn == true) {
      setState(() {
        username = prefs.getString('username') ?? '';
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: loginNotifier.loggedIn ? username.toUpperCase() : '',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child:
                widget.drawer == false
                    ? BackBtn()
                    : DrawerWidget(color: Color(kDark.value)),
          ),
        ),
      ),
      body:
          loginNotifier.loggedIn == false
              ? NonUser()
              : FutureBuilder(
                future: userProfile,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return PageLoader();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    var profile = snapshot.data;
                    return buildStyledContainer(
                      context,
                      ListView(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: width,
                            height: hieght * 0.07,
                            decoration: BoxDecoration(
                              color: Color(kGreen.value),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircularAvata(
                                      image: profile!.profile,
                                      w: 50,
                                      h: 50,
                                    ),
                                    WidthSpacer(width: 20.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReusableText(
                                          text: profile.username,
                                          style: appstyle(
                                            14,
                                            kDarkGrey,
                                            FontWeight.w400,
                                          ),
                                        ),
                                        ReusableText(
                                          text: profile.email,
                                          style: appstyle(
                                            14,
                                            Color(kDarkGrey.value),
                                            FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Feather.edit),
                              ],
                            ),
                          ),

                          HeightSpacer(size: 20),

                          CustomOutlineBtn(
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
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
    );
  }
}

class CircularAvata extends StatelessWidget {
  const CircularAvata({
    super.key,
    required this.image,
    required this.w,
    required this.h,
  });
  final String image;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(99.w)),
      child: CachedNetworkImage(
        image: image,
        width: w,
        height: h,
        fit: BoxFit.cover,
      ),
    );
  }
}
