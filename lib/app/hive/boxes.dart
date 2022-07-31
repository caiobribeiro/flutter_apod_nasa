import 'package:hive/hive.dart';

import '../models/nasa_apod_model.dart';

class Boxes {
  static Box<NasaApodModel> getNasaApodModel() =>
      Hive.box<NasaApodModel>('nasaApodList');
}
