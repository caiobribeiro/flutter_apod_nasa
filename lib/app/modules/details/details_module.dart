import 'package:flutter_apod_nasa/app/modules/details/details_page.dart';
import 'package:flutter_apod_nasa/app/modules/details/details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_store.dart';

class DetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailsStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => DetailsPage(date: args.data['date'] ?? "")),
  ];
}
