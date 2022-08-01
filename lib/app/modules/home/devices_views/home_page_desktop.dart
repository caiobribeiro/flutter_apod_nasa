// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../hive/boxes.dart';
import '../../../models/nasa_apod_model.dart';
import '../../../widgets/apod_card_list_view_widget.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/info_card_apod_widget.dart';
import '../../../widgets/media_widget.dart';
import '../../../widgets/search_bar_widget.dart';

class HomePageDesktop extends StatefulWidget {
  final String title;
  final bool? isConnected;
  const HomePageDesktop({Key? key, this.title = "Home", this.isConnected})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDesktop> {
  final HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            // ONLINE
            store.isConnected == true
                ? FutureBuilder<NasaApodModel>(
                    future: store.fetchNasaApodAPIWithDateParam(DateTime.now()),
                    builder: (context, snapshot) {
                      initYoutubeController(
                          snapshot.data?.mediaType, snapshot.data?.url);
                      if (snapshot.hasData) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: SearchBar(),
                            ),
                            Expanded(
                              flex: 2,
                              child: Media(
                                midiaType: snapshot.data!.mediaType!,
                                url: snapshot.data!.url!,
                                isConnected: true,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InformationCardApod(
                                title: snapshot.data!.title!,
                                date: snapshot.data!.date!,
                                explanation: snapshot.data!.explanation!,
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                // OFFLINE
                : ValueListenableBuilder<Box<NasaApodModel>>(
                    valueListenable: Boxes.getNasaApodModel().listenable(),
                    builder: ((context, box, _) {
                      final nasaApodModelList =
                          box.values.toList().cast<NasaApodModel>();
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ApodCardListViewWidget(isConnected: false),
                          ),
                          Expanded(
                            flex: 2,
                            child:
                                Image.memory(nasaApodModelList[0].imageFile!),
                          ),
                          Expanded(
                            flex: 1,
                            child: InformationCardApod(
                              title: nasaApodModelList[0].title!,
                              date: nasaApodModelList[0].date!,
                              explanation: nasaApodModelList[0].explanation!,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
      ),
    );
  }
}
