// // // To parse this JSON data, do
// // //
// // //     final loginResponse = loginResponseFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // LoginResponse loginResponseFromJson(String str) =>
// //     LoginResponse.fromJson(json.decode(str));
// //
// // String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
// //
// // class LoginResponse {
// //   String? message;
// //   int? status;
// //   LoginData data;
// //
// //   LoginResponse({
// //     this.message,
// //     this.status,
// //     required this.data,
// //   });
// //
// //   factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
// //         message: json["message"],
// //         status: json["status"],
// //         data: LoginData.fromJson(json["data"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "message": message,
// //         "status": status,
// //         "data": data?.toJson(),
// //       };
// // }
// //
// // class LoginData {
// //   int? id;
// //   String? userType;
// //   String? status;
// //   String? email;
// //   String? firstName;
// //   dynamic middleName;
// //   dynamic lastName;
// //   String? countryCode;
// //   String? mobile;
// //   String userCategoryType;
// //   dynamic mobileVerifiedAt;
// //   dynamic loginAt;
// //   dynamic logoutAt;
// //   dynamic emailVerifiedAt;
// //   dynamic deviceToken;
// //   DateTime? createdAt;
// //   dynamic createdBy;
// //   DateTime? updatedAt;
// //   dynamic updatedBy;
// //   dynamic latitude;
// //   dynamic longitude;
// //   dynamic address;
// //   String? accessToken;
// //   dynamic pushNotification;
// //   dynamic notifyMonthlyPayment;
// //   dynamic deletedBy;
// //   dynamic deletedAt;
// //   String? profileImageUrl;
// //   String? name;
// //
// //   LoginData({
// //     this.id,
// //     this.userType,
// //     this.status,
// //     this.email,
// //     this.firstName,
// //     this.middleName,
// //     this.lastName,
// //     this.countryCode,
// //     this.mobile,
// //     required this.userCategoryType,
// //     this.mobileVerifiedAt,
// //     this.loginAt,
// //     this.logoutAt,
// //     this.emailVerifiedAt,
// //     this.deviceToken,
// //     this.createdAt,
// //     this.createdBy,
// //     this.updatedAt,
// //     this.updatedBy,
// //     this.latitude,
// //     this.longitude,
// //     this.address,
// //     this.accessToken,
// //     this.pushNotification,
// //     this.notifyMonthlyPayment,
// //     this.deletedBy,
// //     this.deletedAt,
// //     this.profileImageUrl,
// //     this.name,
// //   });
// //
// //   factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
// //         id: json["id"],
// //         userType: json["user_type"],
// //         status: json["status"],
// //         email: json["email"],
// //         firstName: json["first_name"],
// //         middleName: json["middle_name"],
// //         lastName: json["last_name"],
// //         countryCode: json["country_code"],
// //         mobile: json["mobile"],
// //         userCategoryType: json["user_category_type"],
// //         mobileVerifiedAt: json["mobile_verified_at"],
// //         loginAt: json["login_at"],
// //         logoutAt: json["logout_at"],
// //         emailVerifiedAt: json["email_verified_at"],
// //         deviceToken: json["device_token"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         createdBy: json["created_by"],
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         updatedBy: json["updated_by"],
// //         latitude: json["latitude"],
// //         longitude: json["longitude"],
// //         address: json["address"],
// //         accessToken: json["access_token"],
// //         pushNotification: json["push_notification"],
// //         notifyMonthlyPayment: json["notify_monthly_payment"],
// //         deletedBy: json["deleted_by"],
// //         deletedAt: json["deleted_at"],
// //         profileImageUrl: json["profile_image_url"],
// //         name: json["name"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "user_type": userType,
// //         "status": status,
// //         "email": email,
// //         "first_name": firstName,
// //         "middle_name": middleName,
// //         "last_name": lastName,
// //         "country_code": countryCode,
// //         "mobile": mobile,
// //         "user_category_type": userCategoryType,
// //         "mobile_verified_at": mobileVerifiedAt,
// //         "login_at": loginAt,
// //         "logout_at": logoutAt,
// //         "email_verified_at": emailVerifiedAt,
// //         "device_token": deviceToken,
// //         "created_at": createdAt?.toIso8601String(),
// //         "created_by": createdBy,
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "updated_by": updatedBy,
// //         "latitude": latitude,
// //         "longitude": longitude,
// //         "address": address,
// //         "access_token": accessToken,
// //         "push_notification": pushNotification,
// //         "notify_monthly_payment": notifyMonthlyPayment,
// //         "deleted_by": deletedBy,
// //         "deleted_at": deletedAt,
// //         "profile_image_url": profileImageUrl,
// //         "name": name,
// //       };
// // }
// // To parse this JSON data, do
// //
// //     final loginResponse = loginResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// LoginResponse loginResponseFromJson(String str) =>
//     LoginResponse.fromJson(json.decode(str));
//
// String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
//
// class LoginResponse {
//   String? message;
//   int? status;
//   LoginData data;
//
//   LoginResponse({
//     this.message,
//     this.status,
//     required this.data,
//   });
//
//   factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//         message: json["message"],
//         status: json["status"],
//         data: LoginData.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "status": status,
//         "data": data?.toJson(),
//       };
// }
//
// class LoginData {
//   int? id;
//   String? userType;
//   String? status;
//   String? email;
//   String? countryCode;
//   int? mobile;
//   String? userCategoryType;
//   dynamic latitude;
//   dynamic longitude;
//   String? address;
//   dynamic accessToken;
//   int? pushNotification;
//   int? notifyMonthlyPayment;
//   int? accountDetails;
//   String? profileImageUrl;
//   String? documentImageUrl;
//   String? name;
//
//   LoginData({
//     this.id,
//     this.userType,
//     this.status,
//     this.email,
//     this.countryCode,
//     this.mobile,
//     this.userCategoryType,
//     this.latitude,
//     this.longitude,
//     this.address,
//     this.accessToken,
//     this.pushNotification,
//     this.notifyMonthlyPayment,
//     this.accountDetails,
//     this.profileImageUrl,
//     this.documentImageUrl,
//     this.name,
//   });
//
//   factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
//         id: json["id"],
//         userType: json["user_type"],
//         status: json["status"],
//         email: json["email"],
//         countryCode: json["country_code"],
//         mobile: json["mobile"],
//         userCategoryType: json["user_category_type"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         address: json["address"],
//         accessToken: json["access_token"],
//         pushNotification: json["push_notification"],
//         notifyMonthlyPayment: json["notify_monthly_payment"],
//         accountDetails: json["account_details"],
//         profileImageUrl: json["profile_image_url"],
//         documentImageUrl: json["document_image_url"],
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_type": userType,
//         "status": status,
//         "email": email,
//         "country_code": countryCode,
//         "mobile": mobile,
//         "user_category_type": userCategoryType,
//         "latitude": latitude,
//         "longitude": longitude,
//         "address": address,
//         "access_token": accessToken,
//         "push_notification": pushNotification,
//         "notify_monthly_payment": notifyMonthlyPayment,
//         "account_details": accountDetails,
//         "profile_image_url": profileImageUrl,
//         "document_image_url": documentImageUrl,
//         "name": name,
//       };
// }
// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? message;
  int? status;
  List<LoginData> data;

  LoginResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<LoginData>.from(
                json["data"]!.map((x) => LoginData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
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
  String? userDocVerification;
  dynamic latitude;
  dynamic longitude;
  dynamic address;
  String? accessToken;
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
    this.userDocVerification,
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
        userDocVerification: json["user_doc_verification"],
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
        "user_doc_verification": userDocVerification,
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
