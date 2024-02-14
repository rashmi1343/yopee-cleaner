// To parse this JSON data, do
//
//     final loginListResponse = loginListResponseFromJson(jsonString);

import 'dart:convert';

LoginListResponse loginListResponseFromJson(String str) =>
    LoginListResponse.fromJson(json.decode(str));

String loginListResponseToJson(LoginListResponse data) =>
    json.encode(data.toJson());

class LoginListResponse {
  String? message;
  int? status;
  List<dynamic>? data;

  LoginListResponse({
    this.message,
    this.status,
    this.data,
  });

  factory LoginListResponse.fromJson(Map<String, dynamic> json) =>
      LoginListResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}

class LoginData {
  int? id;
  String? userType;
  String? status;
  String? email;
  String? countryCode;
  int? mobile;
  String? userCategoryType;
  dynamic latitude;
  dynamic longitude;
  String? address;
  dynamic accessToken;
  int? pushNotification;
  int? notifyMonthlyPayment;
  int? accountDetails;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  LoginData({
    this.id,
    this.userType,
    this.status,
    this.email,
    this.countryCode,
    this.mobile,
    this.userCategoryType,
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

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        userType: json["user_type"],
        status: json["status"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        userCategoryType: json["user_category_type"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
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
        "user_category_type": userCategoryType,
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
