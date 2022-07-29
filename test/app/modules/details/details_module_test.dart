import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apod_nasa/app/modules/details/details_module.dart';

void main() {
  setUpAll(() {
    initModule(DetailsModule());
  });
}
