// To parse this JSON data, do
//
//     final deleteNotificationResponse = deleteNotificationResponseFromJson(jsonString);

import 'dart:convert';

DeleteNotificationResponse deleteNotificationResponseFromJson(String str) =>
    DeleteNotificationResponse.fromJson(json.decode(str));

String deleteNotificationResponseToJson(DeleteNotificationResponse data) =>
    json.encode(data.toJson());

class DeleteNotificationResponse {
  String? message;
  int? status;
  List<String>? data;

  DeleteNotificationResponse({
    this.message,
    this.status,
    this.data,
  });

  factory DeleteNotificationResponse.fromJson(Map<String, dynamic> json) =>
      DeleteNotificationResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
