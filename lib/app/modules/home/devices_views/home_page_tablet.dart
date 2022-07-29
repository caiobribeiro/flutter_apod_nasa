// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class HomePageTablet extends StatefulWidget {
  final String title;
  const HomePageTablet({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
