import 'package:findjob/models/response/jobs/get_job.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/services/helpers/jobs_helper.dart';
import 'package:flutter/foundation.dart';

class JobsNotifier extends ChangeNotifier {
  late Future<List<JobsResponse>> jobList;
  late Future<GetJobRes> job;
  late Future<List<JobsResponse>> recentJobs;


  Future<List<JobsResponse>> getJobs() {
    jobList = JobsHelper.getJobs();
    return jobList;
  }

  Future<GetJobRes> getJob(String jobId) {
    job = JobsHelper.getJob(jobId);
    return job;
  }
   Future<List<JobsResponse>> getRecent() {
    recentJobs = JobsHelper.getJobs();
    return recentJobs;
  }
}
