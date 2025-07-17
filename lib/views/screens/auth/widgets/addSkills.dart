import 'package:flutter/material.dart';

class AddSkillsWidget extends StatelessWidget {
  const AddSkillsWidget({super.key, required this.skill, this.onTap});

  final TextEditingController skill;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 55);
  }
}
