// To parse this JSON data, do
//
//     final unreadNotificationResponse = unreadNotificationResponseFromJson(jsonString);

import 'dart:convert';

UnreadNotificationResponse unreadNotificationResponseFromJson(String str) =>
    UnreadNotificationResponse.fromJson(json.decode(str));

class UnreadNotificationResponse {
  UnreadNotificationResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final int? status;
  final List<UnreadData> data;

  factory UnreadNotificationResponse.fromJson(Map<String, dynamic> json) {
    return UnreadNotificationResponse(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<UnreadData>.from(
              json["data"]!.map((x) => UnreadData.fromJson(x))),
    );
  }
}

class UnreadData {
  UnreadData({
    required this.message,
  });

  final Message message;

  factory UnreadData.fromJson(Map<String, dynamic> json) {
    return UnreadData(
      message: Message.fromJson(json["message"]),
    );
  }
}

class Message {
  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.icon,
    required this.type,
    required this.title,
    required this.content,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? senderId;
  final int? receiverId;
  final String? icon;
  final String? type;
  final String? title;
  final String content;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["id"] ?? 0,
      senderId: json["sender_id"] ?? 0,
      receiverId: json["receiver_id"] ?? 0,
      icon: json["icon"] ?? "",
      type: json["type"] ?? "",
      title: json["title"] ?? "",
      content: json["content"] ?? "",
      status: json["status"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
