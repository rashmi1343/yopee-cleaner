// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) =>
    json.encode(data.toJson());

class DashboardResponse {
  String? message;
  int? status;
  DashboardData data;

  DashboardResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        message: json["message"],
        status: json["status"],
        data: DashboardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class DashboardData {
  int? totalEarning;
  int? lastMonth;
  int? today;
  int? monthly;
  int? overall;
  int? specialRequest;
  List<DashboardTranscation> jobRequest;
  UserProfile userProfile;

  DashboardData({
    this.totalEarning,
    this.lastMonth,
    this.today,
    this.monthly,
    this.overall,
    this.specialRequest,
    required this.jobRequest,
    required this.userProfile,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        totalEarning: json["totalEarning"],
        lastMonth: json["lastMonth"],
        today: json["today"],
        monthly: json["monthly"],
        overall: json["overall"],
        specialRequest: json["specialRequest"],
        jobRequest: json["jobRequest"] == null
            ? []
            : List<DashboardTranscation>.from(json["jobRequest"]!
                .map((x) => DashboardTranscation.fromJson(x))),
        userProfile: UserProfile.fromJson(json["user_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "totalEarning": totalEarning,
        "lastMonth": lastMonth,
        "today": today,
        "monthly": monthly,
        "overall": overall,
        "specialRequest": specialRequest,
        "jobRequest": jobRequest == null
            ? []
            : List<dynamic>.from(jobRequest!.map((x) => x.toJson())),
        "user_profile": userProfile?.toJson(),
      };
}

class DashboardTranscation {
  int? id;
  String? type;
  int? userId;
  int? userVehicleId;
  int? userAddressId;
  int? serviceId;
  dynamic subscriptionId;
  dynamic message;
  int? assignedBy;
  DateTime? assignedAt;
  dynamic actionBy;
  dynamic actionAt;
  dynamic actionReason;
  dynamic actionMessage;
  dynamic fromDate;
  dynamic toDate;
  dynamic requestTime;
  int? rating;
  String? comment;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserVehicle? userVehicle;
  User? user;
  DashboardUserAddress? userAddress;

  DashboardTranscation({
    this.id,
    this.type,
    this.userId,
    this.userVehicleId,
    this.userAddressId,
    this.serviceId,
    this.subscriptionId,
    this.message,
    this.assignedBy,
    this.assignedAt,
    this.actionBy,
    this.actionAt,
    this.actionReason,
    this.actionMessage,
    this.fromDate,
    this.toDate,
    this.requestTime,
    this.rating,
    this.comment,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userVehicle,
    this.user,
    this.userAddress,
  });

  factory DashboardTranscation.fromJson(Map<String, dynamic> json) =>
      DashboardTranscation(
        id: json["id"],
        type: json["type"],
        userId: json["user_id"],
        userVehicleId: json["user_vehicle_id"],
        userAddressId: json["user_address_id"],
        serviceId: json["service_id"],
        subscriptionId: json["subscription_id"],
        message: json["message"],
        assignedBy: json["assigned_by"],
        assignedAt: json["assigned_at"] == null
            ? null
            : DateTime.parse(json["assigned_at"]),
        actionBy: json["action_by"],
        actionAt: json["action_at"],
        actionReason: json["action_reason"],
        actionMessage: json["action_message"],
        fromDate: json["from_date"],
        toDate: json["to_date"],
        requestTime: json["request_time"],
        rating: json["rating"],
        comment: json["comment"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userVehicle: json["user_vehicle"] == null
            ? null
            : UserVehicle.fromJson(json["user_vehicle"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        userAddress: json["user_address"] == null
            ? null
            : DashboardUserAddress.fromJson(json["user_address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "user_id": userId,
        "user_vehicle_id": userVehicleId,
        "user_address_id": userAddressId,
        "service_id": serviceId,
        "subscription_id": subscriptionId,
        "message": message,
        "assigned_by": assignedBy,
        "assigned_at": assignedAt?.toIso8601String(),
        "action_by": actionBy,
        "action_at": actionAt,
        "action_reason": actionReason,
        "action_message": actionMessage,
        "from_date": fromDate,
        "to_date": toDate,
        "request_time": requestTime,
        "rating": rating,
        "comment": comment,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_vehicle": userVehicle?.toJson(),
        "user": user?.toJson(),
        "user_address": userAddress?.toJson(),
      };
}

class User {
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
  int? accountDetails;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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

class UserVehicle {
  int? id;
  int? userId;
  int? vehicleTypeId;
  int? carBrandId;
  int? carModelId;
  String? registrationNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  Brand? brand;
  Brand? model;
  Brand? vehicle;

  UserVehicle({
    this.id,
    this.userId,
    this.vehicleTypeId,
    this.carBrandId,
    this.carModelId,
    this.registrationNo,
    this.createdAt,
    this.updatedAt,
    this.brand,
    this.model,
    this.vehicle,
  });

  factory UserVehicle.fromJson(Map<String, dynamic> json) => UserVehicle(
        id: json["id"],
        userId: json["user_id"],
        vehicleTypeId: json["vehicle_type_id"],
        carBrandId: json["car_brand_id"],
        carModelId: json["car_model_id"],
        registrationNo: json["registration_no"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        model: json["model"] == null ? null : Brand.fromJson(json["model"]),
        vehicle:
            json["vehicle"] == null ? null : Brand.fromJson(json["vehicle"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "vehicle_type_id": vehicleTypeId,
        "car_brand_id": carBrandId,
        "car_model_id": carModelId,
        "registration_no": registrationNo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "brand": brand?.toJson(),
        "model": model?.toJson(),
        "vehicle": vehicle?.toJson(),
      };
}

class Brand {
  int? id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  List<Media>? media;

  Brand({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.media,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"],
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

class UserProfile {
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
  String? address;
  String? accessToken;
  int? pushNotification;
  int? notifyMonthlyPayment;
  int? accountDetails;
  String? name;
  String? profileImageUrl;
  String? documentImageUrl;

  UserProfile({
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
    this.name,
    this.profileImageUrl,
    this.documentImageUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
        "name": name,
        "profile_image_url": profileImageUrl,
        "document_image_url": documentImageUrl,
      };
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  DateTime? createdAt;
  DateTime? updatedAt;

  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        size: json["size"],
        manipulations: json["manipulations"] == null
            ? []
            : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
        customProperties: json["custom_properties"] == null
            ? []
            : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
        responsiveImages: json["responsive_images"] == null
            ? []
            : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "size": size,
        "manipulations": manipulations == null
            ? []
            : List<dynamic>.from(manipulations!.map((x) => x)),
        "custom_properties": customProperties == null
            ? []
            : List<dynamic>.from(customProperties!.map((x) => x)),
        "responsive_images": responsiveImages == null
            ? []
            : List<dynamic>.from(responsiveImages!.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class DashboardUserAddress {
  int? id;
  int? userId;
  String? type;
  String? flatHouseNo;
  String? areaSector;
  String? nearby;
  DateTime? createdAt;
  DateTime? updatedAt;

  DashboardUserAddress({
    this.id,
    this.userId,
    this.type,
    this.flatHouseNo,
    this.areaSector,
    this.nearby,
    this.createdAt,
    this.updatedAt,
  });

  factory DashboardUserAddress.fromJson(Map<String, dynamic> json) =>
      DashboardUserAddress(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        flatHouseNo: json["flat_house_no"],
        areaSector: json["area_sector"],
        nearby: json["nearby"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "flat_house_no": flatHouseNo,
        "area_sector": areaSector,
        "nearby": nearby,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
