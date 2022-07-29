import 'package:flutter_apod_nasa/app/models/nasa_apod_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apod_nasa/app/modules/details/details_store.dart';

void main() {
  late DetailsStore store;

  setUpAll(() {
    store = DetailsStore();
  });

  test('Fetch data from Apod API by day is returning a NasaApodModel',
      () async {
    expect(store.serachDate.runtimeType, equals(DateTime.now().runtimeType));
    store.fetchNasaApodAPIWithDateParam(DateTime.now());
    var apod_fetched =
        await store.fetchNasaApodAPIWithDateParam(DateTime.now());
    expect(apod_fetched.runtimeType, equals(NasaApodModel));
  });
}
