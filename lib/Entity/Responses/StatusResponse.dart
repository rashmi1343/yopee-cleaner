// To parse this JSON data, do
//
//     final statusResponse = statusResponseFromJson(jsonString);

import 'dart:convert';

StatusResponse statusResponseFromJson(String str) =>
    StatusResponse.fromJson(json.decode(str));

String statusResponseToJson(StatusResponse data) => json.encode(data.toJson());

class StatusResponse {
  String? message;
  int? status;
  List<String> data;

  StatusResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) => StatusResponse(
        message: json["message"],
        status: json["status"],
        data: List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
