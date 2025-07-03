import 'package:findjob/controllers/exports.dart';
import 'package:findjob/controllers/login_provider.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/custom_btn.dart';
import 'package:findjob/views/common/custom_textfield.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/styled_container.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:findjob/views/screens/auth/signup.dart';
import 'package:findjob/views/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
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
              text: 'Login',
              child: GestureDetector(
                onTap: () {
                  Get.offAll(HomePage());
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
                      text: 'Welcome Back',
                      style: appstyle(30, kDark, FontWeight.w600),
                    ),
                    ReusableText(
                      text: 'Fill in the Details to login your account',
                      style: appstyle(
                        14,
                        Color(kDarkGrey.value),
                        FontWeight.w400,
                      ),
                    ),
                    HeightSpacer(size: 40.h),
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
                            text: 'Don\'t have an account',
                            style: appstyle(
                              11,
                              Color(kDarkGrey.value),
                              FontWeight.w500,
                            ),
                          ),
                          WidthSpacer(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => RegistrationPage());
                            },
                            child: ReusableText(
                              text: 'Register',
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
                          text: 'Login',
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
