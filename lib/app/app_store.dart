import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

import 'api_key/api_key.dart';
import 'hive/boxes.dart';
import 'models/nasa_apod_model.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  get apiKey02 => null;

  @observable
  List<Uint8List> listImageFiles = [];

  @action
  Future<List<NasaApodModel>> downloadApodData() async {
    var apodFormatDate = DateFormat("yyyy-MM-dd");
    String parsedStartDate = apodFormatDate.format(DateTime.now());
    String parsedEndDate =
        apodFormatDate.format(DateTime.now().add(const Duration(days: -30)));
    final appStorage = await getApplicationDocumentsDirectory();

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

      downloadImageFile(apodListParsed);

      // for (var i = 0; i < apodListParsed.length; i++) {
      //   // final file = File('${appStorage.path}/$apodListParsed[i].date');
      //   addApodList(
      //     apodListParsed[i].copyright,
      //     apodListParsed[i].date,
      //     apodListParsed[i].explanation,
      //     apodListParsed[i].mediaType,
      //     apodListParsed[i].serviceVersion,
      //     apodListParsed[i].title,
      //     apodListParsed[i].url,
      //     // file,
      //   );
      // }
      return apodListParsed;
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  Future downloadImageFile(List<NasaApodModel> apodListParsed) async {
    final appStorage = await getApplicationDocumentsDirectory();
    for (var i = 0; i < apodListParsed.length; i++) {
      final file = File('${appStorage.path}/$apodListParsed[i].url');
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
        print(response.data.runtimeType);
        print(response.data);
        // final raf = file.openSync(mode: FileMode.write);
        // raf.writeByteSync(response.data);
        listImageFiles.add(response.data);
        // await raf.close();
      } catch (e) {
        throw Exception(e);
      }
    }
  }
}

@action
Future addApodList(
  String? copyright,
  DateTime? date,
  String? explanation,
  String? mediaType,
  String? serviceVersion,
  String? title,
  String? url,
  // File? imageFile,
) async {
  final apod = NasaApodModel(
    title: title,
    copyright: copyright,
    date: date,
    explanation: explanation,
    mediaType: mediaType,
    serviceVersion: serviceVersion,
    url: url,
  );

  final box = Boxes.getNasaApodModel();
  box.add(apod);
}
