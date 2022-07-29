# Flutter Apod Nasa

This app shows pictures of NASA's Astronomy Picture of the Day ([APOD]).

## Features

- Today`s Picture Home;
- Search Picture by day;
- Search Picture by period;
- Details of the Picture.

## Packages

- Modularized routes - [Modular];
- Modularized Dependency Injection - [Modular];
- HTTP client -  [DIO]
- State manager -  [MobX]






## Tech

Developed in [Flutter]


## Installation


Install the dependencies and devDependencies and run the project.

```sh
flutter pub get
flutter run
```


## Package 

Packages from The official package repository for Dart and Flutter apps.

- [Modular];
- [Avatar Glow];
- [Smooth Page Indicator];
- [Shared Preferences].

## ⚠️ Running ⚠️
For running on web version is important to enable web rendering, otherwise images won't render.

```sh
flutter run -d chrome --web-renderer html
```
If you will run on an Android Emulator please cheack if the date time of the device isn't time ahead.

## Building 

For production release follow the official Google Guide: [Flutter Build]

⚠️ When building remember to enable web rendering:
```sh
flutter build web --web-renderer html
```




## License

MIT


   [Smooth Page Indicator]: <https://pub.dev/packages/smooth_page_indicator>
   [Shared Preferences]: <https://pub.dev/packages/shared_preferences>
   [Smooth Page Indicator]: <https://pub.dev/packages/smooth_page_indicator>
[Avatar Glow]: <https://pub.dev/packages/avatar_glow>
   [Modular]: <https://modular.flutterando.com.br/docs/intro/>
[Frosted Glass Design]: <https://www.youtube.com/watch?v=_w99D__ABfY>
   [Responsive Dashboard UI]: <https://www.youtube.com/watch?v=9bo1V9STW2c>
   [Flutter Material 3 Demo]: <https://github.com/chayanforyou/flutter_material_3_demo>
[Flutter]: <https://flutter.dev/>
[Flutter Build]: <https://docs.flutter.dev/deployment/android>
[DIO]: <https://pub.dev/packages/dio/>
[APOD]: <https://api.nasa.gov/>
[MobX]: <https://pub.dev/packages/mobx/>
[Youtube Player Flutter]: <https://pub.dev/packages/youtube_player_flutter/>


