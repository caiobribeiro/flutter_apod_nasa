// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/info_card_apod_widget.dart';
import '../../../widgets/media_widget.dart';
import '../details_store.dart';

class DetailsPageTablet extends StatefulWidget {
  final String title;
  final DateTime date;
  final String explanation;
  final int dbIndex;
  final String url;
  final String mediaType;
  final bool isConnected;
  const DetailsPageTablet({
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
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPageTablet> {
  final DetailsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: widget.isConnected == true
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Media(
                        midiaType: widget.mediaType,
                        url: widget.url,
                        isConnected: true,
                      ),
                      InformationCardApod(
                        title: widget.title,
                        date: widget.date,
                        explanation: widget.explanation,
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Media(
                          midiaType: widget.mediaType,
                          url: widget.url,
                          dbIndex: widget.dbIndex,
                          isConnected: false,
                        ),
                      ),
                      InformationCardApod(
                        title: widget.title,
                        date: widget.date,
                        explanation: widget.explanation,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
