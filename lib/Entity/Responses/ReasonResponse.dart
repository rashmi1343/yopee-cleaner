// To parse this JSON data, do
//
//     final reasonResponse = reasonResponseFromJson(jsonString);

import 'dart:convert';

ReasonResponse reasonResponseFromJson(String str) =>
    ReasonResponse.fromJson(json.decode(str));

String reasonResponseToJson(ReasonResponse data) => json.encode(data.toJson());

class ReasonResponse {
  String? message;
  int? status;
  List<String> data;

  ReasonResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory ReasonResponse.fromJson(Map<String, dynamic> json) => ReasonResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
