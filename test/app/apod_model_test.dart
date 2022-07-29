import 'package:flutter_apod_nasa/app/models/nasa_apod_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NasaApodModel model;

  test('Apod model variables types are correct', () async {
    final model = NasaApodModel(
        mediaType: '',
        title: '',
        copyright: '',
        date: DateTime.now(),
        url: '',
        explanation: '',
        serviceVersion: '');

    expect(model.mediaType.runtimeType, equals(''.runtimeType));
    expect(model.title.runtimeType, equals(''.runtimeType));
    expect(model.copyright.runtimeType, equals(''.runtimeType));
    expect(model.url.runtimeType, equals(''.runtimeType));
    expect(model.explanation.runtimeType, equals(''.runtimeType));
    expect(model.serviceVersion.runtimeType, equals(''.runtimeType));
    expect(model.date.runtimeType, equals(DateTime.now().runtimeType));
  });
}
