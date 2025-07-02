import 'package:findjob/controllers/exports.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/views/common/pages_loader.dart';
import 'package:findjob/views/screens/jobs/widgets/uploaded_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PopularJobsList extends StatelessWidget {
  const PopularJobsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobsNotifier, child) {
        jobsNotifier.getJobs();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: FutureBuilder<List<JobsResponse>>(
            future: jobsNotifier.recentJobs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return PageLoader();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data!.isEmpty) {
                return Text('No Jobs Available');
              } else {
                final jobs = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: jobs!.length,
                  itemBuilder: (context, index) {
                    var job = jobs[index];
                    return UploadedTile(job: job, text: 'popular');
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
