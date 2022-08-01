import 'dart:async';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/theme/color_schemes.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_key/api_key.dart';
import 'hive/boxes.dart';
import 'models/nasa_apod_model.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  get apiKey02 => null;

  @observable
  List<Uint8List> listImageFiles = [];

  @observable
  bool? isConnected;

  @action
  checkIfUpdateContetnt() async {
    await checkNetworkStatus();
    if (isConnected == true) {
      final box = Boxes.getNasaApodModel();
      var lastUpdated = box.values.toList().cast<NasaApodModel>();
      if (lastUpdated.isEmpty) {
        updateContent();
      } else if (daysBetweenDiference(DateTime.now(), lastUpdated[0].date!) >
          0) {
        updateContent();
      }
    }
  }

  @action
  int daysBetweenDiference(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @action
  Future<bool> checkNetworkStatus() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      return isConnected = true;
    } else {
      return isConnected = false;
    }
  }

  @action
  Future cleanDatabase() async {
    final box = Boxes.getNasaApodModel();
    box.clear();
  }

  @action
  Future updateContent() async {
    var apodFormatDate = DateFormat("yyyy-MM-dd");
    String parsedStartDate = apodFormatDate.format(DateTime.now());
    String parsedEndDate =
        apodFormatDate.format(DateTime.now().add(const Duration(days: -10)));

    try {
      var response = await Dio().get(
        // ignore: prefer_interpolation_to_compose_strings
        apiKey +
            "&start_date=" +
            parsedEndDate +
            "&end_date=" +
            parsedStartDate,
      );

      final list = response.data as List;
      final apodListParsed =
          list.map((e) => NasaApodModel.fromJson(e)).toList();
      checkNetworkStatus();

      return downloadImageFile(apodListParsed);
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  Future downloadImageFile(List<NasaApodModel> apodListParsed) async {
    for (var i = 0; i < apodListParsed.length; i++) {
      try {
        var response = await Dio().get(
          // ignore: prefer_interpolation_to_compose_strings
          apodListParsed[i].url!,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ),
        );

        listImageFiles.add(response.data);
      } catch (e) {
        throw Exception(e);
      }
      addApodListToHive(
        apodListParsed[i].copyright,
        apodListParsed[i].date,
        apodListParsed[i].explanation,
        apodListParsed[i].mediaType,
        apodListParsed[i].serviceVersion,
        apodListParsed[i].title,
        apodListParsed[i].url,
        listImageFiles[i],
      );
    }
  }

  @action
  Future addApodListToHive(
    String? copyright,
    DateTime? date,
    String? explanation,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
    Uint8List? imageFile,
  ) async {
    if (mediaType == 'image') {
      final apod = NasaApodModel(
        title: title,
        copyright: copyright,
        date: date,
        explanation: explanation,
        mediaType: mediaType,
        serviceVersion: serviceVersion,
        url: url,
        imageFile: imageFile,
      );
      final box = Boxes.getNasaApodModel();
      box.add(apod);
    }
  }

  @observable
  ThemeData currentTheme = MyTheme.light;

  @computed
  bool get isDark => currentTheme.brightness == Brightness.dark;

  @action
  changeTheme() {
    if (isDark) {
      currentTheme = MyTheme.light;
    } else {
      currentTheme = MyTheme.dark;
    }
    saveThemePreferences();
  }

  @action
  saveThemePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  @action
  Future loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    if (prefs.containsKey('isDark') && isDark) {
      currentTheme = MyTheme.dark;
    } else {
      currentTheme = MyTheme.light;
    }
  }
}

class MyTheme {
  static final ThemeData light = _buildLightTheme();
  static final ThemeData dark = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final lightBase = ThemeData(
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      useMaterial3: true,
    );
    return lightBase;
  }

  // * Iniatilizing dark theme
  static ThemeData _buildDarkTheme() {
    final darkBase = ThemeData(
      colorScheme: darkColorScheme,
      brightness: Brightness.dark,
      useMaterial3: true,
    );
    return darkBase;
  }
}
