import 'package:findjob/models/request/bookmarks/all_bookmarks.dart';
import 'package:findjob/models/request/bookmarks/bookmark.dart';
import 'package:findjob/services/config.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkHelper {
  static var client = https.Client();

  static Future<Bookmark> addBookmark(String model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    var url = Uri.http(Config.apiUrl, Config.bookmarkUrl);

    var response = await client.post(url, headers: requestHeaders, body: model);

    if (response.statusCode == 200) {
      var bookmark = bookmarkFromJson(response.body);
      return bookmark;
    } else {
      throw Exception('Failed to get bookmark');
    }
  }

  static Future<List<AllBookMarks>> getAllBookmark() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    var url = Uri.http(Config.apiUrl, Config.bookmarkUrl);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var bookmarks = allBookMarksFromJson(response.body);
      return bookmarks;
    } else {
      throw Exception('Failed to get bookmark');
    }
  }

  static Future<Bookmark?> getBookmark(String jobId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        return null;
      }
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token',
      };
      var url = Uri.http(Config.apiUrl, "${Config.singleBookmarkUrl}$jobId");

      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        var bookmark = bookmarkFromJson(response.body);
        return bookmark;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<bool> deleteBookmarks(String bookmarkId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };

    var url = Uri.http(Config.apiUrl, "${Config.bookmarkUrl}/$bookmarkId");
    var response = await client.delete(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
