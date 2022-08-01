// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/hive/boxes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../models/nasa_apod_model.dart';
import '../modules/home/home_store.dart';

class ApodCardListViewWidget extends StatefulWidget {
  bool? isConnected;
  ApodCardListViewWidget({Key? key, this.isConnected}) : super(key: key);

  @override
  State<ApodCardListViewWidget> createState() => _ApodCardListViewWidgetState();
}

class _ApodCardListViewWidgetState extends State<ApodCardListViewWidget> {
  final HomeStore store = Modular.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    var apodFormatDate = DateFormat("dd/MM/yyyy");
    return Observer(
      builder: (_) {
        return store.isConnected == true
            ? FutureBuilder<List<NasaApodModel>>(
                future: store.fetchNasaApodAPIWithDateRangeParam(
                    store.selectedStartDate, store.selectedEndDate),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(snapshot.data![index].title!),
                                  subtitle: Text(apodFormatDate
                                      .format(snapshot.data![index].date!)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    snapshot.data![index].explanation!,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                snapshot.data![index].mediaType == "image"
                                    ? Image.network(snapshot.data![index].url!)
                                    : const Text("image unavailable"),
                                ButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        Modular.to
                                            .pushNamed('/details/', arguments: {
                                          'title': snapshot.data![index].title,
                                          'date': snapshot.data![index].date,
                                          'explanation':
                                              snapshot.data![index].explanation,
                                          'url': snapshot.data![index].url,
                                          'dbIndex': index,
                                          'mediaType':
                                              snapshot.data![index].mediaType,
                                          'isConnected': true,
                                        });
                                      },
                                      child: const Text("Details"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              )
            : ValueListenableBuilder<Box<NasaApodModel>>(
                valueListenable: Boxes.getNasaApodModel().listenable(),
                builder: ((context, box, _) {
                  final nasaApodModelList =
                      box.values.toList().cast<NasaApodModel>();
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const Center(
                          child: Text("Downloaded Images"),
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          controller: ScrollController(),
                          itemCount: nasaApodModelList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title:
                                          Text(nasaApodModelList[index].title!),
                                      subtitle: Text(apodFormatDate.format(
                                          nasaApodModelList[index].date!)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        nasaApodModelList[index].explanation!,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    nasaApodModelList[index].mediaType ==
                                            "image"
                                        ? Image.memory(
                                            nasaApodModelList[index].imageFile!)
                                        : const Text("image unavailable"),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Modular.to.pushNamed('/details/',
                                                arguments: {
                                                  'title':
                                                      nasaApodModelList[index]
                                                          .title,
                                                  'date':
                                                      nasaApodModelList[index]
                                                          .date,
                                                  'explanation':
                                                      nasaApodModelList[index]
                                                          .explanation,
                                                  'url':
                                                      nasaApodModelList[index]
                                                          .url,
                                                  'dbIndex': index,
                                                  'mediaType':
                                                      nasaApodModelList[index]
                                                          .mediaType,
                                                  'isConnected': false,
                                                });
                                          },
                                          child: const Text("Details"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );

                  //  Column(
                  //   children: [
                  //     SizedBox(
                  //       height: MediaQuery.of(context).size.height - 200,
                  //       child: ListView.builder(
                  //           itemCount: nasaApodModelList.length,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return ListTile(
                  //               leading: ConstrainedBox(
                  //                 constraints: const BoxConstraints(
                  //                   minWidth: 44,
                  //                   minHeight: 44,
                  //                   maxWidth: 64,
                  //                   maxHeight: 64,
                  //                 ),
                  // child: Image.memory(
                  //     nasaApodModelList[index].imageFile!),
                  //               ),
                  //               trailing: Text(
                  //                 apodFormatDate.format(
                  //                     nasaApodModelList[index].date!),
                  //               ),
                  //               title: Text(
                  //                 "${nasaApodModelList[index].title}",
                  //               ),
                  //             );
                  //           }),
                  //     ),
                  //   ],
                  // );
                }),
              );
      },
    );
  }
}
