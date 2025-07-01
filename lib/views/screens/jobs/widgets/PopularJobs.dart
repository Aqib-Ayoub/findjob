import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/jobs_provider.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/views/screens/jobs/job_details.dart';
import 'package:findjob/views/screens/jobs/widgets/JobsHorizontalTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';

class Popularjobs extends StatelessWidget {
  const Popularjobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobsNotifier, child) {
        jobsNotifier.getJobs();
        return SizedBox(
          height: hieght * 0.28,
          child: FutureBuilder<List<JobsResponse>>(
            future: jobsNotifier.jobList,
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
                  scrollDirection: Axis.horizontal,
                  itemCount: jobs!.length,
                  itemBuilder: (context, index) {
                    var job = jobs[index];
                    return JobsHorizontalTile(
                      job: job,
                      onTap: () {
                        Get.to(
                          () => JobDetails(
                            id: job.id,
                            title: job.title,
                            agentName: job.agentName,
                          ),
                        );
                      },
                    );
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
