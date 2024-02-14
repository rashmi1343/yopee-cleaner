// To parse this JSON data, do
//
//     final profileViewResponse = profileViewResponseFromJson(jsonString);

import 'dart:convert';

ProfileViewResponse profileViewResponseFromJson(String str) =>
    ProfileViewResponse.fromJson(json.decode(str));

String profileViewResponseToJson(ProfileViewResponse data) =>
    json.encode(data.toJson());

class ProfileViewResponse {
  String? message;
  int? status;
  ProfileViewData data;

  ProfileViewResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory ProfileViewResponse.fromJson(Map<String, dynamic> json) =>
      ProfileViewResponse(
        message: json["message"],
        status: json["status"],
        data: ProfileViewData.fromJson(json["data"] ?? {}),

        // profileViewData: json["profileViewData"] == null
        //     ? null
        //     : ProfileViewData.fromJson(json["profileViewData"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "profileViewData": data?.toJson(),
      };
}

class ProfileViewData {
  int? id;
  String? userType;
  String? status;
  String email;
  String? countryCode;
  int? mobile;
  String? latitude;
  String? longitude;
  String? address;
  String? accessToken;
  int? pushNotification;
  int? notifyMonthlyPayment;
  int? accountDetails;
  String? profileImageUrl;
  String? documentImageUrl;
  String name;

  ProfileViewData({
    this.id,
    this.userType,
    this.status,
    required this.email,
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
    required this.name,
  });

  factory ProfileViewData.fromJson(Map<String, dynamic> json) =>
      ProfileViewData(
        id: json["id"],
        userType: json["user_type"],
        status: json["status"],
        email: json["email"] ?? "",
        countryCode: json["country_code"],
        mobile: json["mobile"] ?? "",
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        accessToken: json["access_token"],
        pushNotification: json["push_notification"],
        notifyMonthlyPayment: json["notify_monthly_payment"],
        accountDetails: json["account_details"] ?? 0,
        profileImageUrl: json["profile_image_url"],
        documentImageUrl: json["document_image_url"],
        name: json["name"] ?? "",
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
