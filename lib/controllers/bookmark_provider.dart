import 'dart:js_interop';

import 'package:findjob/models/request/bookmarks/all_bookmarks.dart';
import 'package:findjob/services/helpers/book_helper.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookNotifier extends ChangeNotifier {
  late Future<List<AllBookMarks>> bookmarks;
  bool _bookmark = false;
  bool get bookmark => _bookmark;

  set isBookmark(bool newState) {
    if (_bookmark != newState) {
      _bookmark = newState;
      notifyListeners();
    }
  }

  String _bookmarkId = '';
  String get bookmarkId => _bookmarkId;

  set isBookmarkId(String newState) {
    if (_bookmarkId != newState) {
      _bookmarkId = newState;
      notifyListeners();
    }
  }

  addBookmark(String model) {
    BookMarkHelper.addBookmark(model).then((bookmark) {});
  }

  getBookmark(String jobId) {
    BookMarkHelper.getBookmark(jobId).then((bookmark) {
      if (bookmark == null) {
        isBookmark = false;
      } else {
        isBookmark = bookmark.status;
        isBookmarkId = bookmark.bookmarkId;
      }
    });
  }

  deleteBookmark(String jobId) {
    BookMarkHelper.deleteBookmarks(jobId).then((value) {
      if (value) {
        Get.snackbar(
          'Bookmark sucessfully deleted',
          'Visit the bookmarks page to see the changes',
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: Icon(Icons.bookmark_remove_outlined),
        );
      }
    });
  }

  getBookmarks() {
    bookmarks = BookMarkHelper.getAllBookmark();
  }
}
