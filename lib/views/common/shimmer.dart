import 'package:findjob/views/common/vertical_shimmer.dart';
import 'package:flutter/material.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (_, index) {
        return const Padding(
          padding: EdgeInsets.all(12),
          child: VerticalShimmer(),
        );
      },
    );
  }
}
