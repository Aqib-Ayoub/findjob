import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/back_btn.dart';
import 'package:findjob/views/common/height_spacer.dart';
import 'package:findjob/views/common/styled_container.dart';
import 'package:findjob/views/common/textfield.dart';
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
  TextEditingController imageUrl = TextEditingController();
  TextEditingController rq1 = TextEditingController();
  TextEditingController rq2 = TextEditingController();
  TextEditingController rq3 = TextEditingController();
  TextEditingController rq4 = TextEditingController();
  TextEditingController rq5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kLightBlue.value),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.w),
        child: CustomAppBar(
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
                          hintText: 'Description',
                          label: Text('Desscription'),
                          maxLines: 3,
                          height: 100,
                        ),
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
