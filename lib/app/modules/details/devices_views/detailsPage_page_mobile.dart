// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../details_store.dart';

class DetailsPageMobile extends StatefulWidget {
  final String title;
  final DateTime date;
  const DetailsPageMobile({
    Key? key,
    this.title = 'DetailsPageMobile',
    required this.date,
  }) : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPageMobile> {
  final DetailsStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
