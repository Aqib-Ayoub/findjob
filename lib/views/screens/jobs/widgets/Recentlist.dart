import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/jobs_provider.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/views/screens/jobs/widgets/JobsVerticalTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobsNotifier, child) {
        jobsNotifier.getRecent();
        return SizedBox(
          height: hieght * 0.28,
          child: FutureBuilder<List<JobsResponse>>(
            future: jobsNotifier.recentJobs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data!.isEmpty) {
                return Text('No Jobs Available');
              } else {
                final jobs = snapshot.data;
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: jobs!.length,
                  itemBuilder: (context, index) {
                    var job = jobs[index];
                    return JobsVerticalTile(job: job);
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
