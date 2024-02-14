// To parse this JSON data, do
//
//     final notificationStatusResponse = notificationStatusResponseFromJson(jsonString);

import 'dart:convert';

NotificationStatusResponse notificationStatusResponseFromJson(String str) =>
    NotificationStatusResponse.fromJson(json.decode(str));

String notificationStatusResponseToJson(NotificationStatusResponse data) =>
    json.encode(data.toJson());

class NotificationStatusResponse {
  String? message;
  int? status;
  NotificationData data;

  NotificationStatusResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory NotificationStatusResponse.fromJson(Map<String, dynamic> json) =>
      NotificationStatusResponse(
        message: json["message"],
        status: json["status"],
        data: NotificationData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class NotificationData {
  int? id;
  String? userType;
  String? status;
  String? email;
  String? countryCode;
  int? mobile;
  String? latitude;
  String? longitude;
  String? address;
  String? accessToken;
  String? pushNotification;
  String? notifyMonthlyPayment;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  NotificationData({
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

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
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
