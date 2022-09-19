// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../models/nasa_apod_model.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/glass_box_effect.dart';
import '../../../widgets/media_widget.dart';
import '../../../widgets/search_bar_widget.dart';

class HomePageTablet extends StatefulWidget {
  final String title;
  const HomePageTablet({
    Key? key,
    this.title = "Home",
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTablet> {
  final HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<NasaApodModel>(
            future: store.fetchNasaApodAPIWithDateParam(DateTime.now()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Media(
                            midiaType: snapshot.data!.mediaType!,
                            url: snapshot.data!.url!,
                            isConnected: true,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 200),
                      child: GlassBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: Column(
                            children: const [
                              SearchBar(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
