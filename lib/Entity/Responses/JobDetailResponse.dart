// // // // To parse this JSON data, do
// // // //
// // // //     final jobDetailResponse = jobDetailResponseFromJson(jsonString);
// // //
// // // import 'dart:convert';
// // //
// // // JobDetailResponse jobDetailResponseFromJson(String str) =>
// // //     JobDetailResponse.fromJson(json.decode(str));
// // //
// // // String jobDetailResponseToJson(JobDetailResponse data) =>
// // //     json.encode(data.toJson());
// // //
// // // class JobDetailResponse {
// // //   String? message;
// // //   int? status;
// // //   JobDetailData data;
// // //
// // //   JobDetailResponse({
// // //     this.message,
// // //     this.status,
// // //     required this.data,
// // //   });
// // //
// // //   factory JobDetailResponse.fromJson(Map<String, dynamic> json) =>
// // //       JobDetailResponse(
// // //         message: json["message"],
// // //         status: json["status"],
// // //         data: JobDetailData.fromJson(json["data"]),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "message": message,
// // //         "status": status,
// // //         "data": data?.toJson(),
// // //       };
// // // }
// // //
// // // class JobDetailData {
// // //   BookingDetails bookingDetails;
// // //   List<RateWashlist> rateWashlists;
// // //
// // //   JobDetailData({
// // //     required this.bookingDetails,
// // //     required this.rateWashlists,
// // //   });
// // //
// // //   factory JobDetailData.fromJson(Map<String, dynamic> json) => JobDetailData(
// // //         bookingDetails: BookingDetails.fromJson(json["booking_details"]),
// // //         rateWashlists: json["rateWashlists"] == null
// // //             ? []
// // //             : List<RateWashlist>.from(
// // //                 json["rateWashlists"]!.map((x) => RateWashlist.fromJson(x))),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "booking_details": bookingDetails?.toJson(),
// // //         "rateWashlists":
// // //             List<dynamic>.from(rateWashlists!.map((x) => x.toJson())),
// // //       };
// // // }
// // //
// // // class BookingDetails {
// // //   int? id;
// // //   String? type;
// // //   int? userId;
// // //   int? userVehicleId;
// // //   int? userAddressId;
// // //   int? serviceId;
// // //   String? subscriptionId;
// // //   String? message;
// // //   int? assignedBy;
// // //   DateTime? assignedAt;
// // //   int? actionBy;
// // //   DateTime? actionAt;
// // //   String? actionReason;
// // //   String? actionMessage;
// // //   DateTime? fromDate;
// // //   String? toDate;
// // //   String? requestTime;
// // //   String? comment;
// // //   String? status;
// // //   String? createdAt;
// // //   DateTime? updatedAt;
// // //   ReportCleaner user;
// // //   ReportUserVehicle userVehicle;
// // //   ReportUserAddress userAddress;
// // //   String? subscription;
// // //   Transaction? transaction;
// // //   Service? service;
// // //   ReportCleaner? cleaner;
// // //
// // //   BookingDetails({
// // //     this.id,
// // //     this.type,
// // //     this.userId,
// // //     this.userVehicleId,
// // //     this.userAddressId,
// // //     this.serviceId,
// // //     this.subscriptionId,
// // //     this.message,
// // //     this.assignedBy,
// // //     this.assignedAt,
// // //     this.actionBy,
// // //     this.actionAt,
// // //     this.actionReason,
// // //     this.actionMessage,
// // //     this.fromDate,
// // //     this.toDate,
// // //     this.requestTime,
// // //     this.comment,
// // //     this.status,
// // //     required this.createdAt,
// // //     this.updatedAt,
// // //     required this.user,
// // //     required this.userVehicle,
// // //     required this.userAddress,
// // //     this.subscription,
// // //     this.transaction,
// // //     this.service,
// // //     this.cleaner,
// // //   });
// // //
// // //   factory BookingDetails.fromJson(Map<String, dynamic> json) => BookingDetails(
// // //         id: json["id"],
// // //         type: json["type"],
// // //         userId: json["user_id"],
// // //         userVehicleId: json["user_vehicle_id"],
// // //         userAddressId: json["user_address_id"],
// // //         serviceId: json["service_id"],
// // //         subscriptionId: json["subscription_id"],
// // //         message: json["message"],
// // //         assignedBy: json["assigned_by"],
// // //         assignedAt: json["assigned_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["assigned_at"]),
// // //         actionBy: json["action_by"],
// // //         actionAt: json["action_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["action_at"]),
// // //         actionReason: json["action_reason"],
// // //         actionMessage: json["action_message"],
// // //         fromDate: json["from_date"] == null
// // //             ? null
// // //             : DateTime.parse(json["from_date"]),
// // //         toDate: json["to_date"],
// // //         requestTime: json["request_time"],
// // //         comment: json["comment"],
// // //         status: json["status"],
// // //         createdAt: json["created_at"],
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //         user: ReportCleaner.fromJson(json["user"]),
// // //         userVehicle: ReportUserVehicle.fromJson(json["user_vehicle"]),
// // //         userAddress: ReportUserAddress.fromJson(json["user_address"]),
// // //         subscription: json["subscription"],
// // //         transaction: json["transaction"] == null
// // //             ? null
// // //             : Transaction.fromJson(json["transaction"]),
// // //         service:
// // //             json["service"] == null ? null : Service.fromJson(json["service"]),
// // //         cleaner: json["cleaner"] == null
// // //             ? null
// // //             : ReportCleaner.fromJson(json["cleaner"]),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "type": type,
// // //         "user_id": userId,
// // //         "user_vehicle_id": userVehicleId,
// // //         "user_address_id": userAddressId,
// // //         "service_id": serviceId,
// // //         "subscription_id": subscriptionId,
// // //         "message": message,
// // //         "assigned_by": assignedBy,
// // //         "assigned_at": assignedAt?.toIso8601String(),
// // //         "action_by": actionBy,
// // //         "action_at": actionAt?.toIso8601String(),
// // //         "action_reason": actionReason,
// // //         "action_message": actionMessage,
// // //         "from_date":
// // //             "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
// // //         "to_date": toDate,
// // //         "request_time": requestTime,
// // //         "comment": comment,
// // //         "status": status,
// // //         "created_at": createdAt,
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //         "user": user?.toJson(),
// // //         "user_vehicle": userVehicle?.toJson(),
// // //         "user_address": userAddress?.toJson(),
// // //         "subscription": subscription,
// // //         "transaction": transaction?.toJson(),
// // //         "service": service?.toJson(),
// // //         "cleaner": cleaner?.toJson(),
// // //       };
// // // }
// // //
// // // class ReportCleaner {
// // //   int? id;
// // //   String? userType;
// // //   String? status;
// // //   String? email;
// // //   String? countryCode;
// // //   int? mobile;
// // //   String? latitude;
// // //   String? longitude;
// // //   String? address;
// // //   String? accessToken;
// // //   int? pushNotification;
// // //   int? notifyMonthlyPayment;
// // //   String? profileImageUrl;
// // //   String? documentImageUrl;
// // //   String? name;
// // //
// // //   ReportCleaner({
// // //     this.id,
// // //     this.userType,
// // //     this.status,
// // //     this.email,
// // //     this.countryCode,
// // //     this.mobile,
// // //     this.latitude,
// // //     this.longitude,
// // //     this.address,
// // //     this.accessToken,
// // //     this.pushNotification,
// // //     this.notifyMonthlyPayment,
// // //     this.profileImageUrl,
// // //     this.documentImageUrl,
// // //     this.name,
// // //   });
// // //
// // //   factory ReportCleaner.fromJson(Map<String, dynamic> json) => ReportCleaner(
// // //         id: json["id"],
// // //         userType: json["user_type"],
// // //         status: json["status"],
// // //         email: json["email"],
// // //         countryCode: json["country_code"],
// // //         mobile: json["mobile"],
// // //         latitude: json["latitude"],
// // //         longitude: json["longitude"],
// // //         address: json["address"],
// // //         accessToken: json["access_token"],
// // //         pushNotification: json["push_notification"],
// // //         notifyMonthlyPayment: json["notify_monthly_payment"],
// // //         profileImageUrl: json["profile_image_url"],
// // //         documentImageUrl: json["document_image_url"],
// // //         name: json["name"],
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "user_type": userType,
// // //         "status": status,
// // //         "email": email,
// // //         "country_code": countryCode,
// // //         "mobile": mobile,
// // //         "latitude": latitude,
// // //         "longitude": longitude,
// // //         "address": address,
// // //         "access_token": accessToken,
// // //         "push_notification": pushNotification,
// // //         "notify_monthly_payment": notifyMonthlyPayment,
// // //         "profile_image_url": profileImageUrl,
// // //         "document_image_url": documentImageUrl,
// // //         "name": name,
// // //       };
// // // }
// // //
// // // class Service {
// // //   int? id;
// // //   String? type;
// // //   String? name;
// // //   String? shortDescription;
// // //   int? discountPrice;
// // //   int? price;
// // //   String? status;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //   String? image;
// // //   String? icon;
// // //   List<Media>? media;
// // //
// // //   Service({
// // //     this.id,
// // //     this.type,
// // //     this.name,
// // //     this.shortDescription,
// // //     this.discountPrice,
// // //     this.price,
// // //     this.status,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //     this.image,
// // //     this.icon,
// // //     this.media,
// // //   });
// // //
// // //   factory Service.fromJson(Map<String, dynamic> json) => Service(
// // //         id: json["id"],
// // //         type: json["type"],
// // //         name: json["name"],
// // //         shortDescription: json["short_description"],
// // //         discountPrice: json["discount_price"],
// // //         price: json["price"],
// // //         status: json["status"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //         image: json["image"],
// // //         icon: json["icon"],
// // //         media: json["media"] == null
// // //             ? []
// // //             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "type": type,
// // //         "name": name,
// // //         "short_description": shortDescription,
// // //         "discount_price": discountPrice,
// // //         "price": price,
// // //         "status": status,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //         "image": image,
// // //         "icon": icon,
// // //         "media": media == null
// // //             ? []
// // //             : List<dynamic>.from(media!.map((x) => x.toJson())),
// // //       };
// // // }
// // //
// // // class Media {
// // //   int? id;
// // //   String? modelType;
// // //   int? modelId;
// // //   String? collectionName;
// // //   String? name;
// // //   String? fileName;
// // //   String? mimeType;
// // //   String? disk;
// // //   int? size;
// // //   List<String>? manipulations;
// // //   List<String>? customProperties;
// // //   List<String>? responsiveImages;
// // //   int? orderColumn;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //
// // //   Media({
// // //     this.id,
// // //     this.modelType,
// // //     this.modelId,
// // //     this.collectionName,
// // //     this.name,
// // //     this.fileName,
// // //     this.mimeType,
// // //     this.disk,
// // //     this.size,
// // //     this.manipulations,
// // //     this.customProperties,
// // //     this.responsiveImages,
// // //     this.orderColumn,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //   });
// // //
// // //   factory Media.fromJson(Map<String, dynamic> json) => Media(
// // //         id: json["id"],
// // //         modelType: json["model_type"],
// // //         modelId: json["model_id"],
// // //         collectionName: json["collection_name"],
// // //         name: json["name"],
// // //         fileName: json["file_name"],
// // //         mimeType: json["mime_type"],
// // //         disk: json["disk"],
// // //         size: json["size"],
// // //         manipulations: json["manipulations"] == null
// // //             ? []
// // //             : List<String>.from(json["manipulations"]!.map((x) => x)),
// // //         customProperties: json["custom_properties"] == null
// // //             ? []
// // //             : List<String>.from(json["custom_properties"]!.map((x) => x)),
// // //         responsiveImages: json["responsive_images"] == null
// // //             ? []
// // //             : List<String>.from(json["responsive_images"]!.map((x) => x)),
// // //         orderColumn: json["order_column"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "model_type": modelType,
// // //         "model_id": modelId,
// // //         "collection_name": collectionName,
// // //         "name": name,
// // //         "file_name": fileName,
// // //         "mime_type": mimeType,
// // //         "disk": disk,
// // //         "size": size,
// // //         "manipulations": manipulations == null
// // //             ? []
// // //             : List<dynamic>.from(manipulations!.map((x) => x)),
// // //         "custom_properties": customProperties == null
// // //             ? []
// // //             : List<dynamic>.from(customProperties!.map((x) => x)),
// // //         "responsive_images": responsiveImages == null
// // //             ? []
// // //             : List<dynamic>.from(responsiveImages!.map((x) => x)),
// // //         "order_column": orderColumn,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //       };
// // // }
// // //
// // // class Transaction {
// // //   int? id;
// // //   int? bookingId;
// // //   int? userId;
// // //   String? assignedBy;
// // //   int? userVehicleId;
// // //   int? userAddressId;
// // //   String? paymentType;
// // //   int? amount;
// // //   String? transactionStatus;
// // //   DateTime? paymentDate;
// // //   String? paymentStatus;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //
// // //   Transaction({
// // //     this.id,
// // //     this.bookingId,
// // //     this.userId,
// // //     this.assignedBy,
// // //     this.userVehicleId,
// // //     this.userAddressId,
// // //     this.paymentType,
// // //     this.amount,
// // //     this.transactionStatus,
// // //     this.paymentDate,
// // //     this.paymentStatus,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //   });
// // //
// // //   factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
// // //         id: json["id"],
// // //         bookingId: json["booking_id"],
// // //         userId: json["user_id"],
// // //         assignedBy: json["assigned_by"],
// // //         userVehicleId: json["user_vehicle_id"],
// // //         userAddressId: json["user_address_id"],
// // //         paymentType: json["payment_type"],
// // //         amount: json["amount"],
// // //         transactionStatus: json["transaction_status"],
// // //         paymentDate: json["payment_date"] == null
// // //             ? null
// // //             : DateTime.parse(json["payment_date"]),
// // //         paymentStatus: json["payment_status"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "booking_id": bookingId,
// // //         "user_id": userId,
// // //         "assigned_by": assignedBy,
// // //         "user_vehicle_id": userVehicleId,
// // //         "user_address_id": userAddressId,
// // //         "payment_type": paymentType,
// // //         "amount": amount,
// // //         "transaction_status": transactionStatus,
// // //         "payment_date":
// // //             "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
// // //         "payment_status": paymentStatus,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //       };
// // // }
// // //
// // // class ReportUserAddress {
// // //   int? id;
// // //   int? userId;
// // //   String? type;
// // //   String? flatHouseNo;
// // //   String? areaSector;
// // //   String? nearby;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //
// // //   ReportUserAddress({
// // //     this.id,
// // //     this.userId,
// // //     this.type,
// // //     this.flatHouseNo,
// // //     this.areaSector,
// // //     this.nearby,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //   });
// // //
// // //   factory ReportUserAddress.fromJson(Map<String, dynamic> json) =>
// // //       ReportUserAddress(
// // //         id: json["id"],
// // //         userId: json["user_id"],
// // //         type: json["type"],
// // //         flatHouseNo: json["flat_house_no"],
// // //         areaSector: json["area_sector"],
// // //         nearby: json["nearby"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "user_id": userId,
// // //         "type": type,
// // //         "flat_house_no": flatHouseNo,
// // //         "area_sector": areaSector,
// // //         "nearby": nearby,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //       };
// // // }
// // //
// // // class ReportUserVehicle {
// // //   int? id;
// // //   int? userId;
// // //   int? vehicleTypeId;
// // //   int? carBrandId;
// // //   int? carModelId;
// // //   String? registrationNo;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //   ReportBrand brand;
// // //   ReportBrand model;
// // //   ReportBrand vehicle;
// // //
// // //   ReportUserVehicle({
// // //     this.id,
// // //     this.userId,
// // //     this.vehicleTypeId,
// // //     this.carBrandId,
// // //     this.carModelId,
// // //     this.registrationNo,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //     required this.brand,
// // //     required this.model,
// // //     required this.vehicle,
// // //   });
// // //
// // //   factory ReportUserVehicle.fromJson(Map<String, dynamic> json) =>
// // //       ReportUserVehicle(
// // //         id: json["id"],
// // //         userId: json["user_id"],
// // //         vehicleTypeId: json["vehicle_type_id"],
// // //         carBrandId: json["car_brand_id"],
// // //         carModelId: json["car_model_id"],
// // //         registrationNo: json["registration_no"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //         brand: ReportBrand.fromJson(json["brand"]),
// // //         model: ReportBrand.fromJson(json["model"]),
// // //         vehicle: ReportBrand.fromJson(json["vehicle"]),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "user_id": userId,
// // //         "vehicle_type_id": vehicleTypeId,
// // //         "car_brand_id": carBrandId,
// // //         "car_model_id": carModelId,
// // //         "registration_no": registrationNo,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //         "brand": brand?.toJson(),
// // //         "model": model?.toJson(),
// // //         "vehicle": vehicle?.toJson(),
// // //       };
// // // }
// // //
// // // class ReportBrand {
// // //   int? id;
// // //   String? name;
// // //   String? status;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //   String? image;
// // //   List<Media>? media;
// // //
// // //   ReportBrand({
// // //     this.id,
// // //     this.name,
// // //     this.status,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //     this.image,
// // //     this.media,
// // //   });
// // //
// // //   factory ReportBrand.fromJson(Map<String, dynamic> json) => ReportBrand(
// // //         id: json["id"],
// // //         name: json["name"],
// // //         status: json["status"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //         image: json["image"],
// // //         media: json["media"] == null
// // //             ? []
// // //             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "name": name,
// // //         "status": status,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //         "image": image,
// // //         "media": media == null
// // //             ? []
// // //             : List<dynamic>.from(media!.map((x) => x.toJson())),
// // //       };
// // // }
// // //
// // // class RateWashlist {
// // //   int? id;
// // //   int? userId;
// // //   int? bookingId;
// // //   String? icon;
// // //   int? rating;
// // //   String? feedback;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //   String? document;
// // //   List<WashDocument> washDocuments;
// // //   ReportCleaner user;
// // //   List<dynamic>? media;
// // //
// // //   RateWashlist({
// // //     this.id,
// // //     this.userId,
// // //     this.bookingId,
// // //     this.icon,
// // //     this.rating,
// // //     this.feedback,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //     this.document,
// // //     required this.washDocuments,
// // //     required this.user,
// // //     this.media,
// // //   });
// // //
// // //   factory RateWashlist.fromJson(Map<String, dynamic> json) => RateWashlist(
// // //         id: json["id"],
// // //         userId: json["user_id"],
// // //         bookingId: json["booking_id"],
// // //         icon: json["icon"],
// // //         rating: json["rating"],
// // //         feedback: json["feedback"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //         document: json["document"],
// // //         washDocuments: json["wash_documents"] == null
// // //             ? []
// // //             : List<WashDocument>.from(
// // //                 json["wash_documents"]!.map((x) => WashDocument.fromJson(x))),
// // //         user: ReportCleaner.fromJson(json["user"]),
// // //         media: json["media"] == null
// // //             ? []
// // //             : List<dynamic>.from(json["media"]!.map((x) => x)),
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "user_id": userId,
// // //         "booking_id": bookingId,
// // //         "icon": icon,
// // //         "rating": rating,
// // //         "feedback": feedback,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //         "document": document,
// // //         "wash_documents":
// // //             List<dynamic>.from(washDocuments!.map((x) => x.toJson())),
// // //         "user": user?.toJson(),
// // //         "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
// // //       };
// // // }
// // //
// // // class WashDocument {
// // //   int? id;
// // //   int? rateWashId;
// // //   String? images;
// // //   DateTime? createdAt;
// // //   DateTime? updatedAt;
// // //   String? document;
// // //
// // //   WashDocument({
// // //     this.id,
// // //     this.rateWashId,
// // //     this.images,
// // //     this.createdAt,
// // //     this.updatedAt,
// // //     this.document,
// // //   });
// // //
// // //   factory WashDocument.fromJson(Map<String, dynamic> json) => WashDocument(
// // //         id: json["id"],
// // //         rateWashId: json["rate_wash_id"],
// // //         images: json["images"],
// // //         createdAt: json["created_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["created_at"]),
// // //         updatedAt: json["updated_at"] == null
// // //             ? null
// // //             : DateTime.parse(json["updated_at"]),
// // //         document: json["document"],
// // //       );
// // //
// // //   Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "rate_wash_id": rateWashId,
// // //         "images": images,
// // //         "created_at": createdAt?.toIso8601String(),
// // //         "updated_at": updatedAt?.toIso8601String(),
// // //         "document": document,
// // //       };
// // // }
// // // To parse this JSON data, do
// // //
// // //     final jobDetailResponse = jobDetailResponseFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // JobDetailResponse jobDetailResponseFromJson(String str) =>
// //     JobDetailResponse.fromJson(json.decode(str));
// //
// // String jobDetailResponseToJson(JobDetailResponse data) =>
// //     json.encode(data.toJson());
// //
// // class JobDetailResponse {
// //   String? message;
// //   int? status;
// //   JobDetailData data;
// //
// //   JobDetailResponse({
// //     this.message,
// //     this.status,
// //     required this.data,
// //   });
// //
// //   factory JobDetailResponse.fromJson(Map<String, dynamic> json) =>
// //       JobDetailResponse(
// //         message: json["message"],
// //         status: json["status"],
// //         data: JobDetailData.fromJson(json["data"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "message": message,
// //         "status": status,
// //         "data": data?.toJson(),
// //       };
// // }
// //
// // class JobDetailData {
// //   BookingDetails bookingDetails;
// //   List<RateWashlist> rateWashlists;
// //
// //   JobDetailData({
// //     required this.bookingDetails,
// //     required this.rateWashlists,
// //   });
// //
// //   factory JobDetailData.fromJson(Map<String, dynamic> json) => JobDetailData(
// //         bookingDetails: BookingDetails.fromJson(json["booking_details"] ?? {}),
// //         rateWashlists: json["rateWashlists"] == null
// //             ? []
// //             : List<RateWashlist>.from(
// //                 json["rateWashlists"]!.map((x) => RateWashlist.fromJson(x))),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "booking_details": bookingDetails?.toJson(),
// //         "rateWashlists":
// //             List<dynamic>.from(rateWashlists!.map((x) => x.toJson())),
// //       };
// // }
// //
// // class BookingDetails {
// //   int? id;
// //   String? type;
// //   int? userId;
// //   int? userVehicleId;
// //   int? userAddressId;
// //   int? serviceId;
// //   int? subscriptionId;
// //   String? message;
// //   int? assignedBy;
// //   DateTime? assignedAt;
// //   int? actionBy;
// //   DateTime? actionAt;
// //   String? actionReason;
// //   String? actionMessage;
// //   DateTime? fromDate;
// //   DateTime? toDate;
// //   String? requestTime;
// //   int? rating;
// //   String? comment;
// //   String? status;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? actionImageUrl;
// //   JobDetailCleaner user;
// //   JobDetailUserVehicle userVehicle;
// //   JobDetailUserAddress userAddress;
// //   JobDetailSubscription subscription;
// //   JobDetailTransaction transaction;
// //   JobDetailService service;
// //   JobDetailCleaner cleaner;
// //   List<Media> media;
// //
// //   BookingDetails({
// //     this.id,
// //     this.type,
// //     this.userId,
// //     this.userVehicleId,
// //     this.userAddressId,
// //     this.serviceId,
// //     this.subscriptionId,
// //     this.message,
// //     this.assignedBy,
// //     this.assignedAt,
// //     this.actionBy,
// //     this.actionAt,
// //     this.actionReason,
// //     this.actionMessage,
// //     this.fromDate,
// //     this.toDate,
// //     this.requestTime,
// //     this.rating,
// //     this.comment,
// //     required this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //     required this.actionImageUrl,
// //     required this.user,
// //     required this.userVehicle,
// //     required this.userAddress,
// //     required this.subscription,
// //     required this.transaction,
// //     required this.service,
// //     required this.cleaner,
// //     required this.media,
// //   });
// //
// //   factory BookingDetails.fromJson(Map<String, dynamic> json) => BookingDetails(
// //         id: json["id"],
// //         type: json["type"],
// //         userId: json["user_id"],
// //         userVehicleId: json["user_vehicle_id"],
// //         userAddressId: json["user_address_id"],
// //         serviceId: json["service_id"],
// //         subscriptionId: json["subscription_id"],
// //         message: json["message"],
// //         assignedBy: json["assigned_by"],
// //         assignedAt: json["assigned_at"] == null
// //             ? null
// //             : DateTime.parse(json["assigned_at"]),
// //         actionBy: json["action_by"],
// //         actionAt: json["action_at"] == null
// //             ? null
// //             : DateTime.parse(json["action_at"]),
// //         actionReason: json["action_reason"],
// //         actionMessage: json["action_message"],
// //         fromDate: json["from_date"],
// //         toDate: json["to_date"],
// //         requestTime: json["request_time"],
// //         rating: json["rating"],
// //         comment: json["comment"],
// //         status: json["status"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         actionImageUrl: json["action_image_url"],
// //         user: JobDetailCleaner.fromJson(json["user"] ?? {}),
// //         userVehicle: JobDetailUserVehicle.fromJson(json["user_vehicle"] ?? {}),
// //         userAddress: JobDetailUserAddress.fromJson(json["user_address"] ?? {}),
// //         subscription:
// //             JobDetailSubscription.fromJson(json["subscription"] ?? {}),
// //         transaction: JobDetailTransaction.fromJson(json["transaction"] ?? {}),
// //         service: JobDetailService.fromJson(json["service"] ?? {}),
// //         cleaner: JobDetailCleaner.fromJson(json["cleaner"] ?? {}),
// //         media: json["media"] == null
// //             ? []
// //             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "type": type,
// //         "user_id": userId,
// //         "user_vehicle_id": userVehicleId,
// //         "user_address_id": userAddressId,
// //         "service_id": serviceId,
// //         "subscription_id": subscriptionId,
// //         "message": message,
// //         "assigned_by": assignedBy,
// //         "assigned_at": assignedAt?.toIso8601String(),
// //         "action_by": actionBy,
// //         "action_at": actionAt?.toIso8601String(),
// //         "action_reason": actionReason,
// //         "action_message": actionMessage,
// //         "from_date": fromDate,
// //         "to_date": toDate,
// //         "request_time": requestTime,
// //         "rating": rating,
// //         "comment": comment,
// //         "status": status,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "action_image_url": actionImageUrl,
// //         "user": user?.toJson(),
// //         "user_vehicle": userVehicle?.toJson(),
// //         "user_address": userAddress?.toJson(),
// //         "subscription": subscription?.toJson(),
// //         "transaction": transaction?.toJson(),
// //         "service": service?.toJson(),
// //         "cleaner": cleaner?.toJson(),
// //         "media": media == null
// //             ? []
// //             : List<dynamic>.from(media!.map((x) => x.toJson())),
// //       };
// // }
// //
// // class JobDetailCleaner {
// //   int? id;
// //   UserType? userType;
// //   Status? status;
// //   Email? email;
// //   String? countryCode;
// //   int? mobile;
// //   String? latitude;
// //   String? longitude;
// //   String? address;
// //   AccessToken? accessToken;
// //   int? pushNotification;
// //   int? notifyMonthlyPayment;
// //   int? accountDetails;
// //   String? profileImageUrl;
// //   String? documentImageUrl;
// //   Name? name;
// //
// //   JobDetailCleaner({
// //     this.id,
// //     this.userType,
// //     this.status,
// //     this.email,
// //     this.countryCode,
// //     this.mobile,
// //     this.latitude,
// //     this.longitude,
// //     this.address,
// //     this.accessToken,
// //     this.pushNotification,
// //     this.notifyMonthlyPayment,
// //     this.accountDetails,
// //     this.profileImageUrl,
// //     this.documentImageUrl,
// //     this.name,
// //   });
// //
// //   factory JobDetailCleaner.fromJson(Map<String, dynamic> json) =>
// //       JobDetailCleaner(
// //         id: json["id"],
// //         userType: userTypeValues.map[json["user_type"]]!,
// //         status: statusValues.map[json["status"]]!,
// //         email: emailValues.map[json["email"]]!,
// //         countryCode: json["country_code"],
// //         mobile: json["mobile"],
// //         latitude: json["latitude"],
// //         longitude: json["longitude"],
// //         address: json["address"],
// //         accessToken: json["access_token"],
// //         pushNotification: json["push_notification"],
// //         notifyMonthlyPayment: json["notify_monthly_payment"],
// //         accountDetails: json["account_details"],
// //         profileImageUrl: json["profile_image_url"],
// //         documentImageUrl: json["document_image_url"],
// //         name: json["name"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "user_type": userType,
// //         "status": status,
// //         "email": email,
// //         "country_code": countryCode,
// //         "mobile": mobile,
// //         "latitude": latitude,
// //         "longitude": longitude,
// //         "address": address,
// //         "access_token": accessToken,
// //         "push_notification": pushNotification,
// //         "notify_monthly_payment": notifyMonthlyPayment,
// //         "account_details": accountDetails,
// //         "profile_image_url": profileImageUrl,
// //         "document_image_url": documentImageUrl,
// //         "name": name,
// //       };
// // }
// //
// // enum AccessToken {
// //   THE_3937_K_EDVEM_GD_M17_S_YDB0_UZ_MT4_GL6_G_JSO_C_IIYO_JMJ9_F_GT,
// //   THE_3940_DDK_QND64_U_RJB_B5_CSYU_HT_EJP31_Y_N4_Y777_U_AVZC77_R
// // }
// //
// // final accessTokenValues = EnumValues({
// //   "3937|kEdvemGdM17sYDB0UZMt4gl6gJsoCIiyoJMJ9FGt": AccessToken
// //       .THE_3937_K_EDVEM_GD_M17_S_YDB0_UZ_MT4_GL6_G_JSO_C_IIYO_JMJ9_F_GT,
// //   "3940|DdkQND64URjbB5csyuHtEjp31yN4Y777uAvzc77R":
// //       AccessToken.THE_3940_DDK_QND64_U_RJB_B5_CSYU_HT_EJP31_Y_N4_Y777_U_AVZC77_R
// // });
// //
// // enum Email { ADMIN_GMAIL_COM, RAHUL_GMAIL_COM }
// //
// // final emailValues = EnumValues({
// //   "admin@gmail.com": Email.ADMIN_GMAIL_COM,
// //   "rahul@gmail.com": Email.RAHUL_GMAIL_COM
// // });
// //
// // enum Name { RAHUL, RAHUL_RAI }
// //
// // final nameValues =
// //     EnumValues({"Rahul": Name.RAHUL, "Rahul rai": Name.RAHUL_RAI});
// //
// // enum Status { ACTIVE }
// //
// // final statusValues = EnumValues({"active": Status.ACTIVE});
// //
// // enum UserType { CLEANER, CUSTOMER }
// //
// // final userTypeValues =
// //     EnumValues({"cleaner": UserType.CLEANER, "customer": UserType.CUSTOMER});
// //
// // class Media {
// //   int? id;
// //   String? modelType;
// //   int? modelId;
// //   String? collectionName;
// //   String? name;
// //   String? fileName;
// //   String? mimeType;
// //   String? disk;
// //   int? size;
// //   List<dynamic>? manipulations;
// //   List<dynamic>? customProperties;
// //   List<dynamic>? responsiveImages;
// //   int? orderColumn;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   DateTime? deletedAt;
// //
// //   Media({
// //     this.id,
// //     this.modelType,
// //     this.modelId,
// //     this.collectionName,
// //     this.name,
// //     this.fileName,
// //     this.mimeType,
// //     this.disk,
// //     this.size,
// //     this.manipulations,
// //     this.customProperties,
// //     this.responsiveImages,
// //     this.orderColumn,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.deletedAt,
// //   });
// //
// //   factory Media.fromJson(Map<String, dynamic> json) => Media(
// //         id: json["id"],
// //         modelType: json["model_type"],
// //         modelId: json["model_id"],
// //         collectionName: json["collection_name"],
// //         name: json["name"],
// //         fileName: json["file_name"],
// //         mimeType: json["mime_type"],
// //         disk: json["disk"],
// //         size: json["size"],
// //         manipulations: json["manipulations"] == null
// //             ? []
// //             : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
// //         customProperties: json["custom_properties"] == null
// //             ? []
// //             : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
// //         responsiveImages: json["responsive_images"] == null
// //             ? []
// //             : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
// //         orderColumn: json["order_column"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         deletedAt: json["deleted_at"] == null
// //             ? null
// //             : DateTime.parse(json["deleted_at"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "model_type": modelType,
// //         "model_id": modelId,
// //         "collection_name": collectionName,
// //         "name": name,
// //         "file_name": fileName,
// //         "mime_type": mimeType,
// //         "disk": disk,
// //         "size": size,
// //         "manipulations": manipulations == null
// //             ? []
// //             : List<dynamic>.from(manipulations!.map((x) => x)),
// //         "custom_properties": customProperties == null
// //             ? []
// //             : List<dynamic>.from(customProperties!.map((x) => x)),
// //         "responsive_images": responsiveImages == null
// //             ? []
// //             : List<dynamic>.from(responsiveImages!.map((x) => x)),
// //         "order_column": orderColumn,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "deleted_at": deletedAt?.toIso8601String(),
// //       };
// // }
// //
// // class JobDetailService {
// //   int? id;
// //   String? type;
// //   String? name;
// //   int? carModelId;
// //   String? shortDescription;
// //   int? discountPrice;
// //   int? price;
// //   Status? status;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? image;
// //   String? icon;
// //   List<Media>? media;
// //
// //   JobDetailService({
// //     this.id,
// //     this.type,
// //     this.name,
// //     this.carModelId,
// //     this.shortDescription,
// //     this.discountPrice,
// //     this.price,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.image,
// //     this.icon,
// //     this.media,
// //   });
// //
// //   factory JobDetailService.fromJson(Map<String, dynamic> json) =>
// //       JobDetailService(
// //         id: json["id"],
// //         type: json["type"],
// //         name: json["name"],
// //         carModelId: json["car_model_id"],
// //         shortDescription: json["short_description"],
// //         discountPrice: json["discount_price"],
// //         price: json["price"],
// //         status: statusValues.map[json["status"]]!,
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         image: json["image"],
// //         icon: json["icon"],
// //         media: json["media"] == null
// //             ? []
// //             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "type": type,
// //         "name": name,
// //         "car_model_id": carModelId,
// //         "short_description": shortDescription,
// //         "discount_price": discountPrice,
// //         "price": price,
// //         "status": statusValues.reverse[status],
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "image": image,
// //         "icon": icon,
// //         "media": media == null
// //             ? []
// //             : List<dynamic>.from(media!.map((x) => x.toJson())),
// //       };
// // }
// //
// // class JobDetailTransaction {
// //   int? id;
// //   int? bookingId;
// //   int? userId;
// //   int? assignedBy;
// //   int? userVehicleId;
// //   int? userAddressId;
// //   String? paymentType;
// //   int? amount;
// //   String? transactionStatus;
// //   DateTime? paymentDate;
// //   String? paymentStatus;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   JobDetailTransaction({
// //     this.id,
// //     this.bookingId,
// //     this.userId,
// //     this.assignedBy,
// //     this.userVehicleId,
// //     this.userAddressId,
// //     this.paymentType,
// //     this.amount,
// //     this.transactionStatus,
// //     this.paymentDate,
// //     this.paymentStatus,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory JobDetailTransaction.fromJson(Map<String, dynamic> json) =>
// //       JobDetailTransaction(
// //         id: json["id"],
// //         bookingId: json["booking_id"],
// //         userId: json["user_id"],
// //         assignedBy: json["assigned_by"],
// //         userVehicleId: json["user_vehicle_id"],
// //         userAddressId: json["user_address_id"],
// //         paymentType: json["payment_type"],
// //         amount: json["amount"],
// //         transactionStatus: json["transaction_status"],
// //         paymentDate: json["payment_date"] == null
// //             ? null
// //             : DateTime.parse(json["payment_date"]),
// //         paymentStatus: json["payment_status"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "booking_id": bookingId,
// //         "user_id": userId,
// //         "assigned_by": assignedBy,
// //         "user_vehicle_id": userVehicleId,
// //         "user_address_id": userAddressId,
// //         "payment_type": paymentType,
// //         "amount": amount,
// //         "transaction_status": transactionStatus,
// //         "payment_date":
// //             "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
// //         "payment_status": paymentStatus,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //       };
// // }
// //
// // class JobDetailUserAddress {
// //   int? id;
// //   int? userId;
// //   String? type;
// //   String? flatHouseNo;
// //   String? areaSector;
// //   String? nearby;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   JobDetailUserAddress({
// //     this.id,
// //     this.userId,
// //     this.type,
// //     this.flatHouseNo,
// //     this.areaSector,
// //     this.nearby,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory JobDetailUserAddress.fromJson(Map<String, dynamic> json) =>
// //       JobDetailUserAddress(
// //         id: json["id"],
// //         userId: json["user_id"],
// //         type: json["type"],
// //         flatHouseNo: json["flat_house_no"],
// //         areaSector: json["area_sector"],
// //         nearby: json["nearby"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "user_id": userId,
// //         "type": type,
// //         "flat_house_no": flatHouseNo,
// //         "area_sector": areaSector,
// //         "nearby": nearby,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //       };
// // }
// //
// // class JobDetailUserVehicle {
// //   int? id;
// //   int? userId;
// //   int? vehicleTypeId;
// //   int? carBrandId;
// //   int? carModelId;
// //   String? registrationNo;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   JobDetailBrand brand;
// //   JobDetailBrand model;
// //   JobDetailBrand vehicle;
// //
// //   JobDetailUserVehicle({
// //     this.id,
// //     this.userId,
// //     this.vehicleTypeId,
// //     this.carBrandId,
// //     this.carModelId,
// //     this.registrationNo,
// //     this.createdAt,
// //     this.updatedAt,
// //     required this.brand,
// //     required this.model,
// //     required this.vehicle,
// //   });
// //
// //   factory JobDetailUserVehicle.fromJson(Map<String, dynamic> json) =>
// //       JobDetailUserVehicle(
// //         id: json["id"],
// //         userId: json["user_id"],
// //         vehicleTypeId: json["vehicle_type_id"],
// //         carBrandId: json["car_brand_id"],
// //         carModelId: json["car_model_id"],
// //         registrationNo: json["registration_no"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         brand: JobDetailBrand.fromJson(json["brand"]),
// //         model: JobDetailBrand.fromJson(json["model"]),
// //         vehicle: JobDetailBrand.fromJson(json["vehicle"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "user_id": userId,
// //         "vehicle_type_id": vehicleTypeId,
// //         "car_brand_id": carBrandId,
// //         "car_model_id": carModelId,
// //         "registration_no": registrationNo,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "brand": brand?.toJson(),
// //         "model": model?.toJson(),
// //         "vehicle": vehicle?.toJson(),
// //       };
// // }
// //
// // class JobDetailBrand {
// //   int? id;
// //   String? name;
// //   Status? status;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? image;
// //   List<Media>? media;
// //   int? carBrandId;
// //
// //   JobDetailBrand({
// //     this.id,
// //     this.name,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.image,
// //     this.media,
// //     this.carBrandId,
// //   });
// //
// //   factory JobDetailBrand.fromJson(Map<String, dynamic> json) => JobDetailBrand(
// //         id: json["id"],
// //         name: json["name"],
// //         status: statusValues.map[json["status"]]!,
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         image: json["image"],
// //         media: json["media"] == null
// //             ? []
// //             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
// //         carBrandId: json["car_brand_id"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "name": name,
// //         "status": statusValues.reverse[status],
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "image": image,
// //         "media": media == null
// //             ? []
// //             : List<dynamic>.from(media!.map((x) => x.toJson())),
// //         "car_brand_id": carBrandId,
// //       };
// // }
// //
// // class RateWashlist {
// //   int? id;
// //   int? userId;
// //   UserType? userType;
// //   int? bookingId;
// //   Icon? icon;
// //   int? rating;
// //   String? feedback;
// //   String? actionBy;
// //   String? actionAt;
// //   String? actionReason;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? document;
// //   List<WashDocument>? washDocuments;
// //   JobDetailCleaner? user;
// //   List<dynamic>? media;
// //
// //   RateWashlist({
// //     this.id,
// //     this.userId,
// //     this.userType,
// //     this.bookingId,
// //     this.icon,
// //     this.rating,
// //     this.feedback,
// //     this.actionBy,
// //     this.actionAt,
// //     this.actionReason,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.document,
// //     this.washDocuments,
// //     this.user,
// //     this.media,
// //   });
// //
// //   factory RateWashlist.fromJson(Map<String, dynamic> json) => RateWashlist(
// //         id: json["id"],
// //         userId: json["user_id"],
// //         userType: userTypeValues.map[json["user_type"]]!,
// //         bookingId: json["booking_id"],
// //         icon: iconValues.map[json["icon"]]!,
// //         rating: json["rating"],
// //         feedback: json["feedback"],
// //         actionBy: json["action_by"],
// //         actionAt: json["action_at"],
// //         actionReason: json["action_reason"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         document: json["document"],
// //         washDocuments: json["wash_documents"] == null
// //             ? []
// //             : List<WashDocument>.from(
// //                 json["wash_documents"]!.map((x) => WashDocument.fromJson(x))),
// //         user: json["user"] == null
// //             ? null
// //             : JobDetailCleaner.fromJson(json["user"]),
// //         media: json["media"] == null
// //             ? []
// //             : List<dynamic>.from(json["media"]!.map((x) => x)),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "user_id": userId,
// //         "user_type": userTypeValues.reverse[userType],
// //         "booking_id": bookingId,
// //         "icon": iconValues.reverse[icon],
// //         "rating": rating,
// //         "feedback": feedback,
// //         "action_by": actionBy,
// //         "action_at": actionAt,
// //         "action_reason": actionReason,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "document": document,
// //         "wash_documents": washDocuments == null
// //             ? []
// //             : List<dynamic>.from(washDocuments!.map((x) => x.toJson())),
// //         "user": user?.toJson(),
// //         "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
// //       };
// // }
// //
// // enum Icon { GOOD, ICON_GOOD }
// //
// // final iconValues = EnumValues({"Good": Icon.GOOD, "good": Icon.ICON_GOOD});
// //
// // class WashDocument {
// //   int? id;
// //   int? rateWashId;
// //   String? images;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? document;
// //
// //   WashDocument({
// //     this.id,
// //     this.rateWashId,
// //     this.images,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.document,
// //   });
// //
// //   factory WashDocument.fromJson(Map<String, dynamic> json) => WashDocument(
// //         id: json["id"],
// //         rateWashId: json["rate_wash_id"],
// //         images: json["images"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         document: json["document"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "rate_wash_id": rateWashId,
// //         "images": images,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "document": document,
// //       };
// // }
// //
// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;
// //
// //   EnumValues(this.map);
// //
// //   Map<T, String> get reverse {
// //     reverseMap = map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }
// //
// // class JobDetailSubscription {
// //   int? id;
// //   String? name;
// //   int? price;
// //   String? duration;
// //   String? status;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? image;
// //   List<Media>? media;
// //   int? carBrandId;
// //
// //   JobDetailSubscription({
// //     this.id,
// //     this.name,
// //     this.price,
// //     this.duration,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.image,
// //     this.media,
// //     this.carBrandId,
// //   });
// //
// //   factory JobDetailSubscription.fromJson(Map<String, dynamic> json) =>
// //       JobDetailSubscription(
// //         id: json["id"],
// //         name: json["name"],
// //         price: json["price"],
// //         duration: json["duration"],
// //         status: json["status"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         image: json["image"],
// //         media: json["media"] == null
// //             ? []
// //             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
// //         carBrandId: json["car_brand_id"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "name": name,
// //         "price": price,
// //         "duration": duration,
// //         "status": status,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "image": image,
// //         "media": media == null
// //             ? []
// //             : List<dynamic>.from(media!.map((x) => x.toJson())),
// //         "car_brand_id": carBrandId,
// //       };
// // }
// // To parse this JSON data, do
// //
// //     final jobDetailResponse = jobDetailResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// JobDetailResponse jobDetailResponseFromJson(String str) =>
//     JobDetailResponse.fromJson(json.decode(str));
//
// String jobDetailResponseToJson(JobDetailResponse data) =>
//     json.encode(data.toJson());
//
// class JobDetailResponse {
//   String? message;
//   int? status;
//   JobDetailData data;
//
//   JobDetailResponse({
//     this.message,
//     this.status,
//     required this.data,
//   });
//
//   factory JobDetailResponse.fromJson(Map<String, dynamic> json) =>
//       JobDetailResponse(
//         message: json["message"],
//         status: json["status"],
//         data: JobDetailData.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "status": status,
//         "data": data?.toJson(),
//       };
// }
//
// class JobDetailData {
//   BookingDetails bookingDetails;
//   List<JobDetailRateWashlist> rateWashlists;
//
//   JobDetailData({
//     required this.bookingDetails,
//     required this.rateWashlists,
//   });
//
//   factory JobDetailData.fromJson(Map<String, dynamic> json) => JobDetailData(
//         bookingDetails: BookingDetails.fromJson(json["booking_details"]),
//         rateWashlists: json["rateWashlists"] == null
//             ? []
//             : List<JobDetailRateWashlist>.from(json["rateWashlists"]!
//                 .map((x) => JobDetailRateWashlist.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "booking_details": bookingDetails?.toJson(),
//         "rateWashlists": List<JobDetailRateWashlist>.from(
//             rateWashlists!.map((x) => x.toJson())),
//       };
// }
//
// class BookingDetails {
//   int? id;
//   String? type;
//   int? userId;
//   int? userVehicleId;
//   int? userAddressId;
//   int? serviceId;
//   int? subscriptionId;
//   String? message;
//   int? assignedBy;
//   DateTime? assignedAt;
//   int? actionBy;
//   DateTime? actionAt;
//   String? actionReason;
//   String? actionMessage;
//   DateTime? fromDate;
//   DateTime? toDate;
//   String? requestTime;
//   int? rating;
//   String? comment;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? actionImageUrl;
//   JobDetailCleaner user;
//   JobDetailUserVehicle userVehicle;
//   JobDetailUserAddress userAddress;
//   JobDetailSubscription subscription;
//   JobDetailTransaction transaction;
//   JobDetailService service;
//   JobDetailCleaner cleaner;
//   List<BookingDetailsMedia> media;
//
//   BookingDetails({
//     this.id,
//     this.type,
//     this.userId,
//     this.userVehicleId,
//     this.userAddressId,
//     this.serviceId,
//     this.subscriptionId,
//     this.message,
//     this.assignedBy,
//     this.assignedAt,
//     this.actionBy,
//     this.actionAt,
//     this.actionReason,
//     this.actionMessage,
//     this.fromDate,
//     this.toDate,
//     this.requestTime,
//     this.rating,
//     this.comment,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.actionImageUrl,
//     required this.user,
//     required this.userVehicle,
//     required this.userAddress,
//     required this.subscription,
//     required this.transaction,
//     required this.service,
//     required this.cleaner,
//     required this.media,
//   });
//
//   factory BookingDetails.fromJson(Map<String, dynamic> json) => BookingDetails(
//         id: json["id"],
//         type: json["type"],
//         userId: json["user_id"],
//         userVehicleId: json["user_vehicle_id"],
//         userAddressId: json["user_address_id"],
//         serviceId: json["service_id"],
//         subscriptionId: json["subscription_id"],
//         message: json["message"],
//         assignedBy: json["assigned_by"],
//         assignedAt: json["assigned_at"] == null
//             ? null
//             : DateTime.parse(json["assigned_at"]),
//         actionBy: json["action_by"],
//         actionAt: json["action_at"] == null
//             ? null
//             : DateTime.parse(json["action_at"]),
//         actionReason: json["action_reason"],
//         actionMessage: json["action_message"],
//         fromDate: json["from_date"] == null
//             ? null
//             : DateTime.parse(json["from_date"]),
//         toDate:
//             json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
//         requestTime: json["request_time"],
//         rating: json["rating"],
//         comment: json["comment"],
//         status: json["status"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         actionImageUrl: json["action_image_url"],
//         user: JobDetailCleaner.fromJson(json["user"]),
//         userVehicle: JobDetailUserVehicle.fromJson(json["user_vehicle"]),
//         userAddress: JobDetailUserAddress.fromJson(json["user_address"]),
//         subscription: JobDetailSubscription.fromJson(json["subscription"]),
//         transaction: JobDetailTransaction.fromJson(json["transaction"]),
//         service: JobDetailService.fromJson(json["service"]),
//         cleaner: JobDetailCleaner.fromJson(json["cleaner"]),
//         media: json["media"] == null
//             ? []
//             : List<BookingDetailsMedia>.from(
//                 json["media"]!.map((x) => BookingDetailsMedia.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "type": type,
//         "user_id": userId,
//         "user_vehicle_id": userVehicleId,
//         "user_address_id": userAddressId,
//         "service_id": serviceId,
//         "subscription_id": subscriptionId,
//         "message": message,
//         "assigned_by": assignedBy,
//         "assigned_at": assignedAt?.toIso8601String(),
//         "action_by": actionBy,
//         "action_at": actionAt?.toIso8601String(),
//         "action_reason": actionReason,
//         "action_message": actionMessage,
//         "from_date":
//             "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
//         "to_date":
//             "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
//         "request_time": requestTime,
//         "rating": rating,
//         "comment": comment,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "action_image_url": actionImageUrl,
//         "user": user?.toJson(),
//         "user_vehicle": userVehicle?.toJson(),
//         "user_address": userAddress?.toJson(),
//         "subscription": subscription?.toJson(),
//         "transaction": transaction?.toJson(),
//         "service": service?.toJson(),
//         "cleaner": cleaner?.toJson(),
//         "media": List<dynamic>.from(media!.map((x) => x.toJson())),
//       };
// }
//
// class JobDetailCleaner {
//   int? id;
//   String? userType;
//   String? status;
//   String? email;
//   String? countryCode;
//   int? mobile;
//   String? latitude;
//   String? longitude;
//   String? address;
//   String? accessToken;
//   int? pushNotification;
//   int? notifyMonthlyPayment;
//   int? accountDetails;
//   String? profileImageUrl;
//   String? documentImageUrl;
//   String? name;
//
//   JobDetailCleaner({
//     this.id,
//     this.userType,
//     this.status,
//     this.email,
//     this.countryCode,
//     this.mobile,
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
//   factory JobDetailCleaner.fromJson(Map<String, dynamic> json) =>
//       JobDetailCleaner(
//         id: json["id"],
//         userType: json["user_type"],
//         status: json["status"],
//         email: json["email"],
//         countryCode: json["country_code"],
//         mobile: json["mobile"],
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
//
// class BookingDetailsMedia {
//   int? id;
//   String? modelType;
//   int? modelId;
//   String? collectionName;
//   String? name;
//   String? fileName;
//   String? mimeType;
//   String? disk;
//   int? size;
//   List<dynamic>? manipulations;
//   List<dynamic>? customProperties;
//   List<dynamic>? responsiveImages;
//   String? orderColumn;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   DateTime? deletedAt;
//
//   BookingDetailsMedia({
//     this.id,
//     this.modelType,
//     this.modelId,
//     this.collectionName,
//     this.name,
//     this.fileName,
//     this.mimeType,
//     this.disk,
//     this.size,
//     this.manipulations,
//     this.customProperties,
//     this.responsiveImages,
//     this.orderColumn,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory BookingDetailsMedia.fromJson(Map<String, dynamic> json) =>
//       BookingDetailsMedia(
//         id: json["id"],
//         modelType: json["model_type"],
//         modelId: json["model_id"],
//         collectionName: json["collection_name"],
//         name: json["name"],
//         fileName: json["file_name"],
//         mimeType: json["mime_type"],
//         disk: json["disk"],
//         size: json["size"],
//         manipulations: json["manipulations"] == null
//             ? []
//             : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
//         customProperties: json["custom_properties"] == null
//             ? []
//             : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
//         responsiveImages: json["responsive_images"] == null
//             ? []
//             : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
//         orderColumn: json["order_column"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"] == null
//             ? null
//             : DateTime.parse(json["deleted_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "model_type": modelType,
//         "model_id": modelId,
//         "collection_name": collectionName,
//         "name": name,
//         "file_name": fileName,
//         "mime_type": mimeType,
//         "disk": disk,
//         "size": size,
//         "manipulations": manipulations == null
//             ? []
//             : List<dynamic>.from(manipulations!.map((x) => x)),
//         "custom_properties": customProperties == null
//             ? []
//             : List<dynamic>.from(customProperties!.map((x) => x)),
//         "responsive_images": responsiveImages == null
//             ? []
//             : List<dynamic>.from(responsiveImages!.map((x) => x)),
//         "order_column": orderColumn,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "deleted_at": deletedAt?.toIso8601String(),
//       };
// }
//
// class JobDetailSubscription {
//   int? id;
//   String? name;
//   int? price;
//   String? duration;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? image;
//   List<SubscriptionMedia>? media;
//   int? carBrandId;
//
//   JobDetailSubscription({
//     this.id,
//     this.name,
//     this.price,
//     this.duration,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.media,
//     this.carBrandId,
//   });
//
//   factory JobDetailSubscription.fromJson(Map<String, dynamic> json) =>
//       JobDetailSubscription(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         duration: json["duration"],
//         status: json["status"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         image: json["image"],
//         media: json["media"] == null
//             ? []
//             : List<SubscriptionMedia>.from(
//                 json["media"]!.map((x) => SubscriptionMedia.fromJson(x))),
//         carBrandId: json["car_brand_id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "duration": duration,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "image": image,
//         "media": media == null
//             ? []
//             : List<dynamic>.from(media!.map((x) => x.toJson())),
//         "car_brand_id": carBrandId,
//       };
// }
//
// class SubscriptionMedia {
//   int? id;
//   String? modelType;
//   int? modelId;
//   String? collectionName;
//   String? name;
//   String? fileName;
//   String? mimeType;
//   String? disk;
//   int? size;
//   List<dynamic>? manipulations;
//   List<dynamic>? customProperties;
//   List<dynamic>? responsiveImages;
//   int? orderColumn;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   DateTime? deletedAt;
//
//   SubscriptionMedia({
//     this.id,
//     this.modelType,
//     this.modelId,
//     this.collectionName,
//     this.name,
//     this.fileName,
//     this.mimeType,
//     this.disk,
//     this.size,
//     this.manipulations,
//     this.customProperties,
//     this.responsiveImages,
//     this.orderColumn,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory SubscriptionMedia.fromJson(Map<String, dynamic> json) =>
//       SubscriptionMedia(
//         id: json["id"],
//         modelType: json["model_type"],
//         modelId: json["model_id"],
//         collectionName: json["collection_name"],
//         name: json["name"],
//         fileName: json["file_name"],
//         mimeType: json["mime_type"],
//         disk: json["disk"],
//         size: json["size"],
//         manipulations: json["manipulations"] == null
//             ? []
//             : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
//         customProperties: json["custom_properties"] == null
//             ? []
//             : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
//         responsiveImages: json["responsive_images"] == null
//             ? []
//             : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
//         orderColumn: json["order_column"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"] == null
//             ? null
//             : DateTime.parse(json["deleted_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "model_type": modelType,
//         "model_id": modelId,
//         "collection_name": collectionName,
//         "name": name,
//         "file_name": fileName,
//         "mime_type": mimeType,
//         "disk": disk,
//         "size": size,
//         "manipulations": manipulations == null
//             ? []
//             : List<dynamic>.from(manipulations!.map((x) => x)),
//         "custom_properties": customProperties == null
//             ? []
//             : List<dynamic>.from(customProperties!.map((x) => x)),
//         "responsive_images": responsiveImages == null
//             ? []
//             : List<dynamic>.from(responsiveImages!.map((x) => x)),
//         "order_column": orderColumn,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "deleted_at": deletedAt?.toIso8601String(),
//       };
// }
//
// class JobDetailTransaction {
//   int? id;
//   int? bookingId;
//   int? userId;
//   int? assignedBy;
//   int? userVehicleId;
//   int? userAddressId;
//   String? paymentType;
//   int? amount;
//   String? transactionStatus;
//   DateTime? paymentDate;
//   String? paymentStatus;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   JobDetailTransaction({
//     this.id,
//     this.bookingId,
//     this.userId,
//     this.assignedBy,
//     this.userVehicleId,
//     this.userAddressId,
//     this.paymentType,
//     this.amount,
//     this.transactionStatus,
//     this.paymentDate,
//     this.paymentStatus,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory JobDetailTransaction.fromJson(Map<String, dynamic> json) =>
//       JobDetailTransaction(
//         id: json["id"],
//         bookingId: json["booking_id"],
//         userId: json["user_id"],
//         assignedBy: json["assigned_by"],
//         userVehicleId: json["user_vehicle_id"],
//         userAddressId: json["user_address_id"],
//         paymentType: json["payment_type"],
//         amount: json["amount"],
//         transactionStatus: json["transaction_status"],
//         paymentDate: json["payment_date"] == null
//             ? null
//             : DateTime.parse(json["payment_date"]),
//         paymentStatus: json["payment_status"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "booking_id": bookingId,
//         "user_id": userId,
//         "assigned_by": assignedBy,
//         "user_vehicle_id": userVehicleId,
//         "user_address_id": userAddressId,
//         "payment_type": paymentType,
//         "amount": amount,
//         "transaction_status": transactionStatus,
//         "payment_date":
//             "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
//         "payment_status": paymentStatus,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }
//
// class JobDetailUserAddress {
//   int? id;
//   int? userId;
//   String? type;
//   String? flatHouseNo;
//   String? areaSector;
//   String? nearby;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   JobDetailUserAddress({
//     this.id,
//     this.userId,
//     this.type,
//     this.flatHouseNo,
//     this.areaSector,
//     this.nearby,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory JobDetailUserAddress.fromJson(Map<String, dynamic> json) =>
//       JobDetailUserAddress(
//         id: json["id"],
//         userId: json["user_id"],
//         type: json["type"],
//         flatHouseNo: json["flat_house_no"],
//         areaSector: json["area_sector"],
//         nearby: json["nearby"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "type": type,
//         "flat_house_no": flatHouseNo,
//         "area_sector": areaSector,
//         "nearby": nearby,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }
//
// class JobDetailUserVehicle {
//   int? id;
//   int? userId;
//   int? vehicleTypeId;
//   int? carBrandId;
//   int? carModelId;
//   String? registrationNo;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   JobDetailBrand brand;
//   JobDetailBrand model;
//   JobDetailBrand vehicle;
//
//   JobDetailUserVehicle({
//     this.id,
//     this.userId,
//     this.vehicleTypeId,
//     this.carBrandId,
//     this.carModelId,
//     this.registrationNo,
//     this.createdAt,
//     this.updatedAt,
//     required this.brand,
//     required this.model,
//     required this.vehicle,
//   });
//
//   factory JobDetailUserVehicle.fromJson(Map<String, dynamic> json) =>
//       JobDetailUserVehicle(
//         id: json["id"],
//         userId: json["user_id"],
//         vehicleTypeId: json["vehicle_type_id"],
//         carBrandId: json["car_brand_id"],
//         carModelId: json["car_model_id"],
//         registrationNo: json["registration_no"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         brand: JobDetailBrand.fromJson(json["brand"]),
//         model: JobDetailBrand.fromJson(json["model"]),
//         vehicle: JobDetailBrand.fromJson(json["vehicle"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "vehicle_type_id": vehicleTypeId,
//         "car_brand_id": carBrandId,
//         "car_model_id": carModelId,
//         "registration_no": registrationNo,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "brand": brand?.toJson(),
//         "model": model?.toJson(),
//         "vehicle": vehicle?.toJson(),
//       };
// }
//
// class JobDetailRateWashlist {
//   int? id;
//   int? userId;
//   String? userType;
//   int? bookingId;
//   String? icon;
//   int? rating;
//   String? feedback;
//   String? actionBy;
//   String? actionAt;
//   String? actionReason;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? documentImage;
//   List<WashDocument> washDocuments;
//   List<Media> media;
//
//   JobDetailRateWashlist({
//     this.id,
//     this.userId,
//     this.userType,
//     this.bookingId,
//     this.icon,
//     this.rating,
//     this.feedback,
//     this.actionBy,
//     this.actionAt,
//     this.actionReason,
//     this.createdAt,
//     this.updatedAt,
//     this.documentImage,
//     required this.washDocuments,
//     required this.media,
//   });
//
//   factory JobDetailRateWashlist.fromJson(Map<String, dynamic> json) =>
//       JobDetailRateWashlist(
//         id: json["id"],
//         userId: json["user_id"],
//         userType: json["user_type"],
//         bookingId: json["booking_id"],
//         icon: json["icon"],
//         rating: json["rating"],
//         feedback: json["feedback"],
//         actionBy: json["action_by"],
//         actionAt: json["action_at"],
//         actionReason: json["action_reason"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         documentImage: json["document_image"],
//         washDocuments:
//             List<WashDocument>.from(json["wash_documents"]!.map((x) => x)),
//         media: json["media"] == null
//             ? []
//             : List<Media>.from(json["media"]!.map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "user_type": userType,
//         "booking_id": bookingId,
//         "icon": icon,
//         "rating": rating,
//         "feedback": feedback,
//         "action_by": actionBy,
//         "action_at": actionAt,
//         "action_reason": actionReason,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "document_image": documentImage,
//         "wash_documents": List<WashDocument>.from(washDocuments!.map((x) => x)),
//         "media": List<Media>.from(media!.map((x) => x)),
//       };
// }
//
// class WashDocument {
//   int? id;
//   int? rateWashId;
//   String? images;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? document;
//
//   WashDocument({
//     this.id,
//     this.rateWashId,
//     this.images,
//     this.createdAt,
//     this.updatedAt,
//     this.document,
//   });
//
//   factory WashDocument.fromJson(Map<String, dynamic> json) => WashDocument(
//         id: json["id"],
//         rateWashId: json["rate_wash_id"],
//         images: json["images"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         document: json["document"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "rate_wash_id": rateWashId,
//         "images": images,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "document": document,
//       };
// }
//
// class JobDetailService {
//   int? id;
//   String? type;
//   String? name;
//   int? carModelId;
//   String? shortDescription;
//   int? discountPrice;
//   int? price;
//   Status? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? image;
//   String? icon;
//   List<Media>? media;
//
//   JobDetailService({
//     this.id,
//     this.type,
//     this.name,
//     this.carModelId,
//     this.shortDescription,
//     this.discountPrice,
//     this.price,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.icon,
//     this.media,
//   });
//
//   factory JobDetailService.fromJson(Map<String, dynamic> json) =>
//       JobDetailService(
//         id: json["id"],
//         type: json["type"],
//         name: json["name"],
//         carModelId: json["car_model_id"],
//         shortDescription: json["short_description"],
//         discountPrice: json["discount_price"],
//         price: json["price"],
//         status: statusValues.map[json["status"]]!,
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         image: json["image"],
//         icon: json["icon"],
//         media: json["media"] == null
//             ? []
//             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "type": type,
//         "name": name,
//         "car_model_id": carModelId,
//         "short_description": shortDescription,
//         "discount_price": discountPrice,
//         "price": price,
//         "status": statusValues.reverse[status],
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "image": image,
//         "icon": icon,
//         "media": media == null
//             ? []
//             : List<Media>.from(media!.map((x) => x.toJson())),
//       };
// }
//
// class JobDetailBrand {
//   int? id;
//   String? name;
//   Status? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? image;
//   List<Media>? media;
//   int? carBrandId;
//
//   JobDetailBrand({
//     this.id,
//     this.name,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.media,
//     this.carBrandId,
//   });
//
//   factory JobDetailBrand.fromJson(Map<String, dynamic> json) => JobDetailBrand(
//         id: json["id"],
//         name: json["name"],
//         status: statusValues.map[json["status"]]!,
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         image: json["image"],
//         media: json["media"] == null
//             ? []
//             : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
//         carBrandId: json["car_brand_id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "status": statusValues.reverse[status],
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "image": image,
//         "media": media == null
//             ? []
//             : List<Media>.from(media!.map((x) => x.toJson())),
//         "car_brand_id": carBrandId,
//       };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
//
// enum Status { ACTIVE }
//
// final statusValues = EnumValues({"active": Status.ACTIVE});
//
// enum UserType { CLEANER, CUSTOMER }
//
// final userTypeValues =
//     EnumValues({"cleaner": UserType.CLEANER, "customer": UserType.CUSTOMER});
//
// class Media {
//   int? id;
//   String? modelType;
//   int? modelId;
//   String? collectionName;
//   String? name;
//   String? fileName;
//   String? mimeType;
//   String? disk;
//   int? size;
//   List<dynamic>? manipulations;
//   List<dynamic>? customProperties;
//   List<dynamic>? responsiveImages;
//   int? orderColumn;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   DateTime? deletedAt;
//
//   Media({
//     this.id,
//     this.modelType,
//     this.modelId,
//     this.collectionName,
//     this.name,
//     this.fileName,
//     this.mimeType,
//     this.disk,
//     this.size,
//     this.manipulations,
//     this.customProperties,
//     this.responsiveImages,
//     this.orderColumn,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//         id: json["id"],
//         modelType: json["model_type"],
//         modelId: json["model_id"],
//         collectionName: json["collection_name"],
//         name: json["name"],
//         fileName: json["file_name"],
//         mimeType: json["mime_type"],
//         disk: json["disk"],
//         size: json["size"],
//         manipulations: json["manipulations"] == null
//             ? []
//             : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
//         customProperties: json["custom_properties"] == null
//             ? []
//             : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
//         responsiveImages: json["responsive_images"] == null
//             ? []
//             : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
//         orderColumn: json["order_column"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"] == null
//             ? null
//             : DateTime.parse(json["deleted_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "model_type": modelType,
//         "model_id": modelId,
//         "collection_name": collectionName,
//         "name": name,
//         "file_name": fileName,
//         "mime_type": mimeType,
//         "disk": disk,
//         "size": size,
//         "manipulations": manipulations == null
//             ? []
//             : List<dynamic>.from(manipulations!.map((x) => x)),
//         "custom_properties": customProperties == null
//             ? []
//             : List<dynamic>.from(customProperties!.map((x) => x)),
//         "responsive_images": responsiveImages == null
//             ? []
//             : List<dynamic>.from(responsiveImages!.map((x) => x)),
//         "order_column": orderColumn,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "deleted_at": deletedAt?.toIso8601String(),
//       };
// }
// To parse this JSON data, do
//
//     final jobDetailResponse = jobDetailResponseFromJson(jsonString);

import 'dart:convert';

JobDetailResponse jobDetailResponseFromJson(String str) =>
    JobDetailResponse.fromJson(json.decode(str));

String jobDetailResponseToJson(JobDetailResponse data) =>
    json.encode(data.toJson());

class JobDetailResponse {
  String? message;
  int? status;
  JobDetailData data;

  JobDetailResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory JobDetailResponse.fromJson(Map<String, dynamic> json) =>
      JobDetailResponse(
        message: json["message"],
        status: json["status"],
        data: JobDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class JobDetailData {
  BookingDetails bookingDetails;
  List<RateWashlist> rateWashlists;

  JobDetailData({
    required this.bookingDetails,
    required this.rateWashlists,
  });

  factory JobDetailData.fromJson(Map<String, dynamic> json) => JobDetailData(
        bookingDetails: BookingDetails.fromJson(json["booking_details"]),
        rateWashlists: json["rateWashlists"] == null
            ? []
            : List<RateWashlist>.from(
                json["rateWashlists"]!.map((x) => RateWashlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "booking_details": bookingDetails?.toJson(),
        "rateWashlists":
            List<dynamic>.from(rateWashlists!.map((x) => x.toJson())),
      };
}

class BookingDetails {
  int? id;
  String? type;
  int? userId;
  int? userVehicleId;
  int? userAddressId;
  int? serviceId;
  int? subscriptionId;
  String? message;
  int? assignedBy;
  DateTime? assignedAt;
  int? actionBy;
  DateTime? actionAt;
  String? actionReason;
  String? actionMessage;
  DateTime? fromDate;
  DateTime? toDate;
  String? requestTime;
  int? rating;
  String? comment;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? actionImageUrl;
  JobDetailCleaner user;
  JobDetailUserVehicle userVehicle;
  JobDetailUserAddress userAddress;
  dynamic subscription;
  JobDetailTransaction transaction;
  dynamic service;
  JobDetailCleaner cleaner;
  List<BookingDetailsMedia> media;

  BookingDetails({
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
    this.actionImageUrl,
    required this.user,
    required this.userVehicle,
    required this.userAddress,
    required this.subscription,
    required this.transaction,
    required this.service,
    required this.cleaner,
    required this.media,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) => BookingDetails(
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
        actionAt: json["action_at"] == null
            ? null
            : DateTime.parse(json["action_at"] ?? DateTime.now()),
        actionReason: json["action_reason"],
        actionMessage: json["action_message"],
        fromDate: json["from_date"] == null
            ? null
            : DateTime.parse(json["from_date"]),
        toDate:
            json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
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
        actionImageUrl: json["action_image_url"],
        user: JobDetailCleaner.fromJson(json["user"]),
        userVehicle: JobDetailUserVehicle.fromJson(json["user_vehicle"]),
        userAddress: JobDetailUserAddress.fromJson(json["user_address"]),
        subscription: json["subscription"],
        transaction: JobDetailTransaction.fromJson(json["transaction"]),
        service: json["service"],
        cleaner: JobDetailCleaner.fromJson(json["cleaner"]),
        media: json["media"] == null
            ? []
            : List<BookingDetailsMedia>.from(
                json["media"]!.map((x) => BookingDetailsMedia.fromJson(x))),
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
        "action_at": actionAt?.toIso8601String(),
        "action_reason": actionReason,
        "action_message": actionMessage,
        "from_date":
            "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "to_date":
            "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "request_time": requestTime,
        "rating": rating,
        "comment": comment,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "action_image_url": actionImageUrl,
        "user": user?.toJson(),
        "user_vehicle": userVehicle?.toJson(),
        "user_address": userAddress?.toJson(),
        "subscription": subscription,
        "transaction": transaction?.toJson(),
        "service": service,
        "cleaner": cleaner?.toJson(),
        "media": List<BookingDetailsMedia>.from(media!.map((x) => x.toJson())),
      };
}

class JobDetailCleaner {
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
  int? pushNotification;
  int? notifyMonthlyPayment;
  int? accountDetails;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  JobDetailCleaner({
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

  factory JobDetailCleaner.fromJson(Map<String, dynamic> json) =>
      JobDetailCleaner(
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

class BookingDetailsMedia {
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
  String? orderColumn;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  BookingDetailsMedia({
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
    this.deletedAt,
  });

  factory BookingDetailsMedia.fromJson(Map<String, dynamic> json) =>
      BookingDetailsMedia(
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
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
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
        "deleted_at": deletedAt?.toIso8601String(),
      };
}

class JobDetailService {
  int? id;
  String? type;
  String? name;
  int? carModelId;
  String? shortDescription;
  int? discountPrice;
  int? price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? icon;
  List<ServiceMedia>? media;

  JobDetailService({
    this.id,
    this.type,
    this.name,
    this.carModelId,
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

  factory JobDetailService.fromJson(Map<String, dynamic> json) =>
      JobDetailService(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        carModelId: json["car_model_id"],
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
            : List<ServiceMedia>.from(
                json["media"]!.map((x) => ServiceMedia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "car_model_id": carModelId,
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

class ServiceMedia {
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
  DateTime? deletedAt;

  ServiceMedia({
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
    this.deletedAt,
  });

  factory ServiceMedia.fromJson(Map<String, dynamic> json) => ServiceMedia(
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
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
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
        "deleted_at": deletedAt?.toIso8601String(),
      };
}

class JobDetailSubscription {
  int? id;
  String? name;
  int? price;
  String? duration;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  List<ServiceMedia>? media;
  int? carBrandId;

  JobDetailSubscription({
    this.id,
    this.name,
    this.price,
    this.duration,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.media,
    this.carBrandId,
  });

  factory JobDetailSubscription.fromJson(Map<String, dynamic> json) =>
      JobDetailSubscription(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        duration: json["duration"],
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
            : List<ServiceMedia>.from(
                json["media"]!.map((x) => ServiceMedia.fromJson(x))),
        carBrandId: json["car_brand_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "duration": duration,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
        "car_brand_id": carBrandId,
      };
}

class JobDetailTransaction {
  int? id;
  int? bookingId;
  int? userId;
  int? assignedBy;
  int? userVehicleId;
  int? userAddressId;
  String? paymentType;
  int? amount;
  String? transactionStatus;
  DateTime? paymentDate;
  String? paymentStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  JobDetailTransaction({
    this.id,
    this.bookingId,
    this.userId,
    this.assignedBy,
    this.userVehicleId,
    this.userAddressId,
    this.paymentType,
    this.amount,
    this.transactionStatus,
    this.paymentDate,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory JobDetailTransaction.fromJson(Map<String, dynamic> json) =>
      JobDetailTransaction(
        id: json["id"],
        bookingId: json["booking_id"],
        userId: json["user_id"],
        assignedBy: json["assigned_by"],
        userVehicleId: json["user_vehicle_id"],
        userAddressId: json["user_address_id"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        transactionStatus: json["transaction_status"],
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
        paymentStatus: json["payment_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "user_id": userId,
        "assigned_by": assignedBy,
        "user_vehicle_id": userVehicleId,
        "user_address_id": userAddressId,
        "payment_type": paymentType,
        "amount": amount,
        "transaction_status": transactionStatus,
        "payment_date":
            "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
        "payment_status": paymentStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class JobDetailUserAddress {
  int? id;
  int? userId;
  String? type;
  String? flatHouseNo;
  String? areaSector;
  String? nearby;
  DateTime? createdAt;
  DateTime? updatedAt;

  JobDetailUserAddress({
    this.id,
    this.userId,
    this.type,
    this.flatHouseNo,
    this.areaSector,
    this.nearby,
    this.createdAt,
    this.updatedAt,
  });

  factory JobDetailUserAddress.fromJson(Map<String, dynamic> json) =>
      JobDetailUserAddress(
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

class JobDetailUserVehicle {
  int? id;
  int? userId;
  int? vehicleTypeId;
  int? carBrandId;
  int? carModelId;
  String? registrationNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  JobDetailSubscription? brand;
  JobDetailSubscription? model;
  JobDetailSubscription? vehicle;

  JobDetailUserVehicle({
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

  factory JobDetailUserVehicle.fromJson(Map<String, dynamic> json) =>
      JobDetailUserVehicle(
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
        brand: json["brand"] == null
            ? null
            : JobDetailSubscription.fromJson(json["brand"]),
        model: json["model"] == null
            ? null
            : JobDetailSubscription.fromJson(json["model"]),
        vehicle: json["vehicle"] == null
            ? null
            : JobDetailSubscription.fromJson(json["vehicle"]),
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

class RateWashlist {
  int? id;
  int? userId;
  String? userType;
  int? bookingId;
  String? icon;
  int? rating;
  String? feedback;
  String? actionBy;
  String? actionAt;
  String? actionReason;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? documentImage;
  List<WashDocument> washDocuments;
  List<ServiceMedia> media;

  RateWashlist({
    this.id,
    this.userId,
    this.userType,
    this.bookingId,
    this.icon,
    this.rating,
    this.feedback,
    this.actionBy,
    this.actionAt,
    this.actionReason,
    this.createdAt,
    this.updatedAt,
    this.documentImage,
    required this.washDocuments,
    required this.media,
  });

  factory RateWashlist.fromJson(Map<String, dynamic> json) => RateWashlist(
        id: json["id"],
        userId: json["user_id"],
        userType: json["user_type"],
        bookingId: json["booking_id"],
        icon: json["icon"],
        rating: json["rating"],
        feedback: json["feedback"],
        actionBy: json["action_by"],
        actionAt: json["action_at"],
        actionReason: json["action_reason"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        documentImage: json["document_image"],
        washDocuments: json["wash_documents"] == null
            ? []
            : List<WashDocument>.from(json["wash_documents"]!.map((x) => x)),
        media: json["media"] == null
            ? []
            : List<ServiceMedia>.from(json["media"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_type": userType,
        "booking_id": bookingId,
        "icon": icon,
        "rating": rating,
        "feedback": feedback,
        "action_by": actionBy,
        "action_at": actionAt,
        "action_reason": actionReason,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "document_image": documentImage,
        "wash_documents": List<WashDocument>.from(washDocuments!.map((x) => x)),
        "media": List<ServiceMedia>.from(media!.map((x) => x)),
      };
}

class WashDocument {
  int? id;
  int? rateWashId;
  String? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? document;

  WashDocument({
    this.id,
    this.rateWashId,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.document,
  });

  factory WashDocument.fromJson(Map<String, dynamic> json) => WashDocument(
        id: json["id"],
        rateWashId: json["rate_wash_id"],
        images: json["images"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        document: json["document"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rate_wash_id": rateWashId,
        "images": images,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "document": document,
      };
}
