// ignore_for_file: unused_import, library_private_types_in_public_api, missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePageMobile extends StatefulWidget {
  final String title;
  const HomePageMobile({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMobile> {
  AppBar appBar = AppBar(
    title: const Text("AppBar"),
  );
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("aqui"),
    );
  }
}
