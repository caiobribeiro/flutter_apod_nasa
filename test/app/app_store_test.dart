import 'package:flutter_apod_nasa/app/app_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppStore store;

  setUpAll(() {
    store = AppStore();
  });

  test('return a int from date diference', () async {
    var diferenceTestValue = store.daysBetweenDiference(
        DateTime.now(), DateTime.now().add(const Duration(days: -10)));
    expect(diferenceTestValue.runtimeType, equals(int));
  });
}
