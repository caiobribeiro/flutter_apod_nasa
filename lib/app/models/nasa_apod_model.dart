// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:hive/hive.dart';

part 'nasa_apod_model.g.dart';

NasaApodModel nasaApodModelFromJson(String str) =>
    NasaApodModel.fromJson(json.decode(str));

@HiveType(typeId: 0)
class NasaApodModel extends HiveObject {
  NasaApodModel({
    @required this.copyright,
    @required this.date,
    @required this.explanation,
    @required this.mediaType,
    @required this.serviceVersion,
    @required this.title,
    @required this.url,
    this.imageFile,
  });

  @HiveField(0)
  final String? copyright;
  @HiveField(1)
  final DateTime? date;
  @HiveField(2)
  final String? explanation;
  @HiveField(3)
  final String? mediaType;
  @HiveField(4)
  final String? serviceVersion;
  @HiveField(5)
  final String? title;
  @HiveField(6)
  final String? url;
  @HiveField(7)
  final File? imageFile;

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
