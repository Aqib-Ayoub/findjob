import 'package:flutter/material.dart';

Widget buildStyledContainer(BuildContext context, Widget child) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/jobs.png'),
        fit: BoxFit.cover,
        opacity: 0.35,
      ),
      borderRadius: BorderRadius.all(Radius.circular(9)),
    ),
    child: child,
  );
}
