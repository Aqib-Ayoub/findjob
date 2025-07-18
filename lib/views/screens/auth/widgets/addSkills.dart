import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AddSkillsWidget extends StatelessWidget {
  const AddSkillsWidget({super.key, required this.skill, this.onTap});

  final TextEditingController skill;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      height: 62.w,
      child: buildtextfield(
        controller: skill,
        hintText: 'Add New Skill',
        maxLines: 4,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            Entypo.upload_to_cloud,
            size: 30,
            color: Color(kLightBlue.value),
          ),
        ),
        onSubmitted: (p0) {
          if (p0!.isEmpty) {
            return 'Please enter skill name';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
