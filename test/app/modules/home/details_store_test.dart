import 'package:flutter_apod_nasa/app/models/nasa_apod_model.dart';
import 'package:flutter_apod_nasa/app/modules/home/home_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomeStore store;

  setUpAll(() {
    store = HomeStore();
  });

  test('Is device connected to the internet', () async {
    var test = await store.checkNetworkStatus();
    expect(store.checkNetworkStatus().runtimeType, equals(test));
  });

  test('Fetch data from Apod API by day is returning a NasaApodModel',
      () async {
    expect(store.serachDate.runtimeType, equals(DateTime.now().runtimeType));
    store.fetchNasaApodAPIWithDateParam(DateTime.now());
    var apodFetched = await store.fetchNasaApodAPIWithDateParam(DateTime.now());
    expect(apodFetched.runtimeType, equals(NasaApodModel));
  });

  test('Fetch data from Apod API by range is returning a NasaApodModel',
      () async {
    expect(store.selectedStartDate.runtimeType,
        equals(DateTime.now().runtimeType));
    expect(
        store.selectedEndDate.runtimeType, equals(DateTime.now().runtimeType));
    var now = DateTime.now();

    var apodFetched = await store.fetchNasaApodAPIWithDateRangeParam(
        DateTime(now.year, now.month, now.day - 1), now);

    expect(apodFetched.runtimeType, equals(List<NasaApodModel>));
  });
}
