import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/custom_outline_btn.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/styled_container.dart';
import 'package:findjob/views/common/textfield.dart';
import 'package:findjob/views/screens/auth/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddJobs extends StatefulWidget {
  const AddJobs({super.key});

  @override
  State<AddJobs> createState() => _AddJobsState();
}

class _AddJobsState extends State<AddJobs> {
  TextEditingController title = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController contract = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController period = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  TextEditingController rq1 = TextEditingController();
  TextEditingController rq2 = TextEditingController();
  TextEditingController rq3 = TextEditingController();
  TextEditingController rq4 = TextEditingController();
  TextEditingController rq5 = TextEditingController();
  String image = 'https://avatars.githubusercontent.com/u/52028089?v=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kLightBlue.value),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.w),
        child: CustomAppBar(
          action: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircularAvata(image: image, w: 30, h: 40),
            ),
          ],
          color: Color(kLightBlue.value),

          text: 'Upload jobs',
          child: BackBtn(),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(kLight.value),
              ),
              child: buildStyledContainer(
                context,
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 20.w,
                  ),
                  child: ListView(
                    children: [
                      HeightSpacer(size: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: title,
                          hintText: 'Job Title',
                          label: Text('Job Title'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: company,
                          hintText: 'Company',
                          label: Text('Company'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: location,
                          hintText: 'Location',
                          label: Text('Location'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: contract,
                          hintText: 'Contract',
                          label: Text('Contract'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: description,
                          hintText: 'Image Url',
                          label: Text('Image Url'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: description,
                          hintText: 'Description',
                          label: Text('Desscription'),
                          maxLines: 3,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: period,
                          hintText: 'Monthly | Annual | Weakly',
                          label: Text('Salary period'),
                          maxLines: 2,
                          height: 100,
                        ),
                      ),
                      ReusableText(
                        text: 'Requirements',
                        style: appstyle(15, Colors.black, FontWeight.w600),
                      ),
                      HeightSpacer(size: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          height: 80,
                          maxLines: 2,
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: rq1,
                          hintText: 'Requirements',
                          label: Text('Requirements'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          height: 80,
                          maxLines: 2,
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: rq2,
                          hintText: 'Requirements',
                          label: Text('Requirements'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          height: 80,
                          maxLines: 2,
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: rq3,
                          hintText: 'Requirements',
                          label: Text('Requirements'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          height: 80,
                          maxLines: 2,
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: rq4,
                          hintText: 'Requirements',
                          label: Text('Requirements'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: buildtextfield(
                          height: 80,
                          maxLines: 3,
                          onSubmitted: (value) {
                            if (value!.isEmpty) {
                              return ("Please fill the field");
                            } else {
                              return null;
                            }
                          },
                          controller: rq5,
                          hintText: 'Requirements',
                          label: Text('Requirements'),
                        ),
                      ),
                      CustomOutlineBtn(
                        height: 45.h,
                        width: width,
                        onTab: () {},
                        text: 'Submit',
                        color: Color(kLightBlue.value),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
