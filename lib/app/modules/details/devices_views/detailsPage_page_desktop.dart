// ignore_for_file: file_names
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../../home/home_store.dart';
import '../details_store.dart';

class DetailsPageDesktop extends StatefulWidget {
  final String title;
  final DateTime date;
  final int dbIndex;
  const DetailsPageDesktop(
      {Key? key,
      this.title = 'DetailsPageDesktop',
      required this.date,
      required this.dbIndex})
      : super(key: key);
  @override
  DetailsPagePageState createState() => DetailsPagePageState();
}

class DetailsPagePageState extends State<DetailsPageDesktop> {
  final DetailsStore store = Modular.get();
  final HomeStore homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
