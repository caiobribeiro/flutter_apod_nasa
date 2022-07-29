// ignore_for_file: depend_on_referenced_packages

import 'package:meta/meta.dart';
import 'dart:convert';

NasaApodModel nasaApodModelFromJson(String str) =>
    NasaApodModel.fromJson(json.decode(str));

class NasaApodModel {
  NasaApodModel({
    @required this.copyright,
    @required this.date,
    @required this.explanation,
    @required this.mediaType,
    @required this.serviceVersion,
    @required this.title,
    @required this.url,
  });

  final String? copyright;
  final DateTime? date;
  final String? explanation;
  final String? mediaType;
  final String? serviceVersion;
  final String? title;
  final String? url;

  factory NasaApodModel.fromJson(Map<String, dynamic> json) => NasaApodModel(
        copyright: json["copyright"],
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
      );
}
