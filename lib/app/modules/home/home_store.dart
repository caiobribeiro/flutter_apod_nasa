// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../api_key/api_key.dart';
import '../../models/nasa_apod_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  DateTime selectedStartDate = DateTime.now();

  @observable
  DateTime selectedEndDate = DateTime.now();

  @observable
  DateTime serachDate = DateTime.now();

  @action
  Future<NasaApodModel> fetchNasaApodAPIWithDateParam(serachDate) async {
    var apodFormatDate = DateFormat("yyyy-MM-dd");
    String parsedDate = apodFormatDate.format(serachDate);

    try {
      var response = await Dio().get(
        apiKey + "&date=" + parsedDate,
      );

      return NasaApodModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  Future<List<NasaApodModel>> fetchNasaApodAPIWithDateRangeParam(
      startDate, endDate) async {
    var apodFormatDate = DateFormat("yyyy-MM-dd");
    String startDateParsed = apodFormatDate.format(startDate);
    String endDateParsed = apodFormatDate.format(endDate);

    try {
      var response = await Dio().get(
        apiKey +
            "&start_date=" +
            startDateParsed +
            "&end_date=" +
            endDateParsed,
      );

      final list = response.data as List;
      final apodListParsed =
          list.map((e) => NasaApodModel.fromJson(e)).toList();
      return apodListParsed;
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  int daysBetweenDiference(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @observable
  bool? isConnected;

  @action
  Future<bool> checkNetworkStatus() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      isConnected = true;
      return isConnected = true;
    } else {
      isConnected = false;
      return isConnected = false;
    }
  }
}
