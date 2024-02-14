// To parse this JSON data, do
//
//     final jobStatusDoneResponse = jobStatusDoneResponseFromJson(jsonString);

import 'dart:convert';

JobStatusDoneResponse jobStatusDoneResponseFromJson(String str) =>
    JobStatusDoneResponse.fromJson(json.decode(str));

String jobStatusDoneResponseToJson(JobStatusDoneResponse data) =>
    json.encode(data.toJson());

class JobStatusDoneResponse {
  String? message;
  int? status;
  JobStatusDoneData data;

  JobStatusDoneResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory JobStatusDoneResponse.fromJson(Map<String, dynamic> json) =>
      JobStatusDoneResponse(
        message: json["message"],
        status: json["status"],
        data: JobStatusDoneData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class JobStatusDoneData {
  int? id;
  String? type;
  int? userId;
  int? userVehicleId;
  int? userAddressId;
  dynamic serviceId;
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
  List<Media>? media;

  JobStatusDoneData({
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
    this.media,
  });

  factory JobStatusDoneData.fromJson(Map<String, dynamic> json) =>
      JobStatusDoneData(
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
            : DateTime.parse(json["action_at"]),
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
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
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
  dynamic mimeType;
  String? disk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  List<dynamic>? responsiveImages;
  dynamic orderColumn;
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
