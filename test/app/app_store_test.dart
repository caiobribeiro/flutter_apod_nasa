import 'package:flutter_apod_nasa/app/app_store.dart';
import 'package:flutter_apod_nasa/app/models/nasa_apod_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppStore store;

  setUpAll(() {
    store = AppStore();
  });

  test('Fetch data from Apod API by range is returning a NasaApodModel',
      () async {
    var apodFetched = await store.downloadApodData();

    expect(apodFetched.runtimeType, equals(List<NasaApodModel>));
  });

  test('Is saving NasaApodModel instance on hive box', () async {
    // await store.addApodList("", DateTime.now(), "", "", "", "", "", );
  });
}
