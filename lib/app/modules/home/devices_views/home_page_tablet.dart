// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../app_store.dart';
import '../../../hive/boxes.dart';
import '../../../models/nasa_apod_model.dart';

class HomePageTablet extends StatefulWidget {
  final String title;
  final String? connectionStatus;
  const HomePageTablet({Key? key, this.title = "Home", this.connectionStatus})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTablet> {
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
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () => store.updateContent(),
                      child: const Text("Select date"),
                    ),
                    OutlinedButton(
                      onPressed: () => store.cleanDatabase(),
                      child: const Text("limpar"),
                    ),
                  ],
                ),
                ValueListenableBuilder<Box<NasaApodModel>>(
                    valueListenable: Boxes.getNasaApodModel().listenable(),
                    builder: ((context, box, _) {
                      final nasaApodModelList =
                          box.values.toList().cast<NasaApodModel>();
                      return Column(
                        children: [
                          Column(
                            children: [
                              Text("${nasaApodModelList.runtimeType}"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 200,
                                child: ListView.builder(
                                    itemCount: nasaApodModelList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 44,
                                            minHeight: 44,
                                            maxWidth: 64,
                                            maxHeight: 64,
                                          ),
                                          child: Image.memory(
                                              nasaApodModelList[index]
                                                  .imageFile!),
                                        ),
                                        trailing: Text(
                                          "${nasaApodModelList[index].date}",
                                        ),
                                        title: Text(
                                          "${nasaApodModelList[index].title}",
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ],
                      );
                    }))
              ],
            ),
          );
        }));
  }
}
