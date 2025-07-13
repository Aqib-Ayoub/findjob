import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/exports.dart';
import 'package:findjob/models/request/bookmarks/all_bookmarks.dart';
import 'package:findjob/views/common/app_bar.dart';
import 'package:findjob/views/common/drawer/drawer_widget.dart';
import 'package:findjob/views/common/pages_loader.dart';
import 'package:findjob/views/screens/auth/non_user.dart';
import 'package:findjob/views/screens/bookmarks/widgets/bookmark_tile.dart';
import 'package:findjob/views/screens/jobs/widgets/uploaded_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});
  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  String imageUrl =
      'https://imgs.search.brave.com/l0Xmc6G-daKFtHTlxFw8vwXoGXPbl7-dUyzH9qFp4a0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9hcGkvbWVk/aWEvc21hbGwvMTA2/NjUzNTUvc3RvY2st/cGhvdG8tM2QtYWJz/dHJhY3QtYW5kLWZ1/dHVyaXN0aWMtbGV0/dGVyLXM';
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      backgroundColor: Color(0xFF3281E3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          color: Color(0xFF3281E3),
          text: !loginNotifier.loggedIn ? "" : 'Bookmark',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(color: Color(kDark.value)),
          ),
        ),
      ),
      body:
          loginNotifier.loggedIn == false
              ? NonUser()
              : Consumer<BookNotifier>(
                builder: (context, bookNotifier, child) {
                  bookNotifier.getBookmarks();
                  var bookmarks = bookNotifier.getBookmarks();

                  return Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.w),
                              topRight: Radius.circular(20.w),
                            ),
                            color: Color(0xFFEFFFFC),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: FutureBuilder<List<AllBookMarks>>(
                              future: bookmarks,
                              builder: (context, snapshort) {
                                if (snapshort.connectionState ==
                                    ConnectionState.waiting) {
                                  return PageLoader();
                                } else if (snapshort.hasError) {
                                  return Text('Error: ${snapshort.error}');
                                } else {
                                  var processBooks = snapshort.data;
                                  return ListView.builder(
                                    itemCount: processBooks!.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      final bookmark = processBooks[index];
                                      return BookmarkTile(bookmark: bookmark);
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
    );
  }
}
