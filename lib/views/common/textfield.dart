import 'package:findjob/views/common/exports.dart';
import 'package:flutter/material.dart';

class buildtextfield extends StatelessWidget {
  const buildtextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.initialValue,
    this.keyboard,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.label,
    this.height,
    this.suffixIcon,
    this.onTap,
  });
  final TextEditingController controller;
  final String hintText;
  final String? initialValue;
  final TextInputType? keyboard;
  final String? Function(String?)? onSubmitted;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final int? maxLines;
  final Widget? label;
  final double? height;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        height: height ?? 60,
        child: TextFormField(
          validator: onSubmitted,
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: keyboard,
          maxLines: maxLines,
          decoration: InputDecoration(
            suffix: suffixIcon,
            isDense: true,
            hintText: hintText,
            label: label,
            hintStyle: appstyle(12, Colors.grey.shade600, FontWeight.normal),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlue.shade600,
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlue.shade600,
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          controller: controller,
          cursorHeight: 25,
          style: appstyle(11, Colors.black, FontWeight.normal),
        ),
      ),
    );
  }
}
