// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStore on _DetailsStoreBase, Store {
  late final _$serachDateAtom =
      Atom(name: '_DetailsStoreBase.serachDate', context: context);

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
      '_DetailsStoreBase.fetchNasaApodAPIWithDateParam',
      context: context);

  @override
  Future<NasaApodModel> fetchNasaApodAPIWithDateParam(dynamic serachDate) {
    return _$fetchNasaApodAPIWithDateParamAsyncAction
        .run(() => super.fetchNasaApodAPIWithDateParam(serachDate));
  }

  @override
  String toString() {
    return '''
serachDate: ${serachDate}
    ''';
  }
}
