import 'package:findjob/views/common/exports.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, this.onTab});
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(kOrange.value),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(9),
            bottomLeft: Radius.circular(9),
          ),
        ),
        child: ReusableText(
          text: 'Edit',
          style: appstyle(12, Color(kLight.value), FontWeight.w500),
        ),
      ),
    );
  }
}
