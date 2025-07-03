import 'package:findjob/models/response/jobs/jobs_response.dart';
import 'package:findjob/services/helpers/jobs_helper.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/common/no_search_results.dart';
import 'package:findjob/views/common/pages_loader.dart';
import 'package:findjob/views/screens/jobs/widgets/JobsVerticalTile.dart';
import 'package:findjob/views/screens/search/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kLight.value),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.w)),
          child: CustomField(
            hintText: 'Search',
            suffixIcon: Icon(Ionicons.search),
            controller: controller,
          ),
        ),
      ),
      body:
          controller.text.isNotEmpty
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: FutureBuilder<List<JobsResponse>>(
                  future: JobsHelper.searchJob(controller.text),
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
                          return JobsVerticalTile(job: job);
                        },
                      );
                    }
                  },
                ),
              )
              : NoSearchResults(text: 'No Jobs Found'),
    );
  }
}
