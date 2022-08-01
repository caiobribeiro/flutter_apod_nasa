// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/modules/home/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../responsive/responsive_layout.dart';
import 'devices_views/home_page_desktop.dart';
import 'devices_views/home_page_mobile.dart';
import 'devices_views/home_page_tablet.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: store.checkNetworkStatus(),
      builder: ((context, snapshot) => Observer(builder: (_) {
            if (snapshot.hasData) {
              return const ResponsiveLayout(
                mobileBody: HomePageMobile(),
                tabletBody: HomePageTablet(),
                desktopBody: HomePageDesktop(),
              );
            }
            return const CircularProgressIndicator();
          })),
    );
  }
}
