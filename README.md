# Flutter Apod Nasa

This app shows pictures of NASA's Astronomy Picture of the Day ([APOD]).


## Tech

Developed in [Flutter]

## Features

- Today`s Picture Home;
- Auto download of 10 days;
- Offline mode;
- Search Picture by period;
- Dark theme, color palette powerd by [Material Theme Builder];
- Details of the Picture.

### Preview

| Desktop | Mobile | Tablet |
| ------ | ------ | ------ |
| ![desktop_walkthrough](readme_assets\flutter_apod_nasa_VKt8tpMrNK.gif) | ![mobile_walkthrough](readme_assets\flutter_apod_nasa_coXdL8tR7b.gif) | ![tablet_walkthrough](readme_assets\flutter_apod_nasa_EF7mOtLAhv.gif) |

## Packages
Packages from The official package repository for Dart and Flutter apps.

- Modularized routes and Modularized Dependency Injection - [Modular];
- HTTP client -  [DIO];
- State manager - [MobX];
- Database - [Hive];
- Get connection status - [Internet Connection Checker];
- Youtube player for video from [APOD] - [Youtube Player Flutter];
- Save theme type - [Shared Preferences];
- [Internet Connection Checker].


## API Key
Go to [API Nasa] and click Generate API Key.

Update the api_key.dart with the new generated key.

Path: lib\app\api_key\api_key.dart


```sh
const String apiKey =
    'https://api.nasa.gov/planetary/apod?api_key=api_key_from_apod_nasa';
```





## Installation


Install the dependencies and devDependencies and run the project.

```sh
flutter pub get
flutter run
```




## ⚠️ Running ⚠️

For running on web version is important to fallow 2 steps:

1 - Anable Hive to run on web.

https://stackoverflow.com/questions/65630743/how-to-solve-flutter-web-api-cors-error-only-with-dart-code/66879350#66879350


2 - Enable web rendering, otherwise images won't render.

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
[Hive]: <https://pub.dev/packages/hive/>
[Internet Connection Checker]: <https://pub.dev/packages/internet_connection_checker/>
[Youtube Player Flutter]: <https://pub.dev/packages/youtube_player_flutter/>
[Material Theme Builder]: <https://m3.material.io/theme-builder#/dynamic/>
[API Nasa]: <https://api.nasa.gov//>


