// To parse this JSON data, do
//
//     final paymentDetailsResponse = paymentDetailsResponseFromJson(jsonString);

import 'dart:convert';

PaymentDetailsResponse paymentDetailsResponseFromJson(String str) =>
    PaymentDetailsResponse.fromJson(json.decode(str));

String paymentDetailsResponseToJson(PaymentDetailsResponse data) =>
    json.encode(data.toJson());

class PaymentDetailsResponse {
  String? message;
  int? status;
  PaymentDetailsData data;

  PaymentDetailsResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory PaymentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      PaymentDetailsResponse(
        message: json["message"],
        status: json["status"],
        data: PaymentDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class PaymentDetailsData {
  TranscationData transcation;

  PaymentDetailsData({
    required this.transcation,
  });

  factory PaymentDetailsData.fromJson(Map<String, dynamic> json) =>
      PaymentDetailsData(
        transcation: TranscationData.fromJson(json["transcation"]),
      );

  Map<String, dynamic> toJson() => {
        "transcation": transcation?.toJson(),
      };
}

class TranscationData {
  int? id;
  int? bookingId;
  int? userId;
  int? userVehicleId;
  int? userAddressId;
  String? paymentType;
  int? amount;
  String? transactionStatus;
  String? paymentDate;
  String? paymentStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  PaymentUserVehicle userVehicle;
  PaymentUser user;
  PaymentUserAddress userAddress;

  TranscationData({
    this.id,
    this.bookingId,
    this.userId,
    this.userVehicleId,
    this.userAddressId,
    this.paymentType,
    this.amount,
    this.transactionStatus,
    this.paymentDate,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    required this.userVehicle,
    required this.user,
    required this.userAddress,
  });

  factory TranscationData.fromJson(Map<String, dynamic> json) =>
      TranscationData(
        id: json["id"],
        bookingId: json["booking_id"],
        userId: json["user_id"],
        userVehicleId: json["user_vehicle_id"],
        userAddressId: json["user_address_id"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        transactionStatus: json["transaction_status"],
        paymentDate: json["payment_date"],
        paymentStatus: json["payment_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userVehicle: PaymentUserVehicle.fromJson(json["user_vehicle"] ?? {}),
        user: PaymentUser.fromJson(json["user"] ?? {}),
        userAddress: PaymentUserAddress.fromJson(json["user_address"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "user_id": userId,
        "user_vehicle_id": userVehicleId,
        "user_address_id": userAddressId,
        "payment_type": paymentType,
        "amount": amount,
        "transaction_status": transactionStatus,
        "payment_date": paymentDate,
        "payment_status": paymentStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_vehicle": userVehicle?.toJson(),
        "user": user?.toJson(),
        "user_address": userAddress?.toJson(),
      };
}

class PaymentUser {
  int? id;
  String? userType;
  String? status;
  String? email;
  String? countryCode;
  int? mobile;
  dynamic latitude;
  dynamic longitude;
  String? address;
  String? accessToken;
  int? pushNotification;
  int? notifyMonthlyPayment;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  PaymentUser({
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

  factory PaymentUser.fromJson(Map<String, dynamic> json) => PaymentUser(
        id: json["id"],
        userType: json["user_type"],
        status: json["status"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        address: json["address"] ?? "",
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

class PaymentUserAddress {
  int? id;
  int? userId;
  String? type;
  String? flatHouseNo;
  String? areaSector;
  String? nearby;
  DateTime? createdAt;
  DateTime? updatedAt;

  PaymentUserAddress({
    this.id,
    this.userId,
    this.type,
    this.flatHouseNo,
    this.areaSector,
    this.nearby,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentUserAddress.fromJson(Map<String, dynamic> json) =>
      PaymentUserAddress(
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

class PaymentUserVehicle {
  int? id;
  int? userId;
  int? vehicleTypeId;
  int? carBrandId;
  int? carModelId;
  String? registrationNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  PaymentBrand brand;
  PaymentBrand model;
  PaymentBrand vehicle;

  PaymentUserVehicle({
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

  factory PaymentUserVehicle.fromJson(Map<String, dynamic> json) =>
      PaymentUserVehicle(
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
        brand: PaymentBrand.fromJson(json["brand"] ?? {}),
        model: PaymentBrand.fromJson(json["model"] ?? {}),
        vehicle: PaymentBrand.fromJson(json["vehicle"] ?? {}),
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

class PaymentBrand {
  int? id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  List<Media>? media;

  PaymentBrand({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.media,
  });

  factory PaymentBrand.fromJson(Map<String, dynamic> json) => PaymentBrand(
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
