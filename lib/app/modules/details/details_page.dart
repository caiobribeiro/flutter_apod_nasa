import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import 'devices_views/detailsPage_page_desktop.dart';
import 'devices_views/detailsPage_page_mobile.dart';
import 'devices_views/detailsPage_page_tablet.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final DateTime date;
  final int dbIndex;
  const DetailsPage(
      {Key? key,
      this.title = 'DetailsPagePage',
      required this.date,
      required this.dbIndex})
      : super(key: key);
  @override
  DetailsPagePageState createState() => DetailsPagePageState();
}

class DetailsPagePageState extends State<DetailsPage> {
  final DetailsPage store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ResponsiveLayout(
        mobileBody: DetailsPageMobile(
          date: widget.date,
          dbIndex: widget.dbIndex,
        ),
        tabletBody: DetailsPageTablet(
          date: widget.date,
          dbIndex: widget.dbIndex,
        ),
        desktopBody: DetailsPageDesktop(
          date: widget.date,
          dbIndex: widget.dbIndex,
        ),
      );
    });
  }
}
