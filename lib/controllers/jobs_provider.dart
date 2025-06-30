import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/services/helpers/jobs_helper.dart';
import 'package:flutter/foundation.dart';

class JobsNotifier extends ChangeNotifier {
  late Future<List<JobsResponse>> jobList;

  Future<List<JobsResponse>> getJobs() {
    jobList = JobsHelper.getJobs();
    return jobList;
  }
}
