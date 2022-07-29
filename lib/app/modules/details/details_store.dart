// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../api_key/api_key.dart';
import '../../models/nasa_apod_model.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {
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
}
