// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$selectedStartDateAtom =
      Atom(name: 'HomeStoreBase.selectedStartDate', context: context);

  @override
  DateTime get selectedStartDate {
    _$selectedStartDateAtom.reportRead();
    return super.selectedStartDate;
  }

  @override
  set selectedStartDate(DateTime value) {
    _$selectedStartDateAtom.reportWrite(value, super.selectedStartDate, () {
      super.selectedStartDate = value;
    });
  }

  late final _$selectedEndDateAtom =
      Atom(name: 'HomeStoreBase.selectedEndDate', context: context);

  @override
  DateTime get selectedEndDate {
    _$selectedEndDateAtom.reportRead();
    return super.selectedEndDate;
  }

  @override
  set selectedEndDate(DateTime value) {
    _$selectedEndDateAtom.reportWrite(value, super.selectedEndDate, () {
      super.selectedEndDate = value;
    });
  }

  late final _$serachDateAtom =
      Atom(name: 'HomeStoreBase.serachDate', context: context);

  @override
  DateTime get serachDate {
    _$serachDateAtom.reportRead();
    return super.serachDate;
  }

  @override
  set serachDate(DateTime value) {
    _$serachDateAtom.reportWrite(value, super.serachDate, () {
      super.serachDate = value;
    });
  }

  late final _$fetchNasaApodAPIWithDateParamAsyncAction = AsyncAction(
      'HomeStoreBase.fetchNasaApodAPIWithDateParam',
      context: context);

  @override
  Future<NasaApodModel> fetchNasaApodAPIWithDateParam(dynamic serachDate) {
    return _$fetchNasaApodAPIWithDateParamAsyncAction
        .run(() => super.fetchNasaApodAPIWithDateParam(serachDate));
  }

  late final _$fetchNasaApodAPIWithDateRangeParamAsyncAction = AsyncAction(
      'HomeStoreBase.fetchNasaApodAPIWithDateRangeParam',
      context: context);

  @override
  Future<List<NasaApodModel>> fetchNasaApodAPIWithDateRangeParam(
      dynamic startDate, dynamic endDate) {
    return _$fetchNasaApodAPIWithDateRangeParamAsyncAction.run(
        () => super.fetchNasaApodAPIWithDateRangeParam(startDate, endDate));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  int daysBetweenDiference(DateTime from, DateTime to) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.daysBetweenDiference');
    try {
      return super.daysBetweenDiference(from, to);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedStartDate: ${selectedStartDate},
selectedEndDate: ${selectedEndDate},
serachDate: ${serachDate}
    ''';
  }
}
