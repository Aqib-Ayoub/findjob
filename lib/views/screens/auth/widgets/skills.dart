import 'package:findjob/controllers/exports.dart';
import 'package:findjob/controllers/skills_provider.dart';
import 'package:findjob/models/response/auth/skills.dart';
import 'package:findjob/services/helpers/auth_helper.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class SkillsWidget extends StatefulWidget {
  const SkillsWidget({super.key});

  @override
  State<SkillsWidget> createState() => _SkillsState();
}

class _SkillsState extends State<SkillsWidget> {
  TextEditingController userskills = TextEditingController();
  late Future<List<Skills>> userSkills;

  @override
  void initState() {
    userSkills = getSkills();
    super.initState();
  }

  Future<List<Skills>> getSkills() {
    var skills = AuthHelper.getSkills();
    return skills;
  }

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(
                text: 'Skills',
                style: appstyle(14, Color(kDark.value), FontWeight.w600),
              ),
              Consumer<SkillsNotifier>(
                builder: (context, skillNotifier, child) {
                  return GestureDetector(
                    onTap: () {},
                    child: Icon(
                      MaterialCommunityIcons.plus_circle_outline,
                      size: 20,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
