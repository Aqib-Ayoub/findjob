import 'package:findjob/controllers/exports.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/screens/onboarding/widgets/page_one.dart';
import 'package:findjob/views/screens/onboarding/widgets/page_three.dart';
import 'package:findjob/views/screens/onboarding/widgets/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardNotifier>(
        builder: (context, onBoardNotifier, child) {
          return Stack(
            children: [
              PageView(
                controller: pageController,
                physics:
                    onBoardNotifier.isLastPage
                        ? NeverScrollableScrollPhysics()
                        : AlwaysScrollableScrollPhysics(),
                onPageChanged: (page) {
                  onBoardNotifier.isLastPage = page == 2;
                },

                children: [PageOne(), PageTwo(), PageThree()],
              ),
              onBoardNotifier.isLastPage
                  ? SizedBox.shrink()
                  : Positioned(
                    bottom: hieght * 0.12,
                    right: 0,
                    left: 0,

                    child: Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          spacing: 10,
                          dotColor: Color(kLight.value),
                          activeDotColor: Color(kOrange.value),
                        ),
                      ),
                    ),
                  ),
              onBoardNotifier.isLastPage
                  ? SizedBox.shrink()
                  : Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 30.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.jumpToPage(2);
                              },
                              child: ReusableText(
                                text: 'Skip',
                                style: appstyle(
                                  16,
                                  Color(kLight.value),
                                  FontWeight.normal,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pageController.nextPage(
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: ReusableText(
                                text: 'Next',
                                style: appstyle(
                                  16,
                                  Color(kLight.value),
                                  FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
