import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../modules/home/home_store.dart';
import 'apod_card_list_view_widget.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final HomeStore store = Modular.get<HomeStore>();
  var defaultPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 16);
  var apodDateShowFormat = DateFormat("dd/MM/yyyy");

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      store.selectedStartDate = picked.start;
      store.selectedEndDate = picked.end;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          const Text("Browse media by date:"),
          Padding(
            padding: defaultPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_month_rounded),
                  label: const Text("Select date"),
                ),
              ],
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: Observer(builder: (_) {
              return Column(
                children: [
                  const Text("Range search:"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          "Start: ${apodDateShowFormat.format(store.selectedStartDate)}"),
                      Text(
                          "End: ${apodDateShowFormat.format(store.selectedEndDate)}"),
                    ],
                  ),
                ],
              );
            }),
          ),
          ApodCardListViewWidget(),
        ],
      ),
    );
  }
}
