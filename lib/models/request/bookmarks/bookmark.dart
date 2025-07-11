import 'dart:convert';

Bookmark bookmarkFromJson(String str) => Bookmark.fromJson(json.decode(str));

String bookmarkToJson(Bookmark data) => json.encode(data.toJson());

class Bookmark {
  final bool status;
  final String bookmarkId;

  Bookmark({required this.status, required this.bookmarkId});

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      Bookmark(status: json["status"], bookmarkId: json["bookmarkId"]);

  Map<String, dynamic> toJson() => {"status": status, "bookmarkId": bookmarkId};
}
