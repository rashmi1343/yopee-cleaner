// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromJson(jsonString);

import 'dart:convert';

OtpResponse otpResponseFromJson(String str) => OtpResponse.fromJson(json.decode(str));

String otpResponseToJson(OtpResponse data) => json.encode(data.toJson());

class OtpResponse {
  String? message;
  int? status;
  OtpData? data;

  OtpResponse({
    this.message,
    this.status,
    this.data,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? null : OtpData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data?.toJson(),
  };
}

class OtpData {
  int? id;
  String? accessToken;
  String? name;

  OtpData({
    this.id,
    this.accessToken,
    this.name,
  });

  factory OtpData.fromJson(Map<String, dynamic> json) => OtpData(
    id: json["id"],
    accessToken: json["access_token"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "access_token": accessToken,
    "name": name,
  };
}
