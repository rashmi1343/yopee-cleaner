// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  String? message;
  int? status;
  SignUpData data;

  SignUpResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        message: json["message"],
        status: json["status"],
        data: SignUpData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class SignUpData {
  String? email;
  String? mobile;
  String? address;
  String? countryCode;
  String? userType;
  String? status;
  int? id;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  SignUpData({
    this.email,
    this.mobile,
    this.address,
    this.countryCode,
    this.userType,
    this.status,
    this.id,
    this.profileImageUrl,
    this.documentImageUrl,
    this.name,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        countryCode: json["country_code"],
        userType: json["user_type"],
        status: json["status"],
        id: json["id"],
        profileImageUrl: json["profile_image_url"],
        documentImageUrl: json["document_image_url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "mobile": mobile,
        "address": address,
        "country_code": countryCode,
        "user_type": userType,
        "status": status,
        "id": id,
        "profile_image_url": profileImageUrl,
        "document_image_url": documentImageUrl,
        "name": name,
      };
}
