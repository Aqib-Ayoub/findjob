import 'package:findjob/controllers/exports.dart';
import 'package:findjob/controllers/skills_provider.dart';
import 'package:findjob/models/response/auth/skills.dart';
import 'package:findjob/services/helpers/auth_helper.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/pages_loader.dart';
import 'package:findjob/views/common/width_spacer.dart';
import 'package:findjob/views/screens/auth/widgets/addSkills.dart';
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
    var skillNotifier = Provider.of<SkillsNotifier>(context);

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
                  return skillNotifier.addSkills
                      ? GestureDetector(
                        onTap: () {
                          skillNotifier.setSkills = !skillNotifier.addSkills;
                        },
                        child: Icon(
                          MaterialCommunityIcons.plus_circle_outline,
                          size: 24,
                        ),
                      )
                      : GestureDetector(
                        onTap: () {
                          skillNotifier.setSkills = !skillNotifier.addSkills;
                        },
                        child: Icon(AntDesign.closecircleo, size: 20),
                      );
                },
              ),
            ],
          ),
        ),

        skillNotifier.addSkills == true
            ? AddSkillsWidget(skill: userskills, onTap: () {})
            : SizedBox(
              height: 33.w,
              child: FutureBuilder(
                future: userSkills,
                builder: (context, snapshort) {
                  if (snapshort.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  } else if (snapshort.hasError) {
                    return Text('Error: ${snapshort.error}');
                  } else {
                    var skills = snapshort.data;
                    return ListView.builder(
                      itemCount: skills!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var skill = skills[index];
                        return GestureDetector(
                          onLongPress: () {
                            skillNotifier.setSkillsId = skill.id;
                          },
                          onDoubleTap: () {
                            skillNotifier.setSkillsId = '';
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.w),
                            margin: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.w),
                              ),
                              color: Color(kLightGrey.value),
                            ),
                            child: Row(
                              children: [
                                ReusableText(
                                  text: skill.skill,
                                  style: appstyle(
                                    10,
                                    Color(kDark.value),
                                    FontWeight.w500,
                                  ),
                                ),
                                WidthSpacer(width: 5),
                                skillNotifier.addSkillsId == skill.id
                                    ? GestureDetector(
                                      onTap: () {
                                        AuthHelper.deleteSkill(
                                          skillNotifier.addSkillsId,
                                        );
                                        skillNotifier.setSkillsId = '';
                                        userSkills = getSkills();
                                      },
                                      child: Icon(
                                        AntDesign.delete,
                                        size: 14,
                                        color: Color(kDark.value),
                                      ),
                                    )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
      ],
    );
  }
}
