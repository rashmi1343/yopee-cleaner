// To parse this JSON data, do
//
//     final logoutResponse = logoutResponseFromJson(jsonString);

import 'dart:convert';

LogoutResponse logoutResponseFromJson(String str) =>
    LogoutResponse.fromJson(json.decode(str));

String logoutResponseToJson(LogoutResponse data) => json.encode(data.toJson());

class LogoutResponse {
  String? message;
  int? status;
  List<String> data;

  LogoutResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
        message: json["message"],
        status: json["status"],
        data: List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<String>.from(data!.map((x) => x)),
      };
}
