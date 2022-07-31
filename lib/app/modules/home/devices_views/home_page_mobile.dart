// ignore_for_file: unused_import, library_private_types_in_public_api, missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/app_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../hive/boxes.dart';
import '../../../models/nasa_apod_model.dart';

class HomePageMobile extends StatefulWidget {
  final String title;
  const HomePageMobile({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMobile> {
  final AppStore store = Modular.get<AppStore>();
  AppBar appBar = AppBar(
    title: const Text("AppBar"),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Observer(builder: (_) {
          return Center(
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () => store.downloadApodData(),
                  child: const Text("Select date"),
                ),
                ValueListenableBuilder<Box<NasaApodModel>>(
                    valueListenable: Boxes.getNasaApodModel().listenable(),
                    builder: ((context, box, _) {
                      final nasaApodModelList =
                          box.values.toList().cast<NasaApodModel>();
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        child: ListView.builder(
                            itemCount: nasaApodModelList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: const Icon(Icons.list),
                                trailing: Text(
                                  "${nasaApodModelList[index].date}",
                                ),
                                title: Text(
                                  "${nasaApodModelList[index].title}",
                                ),
                              );
                            }),
                      );
                    }))
              ],
            ),
          );
        }));
  }
}
