import 'dart:typed_data';

import 'package:flutter_apod_nasa/app/models/nasa_apod_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Apod model variables types are correct', () async {
    final model = NasaApodModel(
      mediaType: '',
      title: '',
      copyright: '',
      date: DateTime.now(),
      url: '',
      explanation: '',
      serviceVersion: '',
      imageFile: Uint8List(10),
    );

    expect(model.mediaType.runtimeType, equals(''.runtimeType));
    expect(model.title.runtimeType, equals(''.runtimeType));
    expect(model.copyright.runtimeType, equals(''.runtimeType));
    expect(model.url.runtimeType, equals(''.runtimeType));
    expect(model.explanation.runtimeType, equals(''.runtimeType));
    expect(model.serviceVersion.runtimeType, equals(''.runtimeType));
    expect(model.date.runtimeType, equals(DateTime.now().runtimeType));
    expect(model.imageFile.runtimeType, equals(Uint8List(128).runtimeType));
  });
}
