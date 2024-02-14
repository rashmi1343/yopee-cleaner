// To parse this JSON data, do
//
//     final specialRequestListResponse = specialRequestListResponseFromJson(jsonString);

import 'dart:convert';

SpecialRequestListResponse specialRequestListResponseFromJson(String str) =>
    SpecialRequestListResponse.fromJson(json.decode(str));

String specialRequestListResponseToJson(SpecialRequestListResponse data) =>
    json.encode(data.toJson());

class SpecialRequestListResponse {
  String? message;
  int? status;
  List<SpecialRequestData> data;

  SpecialRequestListResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory SpecialRequestListResponse.fromJson(Map<String, dynamic> json) =>
      SpecialRequestListResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<SpecialRequestData>.from(
                json["data"]!.map((x) => SpecialRequestData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SpecialRequestData {
  int? id;
  String? type;
  int? userId;
  int? userVehicleId;
  int? userAddressId;
  int? serviceId;
  dynamic subscriptionId;
  dynamic message;
  int? assignedBy;
  dynamic assignedAt;
  dynamic actionBy;
  dynamic actionAt;
  dynamic actionReason;
  dynamic actionMessage;
  dynamic fromDate;
  dynamic toDate;
  dynamic requestTime;
  int? rating;
  dynamic comment;
  String status;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserVehicle userVehicle;
  Cleaner user;
  UserAddress userAddress;
  Cleaner cleaner;
  Service service;

  SpecialRequestData({
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
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.userVehicle,
    required this.user,
    required this.userAddress,
    required this.cleaner,
    required this.service,
  });

  factory SpecialRequestData.fromJson(Map<String, dynamic> json) =>
      SpecialRequestData(
        id: json["id"],
        type: json["type"],
        userId: json["user_id"],
        userVehicleId: json["user_vehicle_id"],
        userAddressId: json["user_address_id"],
        serviceId: json["service_id"],
        subscriptionId: json["subscription_id"],
        message: json["message"],
        assignedBy: json["assigned_by"],
        assignedAt: json["assigned_at"],
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
        userVehicle: UserVehicle.fromJson(json["user_vehicle"] ?? {}),
        user: Cleaner.fromJson(json["user"] ?? {}),
        userAddress: UserAddress.fromJson(json["user_address"] ?? {}),
        cleaner: Cleaner.fromJson(json["cleaner"] ?? {}),
        service: Service.fromJson(json["service"] ?? {}),
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
        "assigned_at": assignedAt,
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
        "cleaner": cleaner?.toJson(),
        "service": service?.toJson(),
      };
}

class Cleaner {
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

  Cleaner({
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

  factory Cleaner.fromJson(Map<String, dynamic> json) => Cleaner(
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

class Service {
  int? id;
  String? type;
  String? name;
  String? shortDescription;
  int? discountPrice;
  int? price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? icon;
  List<Media>? media;

  Service({
    this.id,
    this.type,
    this.name,
    this.shortDescription,
    this.discountPrice,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.icon,
    this.media,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        shortDescription: json["short_description"],
        discountPrice: json["discount_price"],
        price: json["price"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"],
        icon: json["icon"],
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "short_description": shortDescription,
        "discount_price": discountPrice,
        "price": price,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "icon": icon,
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
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

class UserAddress {
  int? id;
  int? userId;
  String type;
  String flatHouseNo;
  String areaSector;
  String nearby;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserAddress({
    this.id,
    this.userId,
    required this.type,
    required this.flatHouseNo,
    required this.areaSector,
    required this.nearby,
    this.createdAt,
    this.updatedAt,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"] ?? "",
        flatHouseNo: json["flat_house_no"] ?? "",
        areaSector: json["area_sector"] ?? "",
        nearby: json["nearby"] ?? "",
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

class UserVehicle {
  int? id;
  int? userId;
  int? vehicleTypeId;
  int? carBrandId;
  int? carModelId;
  String? registrationNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  Brand brand;
  Brand model;
  Brand vehicle;

  UserVehicle({
    this.id,
    this.userId,
    this.vehicleTypeId,
    this.carBrandId,
    this.carModelId,
    this.registrationNo,
    this.createdAt,
    this.updatedAt,
    required this.brand,
    required this.model,
    required this.vehicle,
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
        brand: Brand.fromJson(json["brand"] ?? {}),
        model: Brand.fromJson(json["model"] ?? {}),
        vehicle: Brand.fromJson(json["vehicle"] ?? {}),
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
