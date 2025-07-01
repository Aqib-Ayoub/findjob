import 'package:findjob/models/response/jobs/get_job.dart';
import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/services/config.dart';
import 'package:http/http.dart' as https;

class JobsHelper {
  static var client = https.Client();

  static Future<List<JobsResponse>> getJobs() async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.jobs);

    var response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200) {
      var jobList = jobsResponseFromJson(response.body);
      return jobList;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  static Future<GetJobRes> getJob(String jobId) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, "${Config.jobs}/$jobId");

    var response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200) {
      var job = getJobResFromJson(response.body);
      return job;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  static Future<List<JobsResponse>> getRecent() async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.jobs, {'new': 'true'});

    var response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200) {
      var jobList = jobsResponseFromJson(response.body);
      return jobList;
    } else {
      throw Exception('Failed to load jobs');
    }
  }
}
