// To parse this JSON data, do
//
//     final readNotificationResponse = readNotificationResponseFromJson(jsonString);

import 'dart:convert';

ReadNotificationResponse readNotificationResponseFromJson(String str) =>
    ReadNotificationResponse.fromJson(json.decode(str));

String readNotificationResponseToJson(ReadNotificationResponse data) =>
    json.encode(data.toJson());

class ReadNotificationResponse {
  String? message;
  int? status;
  String? data;

  ReadNotificationResponse({
    this.message,
    this.status,
    this.data,
  });

  factory ReadNotificationResponse.fromJson(Map<String, dynamic> json) =>
      ReadNotificationResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data,
      };
}
