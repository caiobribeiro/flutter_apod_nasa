// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../details_store.dart';

class DetailsPageTablet extends StatefulWidget {
  final String title;
  final DateTime date;
  final int dbIndex;
  const DetailsPageTablet(
      {Key? key,
      this.title = 'DetailsPageTablet',
      required this.date,
      required this.dbIndex})
      : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPageTablet> {
  final DetailsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
