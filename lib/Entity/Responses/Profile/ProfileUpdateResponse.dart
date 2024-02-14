// To parse this JSON data, do
//
//     final profileUpdateResponse = profileUpdateResponseFromJson(jsonString);

import 'dart:convert';

ProfileUpdateResponse profileUpdateResponseFromJson(String str) =>
    ProfileUpdateResponse.fromJson(json.decode(str));

String profileUpdateResponseToJson(ProfileUpdateResponse data) =>
    json.encode(data.toJson());

class ProfileUpdateResponse {
  String? message;
  int? status;
  ProfileUpdateData? data;

  ProfileUpdateResponse({
    this.message,
    this.status,
    this.data,
  });

  factory ProfileUpdateResponse.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : ProfileUpdateData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class ProfileUpdateData {
  int? id;
  String? userType;
  String? status;
  String? email;
  String? countryCode;
  String? mobile;
  dynamic latitude;
  dynamic longitude;
  String? address;
  String? accessToken;
  int? pushNotification;
  int? notifyMonthlyPayment;
  int? accountDetails;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  ProfileUpdateData({
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
    this.accountDetails,
    this.profileImageUrl,
    this.documentImageUrl,
    this.name,
  });

  factory ProfileUpdateData.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateData(
        id: json["id"],
        userType: json["user_type"],
        status: json["status"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"] ?? "",
        accessToken: json["access_token"],
        pushNotification: json["push_notification"],
        notifyMonthlyPayment: json["notify_monthly_payment"],
        accountDetails: json["account_details"],
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
        "account_details": accountDetails,
        "profile_image_url": profileImageUrl,
        "document_image_url": documentImageUrl,
        "name": name,
      };
}
