// To parse this JSON data, do
//
//     final uploadPhotoResponse = uploadPhotoResponseFromJson(jsonString);

import 'dart:convert';

UploadPhotoResponse uploadPhotoResponseFromJson(String str) =>
    UploadPhotoResponse.fromJson(json.decode(str));

String uploadPhotoResponseToJson(UploadPhotoResponse data) =>
    json.encode(data.toJson());

class UploadPhotoResponse {
  String? message;
  int? status;
  Data? data;

  UploadPhotoResponse({
    this.message,
    this.status,
    this.data,
  });

  factory UploadPhotoResponse.fromJson(Map<String, dynamic> json) =>
      UploadPhotoResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? userType;
  String? status;
  String? email;
  String? countryCode;
  int? mobile;
  dynamic latitude;
  dynamic longitude;
  dynamic address;
  String? accessToken;
  int? pushNotification;
  int? notifyMonthlyPayment;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  Data({
    this.id,
    this.userType,
    this.status,
    this.email,
    this.countryCode,
    this.mobile,
    this.latitude,
    this.longitude,
    this.address,
    this.accessToken,
    this.pushNotification,
    this.notifyMonthlyPayment,
    this.profileImageUrl,
    this.documentImageUrl,
    this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userType: json["user_type"],
        status: json["status"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        accessToken: json["access_token"],
        pushNotification: json["push_notification"],
        notifyMonthlyPayment: json["notify_monthly_payment"],
        profileImageUrl: json["profile_image_url"],
        documentImageUrl: json["document_image_url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_type": userType,
        "status": status,
        "email": email,
        "country_code": countryCode,
        "mobile": mobile,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "access_token": accessToken,
        "push_notification": pushNotification,
        "notify_monthly_payment": notifyMonthlyPayment,
        "profile_image_url": profileImageUrl,
        "document_image_url": documentImageUrl,
        "name": name,
      };
}
