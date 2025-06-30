import 'package:findjob/views/common/exports.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Image.asset('assets/images/page1.png'),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ReusableText(text: 'Find Your Dream Job', style: appstyle(30, Color(kLight.value), FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('Discover your dream job with FindJob — explore thousands of opportunities, apply in seconds, and take the next step in your career journey.' ,textAlign: TextAlign.center, style: appstyle(14, Color(kLight.value), FontWeight.normal)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}