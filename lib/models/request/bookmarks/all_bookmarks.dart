// To parse this JSON data, do
//
//     final allBookMarks = allBookMarksFromJson(jsonString);

import 'dart:convert';

// getting only one boookmark
// AllBookMarks allBookMarksFromJson(String str) =>
//     AllBookMarks.fromJson(json.decode(str));

// String allBookMarksToJson(AllBookMarks data) => json.encode(data.toJson());

List<AllBookMarks> allBookMarksFromJson(String str) => List<AllBookMarks>.from(
  json.decode(str).map((x) => AllBookMarks.fromJson(x)),
);

String allBookMarksToJson(List<AllBookMarks> data) =>
    json.encode(data.map((x) => x.toJson()).toList());

class AllBookMarks {
  String id;
  Job job;
  String userId;

  AllBookMarks({required this.id, required this.job, required this.userId});

  factory AllBookMarks.fromJson(Map<String, dynamic> json) => AllBookMarks(
    id: json["_id"],
    job: Job.fromJson(json["job"]),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "job": job.toJson(),
    "userId": userId,
  };
}

class Job {
  String id;
  String title;
  String location;
  String agentName;
  String salery;
  String period;
  String contract;
  bool hiring;
  String imageUrl;
  String agentId;
  String company;
  int v;

  Job({
    required this.id,
    required this.title,
    required this.location,
    required this.agentName,
    required this.salery,
    required this.period,
    required this.contract,
    required this.hiring,
    required this.imageUrl,
    required this.agentId,
    required this.company,
    required this.v,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["_id"],
    title: json["title"],
    location: json["location"],
    agentName: json["agentName"],
    salery: json["salery"],
    period: json["period"],
    contract: json["contract"],
    hiring: json["hiring"],
    imageUrl: json["imageUrl"],
    agentId: json["agentId"],
    company: json["company"] ?? "",
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "location": location,
    "agentName": agentName,
    "salery": salery,
    "period": period,
    "contract": contract,
    "hiring": hiring,
    "imageUrl": imageUrl,
    "agentId": agentId,
    "company": company,
    "__v": v,
  };
}
