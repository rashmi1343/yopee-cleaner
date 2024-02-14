// To parse this JSON data, do
//
//     final helpResponse = helpResponseFromJson(jsonString);

import 'dart:convert';

HelpResponse helpResponseFromJson(String str) =>
    HelpResponse.fromJson(json.decode(str));

String helpResponseToJson(HelpResponse data) => json.encode(data.toJson());

class HelpResponse {
  String? message;
  int? status;
  HelpData data;

  HelpResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory HelpResponse.fromJson(Map<String, dynamic> json) => HelpResponse(
        message: json["message"],
        status: json["status"],
        data: HelpData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class HelpData {
  int? userId;
  String? name;
  String? mobile;
  String? email;
  String? message;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  HelpData({
    this.userId,
    this.name,
    this.mobile,
    this.email,
    this.message,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory HelpData.fromJson(Map<String, dynamic> json) => HelpData(
        userId: json["user_id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        message: json["message"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "mobile": mobile,
        "email": email,
        "message": message,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
