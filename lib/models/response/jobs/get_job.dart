import 'dart:convert';

GetJobRes getJobResFromJson(String str) => GetJobRes.fromJson(json.decode(str));

String getJobResToJson(GetJobRes data) => json.encode(data.toJson());

class GetJobRes {
  GetJobRes({
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.hiring,
    required this.description,
    required this.salary,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.imageUrl,
    required this.agentId,
    required this.agentName,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String location;
  final String company;
  final bool hiring;
  final String description;
  final String salary;
  final String period;
  final String contract;
  final List<String> requirements;
  final String imageUrl;
  final String agentId;
  final String agentName;
  final DateTime updatedAt;

  factory GetJobRes.fromJson(Map<String, dynamic> json) => GetJobRes(
    id: json["_id"] ?? '',
    title: json["title"] ?? '',
    location: json["location"] ?? '',
    company: json["company"] ?? '',
    hiring: json["hiring"] ?? false,
    description: json["description"] ?? '',
    salary: json["salary"] ?? '20k',
    period: json["period"] ?? '',
    contract: json["contract"] ?? '',
    requirements:
        json["requirements"] != null
            ? List<String>.from(json["requirements"].map((x) => x.toString()))
            : [],
    imageUrl: json["imageUrl"] ?? '',
    agentId: json["agentId"] ?? '',
    agentName: json["agentName"] ?? '',
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.tryParse(json["updatedAt"]) ?? DateTime.now()
            : DateTime.now(),
    // non nullable
    // id: json["_id"],
    // title: json["title"],
    // location: json["location"],
    // company: json["company"],
    // hiring: json["hiring"],
    // description: json["description"],
    // salary: json["salary"],
    // period: json["period"],
    // contract: json["contract"],
    // requirements: List<String>.from(json["requirements"].map((x) => x)),
    // imageUrl: json["imageUrl"],
    // agentId: json["agentId"],
    // agentName: json["agentName"],
    // updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "location": location,
    "company": company,
    "hiring": hiring,
    "description": description,
    "salary": salary,
    "period": period,
    "contract": contract,
    "requirements": List<dynamic>.from(requirements.map((x) => x)),
    "imageUrl": imageUrl,
    "agentId": agentId,
    "updatedAt": updatedAt.toIso8601String(),
  };
}
