import 'dart:convert';

ResendOtpResponse resendOtpResponseFromJson(String str) =>
    ResendOtpResponse.fromJson(json.decode(str));

class ResendOtpResponse {
  ResendOtpResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final int? status;
  final List<ResendOtpData> data;

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) {
    return ResendOtpResponse(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<ResendOtpData>.from(
              json["data"]!.map((x) => ResendOtpData.fromJson(x))),
    );
  }
}

class ResendOtpData {
  ResendOtpData({
    required this.id,
    required this.userType,
    required this.status,
    required this.email,
    required this.countryCode,
    required this.mobile,
    required this.userCategoryType,
    required this.userDocVerification,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.accessToken,
    required this.pushNotification,
    required this.notifyMonthlyPayment,
    required this.accountDetails,
    required this.name,
    required this.profileImageUrl,
    required this.documentImageUrl,
  });

  final int? id;
  final String? userType;
  final String? status;
  final String? email;
  final String? countryCode;
  final int? mobile;
  final String? userCategoryType;
  final String? userDocVerification;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic address;
  final String? accessToken;
  final int? pushNotification;
  final int? notifyMonthlyPayment;
  final int? accountDetails;
  final String? name;
  final String? profileImageUrl;
  final String? documentImageUrl;

  factory ResendOtpData.fromJson(Map<String, dynamic> json) {
    return ResendOtpData(
      id: json["id"],
      userType: json["user_type"],
      status: json["status"],
      email: json["email"],
      countryCode: json["country_code"],
      mobile: json["mobile"],
      userCategoryType: json["user_category_type"],
      userDocVerification: json["user_doc_verification"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      address: json["address"],
      accessToken: json["access_token"],
      pushNotification: json["push_notification"],
      notifyMonthlyPayment: json["notify_monthly_payment"],
      accountDetails: json["account_details"],
      name: json["name"],
      profileImageUrl: json["profile_image_url"],
      documentImageUrl: json["document_image_url"],
    );
  }
}
