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
import 'package:findjob/views/screens/auth/widgets/edit_button.dart';
import 'package:findjob/views/screens/auth/widgets/skills.dart';
import 'package:findjob/views/screens/jobs/add_jobs.dart';
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
  String profilePic = '';
  ProfileRes? profile;
  String image =
      'https://media.collegedekho.com/media/img/institute/logo/1423483994.jpg?width=48';

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
        profilePic = prefs.getString('profile') ?? '';
      });
    } else if (widget.drawer == true && loginNotifier.loggedIn == true) {
      setState(() {
        username = prefs.getString('username') ?? '';
        profilePic = prefs.getString('profile') ?? '';
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      backgroundColor: Color(kLightBlue.value),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          color: Color(kLightBlue.value),
          text: loginNotifier.loggedIn ? username.toUpperCase() : '',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child:
                widget.drawer == false
                    ? BackBtn()
                    : DrawerWidget(color: Color(kLight.value)),
          ),
        ),
      ),
      body:
          loginNotifier.loggedIn == false
              ? NonUser()
              : Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 20.h,
                      ),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Color(Color.fromARGB(255, 61, 32, 226).value),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircularAvata(
                                image: profile!.profile ?? image,
                                w: 50,
                                h: 50,
                              ),
                              WidthSpacer(width: 20.w),
                              SizedBox(
                                height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // ReusableText(
                                    //   text: username,
                                    //   style: appstyle(
                                    //     14,
                                    //     kLight,
                                    //     FontWeight.w400,
                                    //   ),
                                    // ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.white30,
                                      ),
                                      child: ReusableText(
                                        text: profile!.email ?? 'User email',
                                        style: appstyle(
                                          14,
                                          Color(kLight.value),
                                          FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Icon(
                                Feather.edit,
                                color: Color(kLight.value),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    top: 90.h,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),

                        color: Color(kLight.value),
                      ),

                      child: FutureBuilder(
                        future: userProfile,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return PageLoader();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            profile = snapshot.data;
                            return buildStyledContainer(
                              context,
                              ListView(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                children: [
                                  HeightSpacer(size: 30),
                                  ReusableText(
                                    text: 'Profile',
                                    style: appstyle(
                                      15,
                                      Color(kDark.value),
                                      FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 15),

                                  Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Color(kLightGrey.value),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(kLight.value),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12),
                                                ),
                                              ),
                                              child: Icon(
                                                AntDesign.pdffile1,
                                                size: 35,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ReusableText(
                                                  text: 'Upload Your Resume',
                                                  style: appstyle(
                                                    15,
                                                    Color(kDark.value),
                                                    FontWeight.w400,
                                                  ),
                                                ),
                                                HeightSpacer(size: 5),
                                                ReusableText(
                                                  text:
                                                      'Please make sure to upload your resume in pdf format',
                                                  style: appstyle(
                                                    8,
                                                    Color(kDark.value),
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(right: 0, child: EditButton()),
                                    ],
                                  ),
                                  HeightSpacer(size: 25),
                                  SkillsWidget(),
                                  HeightSpacer(size: 20),

                                  !profile!.isAgent
                                      ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ReusableText(
                                            text: 'Agent Section',
                                            style: appstyle(
                                              14,
                                              Color(kDark.value),
                                              FontWeight.w600,
                                            ),
                                          ),
                                          HeightSpacer(size: 10),
                                          CustomOutlineBtn(
                                            width: width,
                                            onTab: () {
                                              Get.to(() => AddJobs());
                                            },
                                            height: 40.h,
                                            text: 'Add a job',
                                            color: Color(kOrange.value),
                                          ),
                                          HeightSpacer(size: 10),
                                          CustomOutlineBtn(
                                            width: width,
                                            height: 40.h,
                                            text: 'Upload Information',
                                            color: Color(kOrange.value),
                                          ),
                                        ],
                                      )
                                      : CustomOutlineBtn(
                                        width: width,
                                        height: 40.h,
                                        text: 'Apply to become an agent',
                                        color: Color(kOrange.value),
                                      ),

                                  HeightSpacer(size: 20.h),

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
                    ),
                  ),
                ],
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
