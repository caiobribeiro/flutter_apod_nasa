import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apod_nasa/app/modules/details/details_store.dart';
 
void main() {
  late DetailsStore store;

  setUpAll(() {
    store = DetailsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}