// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
