import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_style.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/page2.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text('Stable Yourself \n with Your Abilities', textAlign:TextAlign.center, style: appstyle(30, Color(kLight.value), FontWeight.w500)),
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