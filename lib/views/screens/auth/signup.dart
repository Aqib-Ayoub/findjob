import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/login_provider.dart';
import 'package:findjob/controllers/zoom_provider.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/custom_btn.dart';
import 'package:findjob/views/common/custom_textfield.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/reusable_text.dart';
import 'package:findjob/views/common/styled_container.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:findjob/views/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: 'Sign Up',
              child: GestureDetector(
                onTap: () {
                  Get.to(() => LoginPage());
                },
                child: Icon(AntDesign.leftcircleo),
              ),
            ),
          ),
          body: buildStyledContainer(
            context,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    HeightSpacer(size: 50.h),
                    ReusableText(
                      text: 'Welcome',
                      style: appstyle(30, kDark, FontWeight.w600),
                    ),
                    ReusableText(
                      text: 'Fill in the Details to sign up for your account',
                      style: appstyle(
                        14,
                        Color(kDarkGrey.value),
                        FontWeight.w400,
                      ),
                    ),
                    HeightSpacer(size: 40.h),
                    CustomTextField(
                      controller: email,
                      hintText: 'Full Name',
                      keyboardType: TextInputType.text,
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Please entter your name';
                        }
                        return null;
                      },
                    ),
                    HeightSpacer(size: 20.h),
                    CustomTextField(
                      controller: email,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email!.isEmpty || !email.contains('@')) {
                          return 'Please entter a valid email';
                        }
                        return null;
                      },
                    ),
                    HeightSpacer(size: 20.h),
                    CustomTextField(
                      controller: password,
                      hintText: 'Password',
                      keyboardType: TextInputType.text,
                      obscureText: loginNotifier.obscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          loginNotifier.obscureText =
                              !loginNotifier.obscureText;
                        },
                        child: Icon(
                          loginNotifier.obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (password) {
                        if (password!.isEmpty || password.length < 8) {
                          return 'Please enter a valid password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ReusableText(
                            text: 'Already have an account?',
                            style: appstyle(
                              11,
                              Color(kDarkGrey.value),
                              FontWeight.w500,
                            ),
                          ),
                          WidthSpacer(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => LoginPage());
                            },
                            child: ReusableText(
                              text: 'Login',
                              style: appstyle(12, kLightBlue, FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    HeightSpacer(size: 30.h),
                    Consumer<ZoomNotifier>(
                      builder: (context, zoomNotifier, child) {
                        return CustomButton(
                          text: 'Register',
                          //TODO: Implement login functionality
                          onTap: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
