// To parse this JSON data, do
//
//     final aboutUsResponse = aboutUsResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AboutUsResponse aboutUsResponseFromJson(String str) =>
    AboutUsResponse.fromJson(json.decode(str));

String aboutUsResponseToJson(AboutUsResponse data) =>
    json.encode(data.toJson());

class AboutUsResponse {
  String? message;
  int? status;
  AboutUsdata data;

  AboutUsResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) =>
      AboutUsResponse(
        message: json["message"],
        status: json["status"],
        data: AboutUsdata.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data,
      };
}

class AboutUsdata {
  String? slug;
  String? tittle;
  String description;

  AboutUsdata({
    this.slug,
    this.tittle,
    required this.description,
  });

  factory AboutUsdata.fromJson(Map<String, dynamic> json) => AboutUsdata(
        slug: json["slug"],
        tittle: json["tittle"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "tittle": tittle,
        "description": description,
      };
}
