// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  Computed<bool>? _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: 'AppStoreBase.isDark'))
      .value;

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

  late final _$isConnectedAtom =
      Atom(name: 'AppStoreBase.isConnected', context: context);

  @override
  bool? get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool? value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$currentThemeAtom =
      Atom(name: 'AppStoreBase.currentTheme', context: context);

  @override
  ThemeData get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  late final _$checkIfUpdateContetntAsyncAction =
      AsyncAction('AppStoreBase.checkIfUpdateContetnt', context: context);

  @override
  Future checkIfUpdateContetnt() {
    return _$checkIfUpdateContetntAsyncAction
        .run(() => super.checkIfUpdateContetnt());
  }

  late final _$checkNetworkStatusAsyncAction =
      AsyncAction('AppStoreBase.checkNetworkStatus', context: context);

  @override
  Future<bool> checkNetworkStatus() {
    return _$checkNetworkStatusAsyncAction
        .run(() => super.checkNetworkStatus());
  }

  late final _$cleanDatabaseAsyncAction =
      AsyncAction('AppStoreBase.cleanDatabase', context: context);

  @override
  Future<dynamic> cleanDatabase() {
    return _$cleanDatabaseAsyncAction.run(() => super.cleanDatabase());
  }

  late final _$updateContentAsyncAction =
      AsyncAction('AppStoreBase.updateContent', context: context);

  @override
  Future<dynamic> updateContent() {
    return _$updateContentAsyncAction.run(() => super.updateContent());
  }

  late final _$downloadImageFileAsyncAction =
      AsyncAction('AppStoreBase.downloadImageFile', context: context);

  @override
  Future<dynamic> downloadImageFile(List<NasaApodModel> apodListParsed) {
    return _$downloadImageFileAsyncAction
        .run(() => super.downloadImageFile(apodListParsed));
  }

  late final _$addApodListToHiveAsyncAction =
      AsyncAction('AppStoreBase.addApodListToHive', context: context);

  @override
  Future<dynamic> addApodListToHive(
      String? copyright,
      DateTime? date,
      String? explanation,
      String? mediaType,
      String? serviceVersion,
      String? title,
      String? url,
      Uint8List? imageFile) {
    return _$addApodListToHiveAsyncAction.run(() => super.addApodListToHive(
        copyright,
        date,
        explanation,
        mediaType,
        serviceVersion,
        title,
        url,
        imageFile));
  }

  late final _$saveThemePreferencesAsyncAction =
      AsyncAction('AppStoreBase.saveThemePreferences', context: context);

  @override
  Future saveThemePreferences() {
    return _$saveThemePreferencesAsyncAction
        .run(() => super.saveThemePreferences());
  }

  late final _$loadThemeAsyncAction =
      AsyncAction('AppStoreBase.loadTheme', context: context);

  @override
  Future<dynamic> loadTheme() {
    return _$loadThemeAsyncAction.run(() => super.loadTheme());
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  int daysBetweenDiference(DateTime from, DateTime to) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.daysBetweenDiference');
    try {
      return super.daysBetweenDiference(from, to);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTheme() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listImageFiles: ${listImageFiles},
isConnected: ${isConnected},
currentTheme: ${currentTheme},
isDark: ${isDark}
    ''';
  }
}
