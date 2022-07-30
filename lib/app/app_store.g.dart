// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  late final _$listImageFilesAtom =
      Atom(name: 'AppStoreBase.listImageFiles', context: context);

  @override
  List<Uint8List> get listImageFiles {
    _$listImageFilesAtom.reportRead();
    return super.listImageFiles;
  }

  @override
  set listImageFiles(List<Uint8List> value) {
    _$listImageFilesAtom.reportWrite(value, super.listImageFiles, () {
      super.listImageFiles = value;
    });
  }

  late final _$downloadApodDataAsyncAction =
      AsyncAction('AppStoreBase.downloadApodData', context: context);

  @override
  Future<List<NasaApodModel>> downloadApodData() {
    return _$downloadApodDataAsyncAction.run(() => super.downloadApodData());
  }

  late final _$downloadImageFileAsyncAction =
      AsyncAction('AppStoreBase.downloadImageFile', context: context);

  @override
  Future<dynamic> downloadImageFile(List<NasaApodModel> apodListParsed) {
    return _$downloadImageFileAsyncAction
        .run(() => super.downloadImageFile(apodListParsed));
  }

  @override
  String toString() {
    return '''
listImageFiles: ${listImageFiles}
    ''';
  }
}
