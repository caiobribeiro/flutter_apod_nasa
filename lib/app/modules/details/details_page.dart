import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import 'details_store.dart';
import 'devices_views/detailsPage_page_desktop.dart';
import 'devices_views/detailsPage_page_mobile.dart';
import 'devices_views/detailsPage_page_tablet.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final DateTime date;
  final String explanation;
  final int dbIndex;
  final String url;
  final String mediaType;
  final bool isConnected;
  const DetailsPage({
    Key? key,
    required this.title,
    required this.date,
    required this.dbIndex,
    required this.explanation,
    required this.url,
    required this.mediaType,
    required this.isConnected,
  }) : super(key: key);
  @override
  DetailsPagePageState createState() => DetailsPagePageState();
}

class DetailsPagePageState extends State<DetailsPage> {
  final DetailsStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ResponsiveLayout(
        mobileBody: DetailsPageMobile(
          title: widget.title,
          explanation: widget.explanation,
          url: widget.url,
          date: widget.date,
          dbIndex: widget.dbIndex,
          mediaType: widget.mediaType,
          isConnected: widget.isConnected,
        ),
        tabletBody: DetailsPageTablet(
          title: widget.title,
          explanation: widget.explanation,
          url: widget.url,
          date: widget.date,
          dbIndex: widget.dbIndex,
          mediaType: widget.mediaType,
          isConnected: widget.isConnected,
        ),
        desktopBody: DetailsPageDesktop(
          title: widget.title,
          explanation: widget.explanation,
          url: widget.url,
          date: widget.date,
          dbIndex: widget.dbIndex,
          mediaType: widget.mediaType,
          isConnected: widget.isConnected,
        ),
      );
    });
  }
}
