import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/app_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final AppStore appStore = Modular.get<AppStore>();

  String getFirstRouteHistory(String path) {
    var history = Modular.to.navigateHistory;

    return history.first.name;
  }

  @override
  Widget build(BuildContext context) {
    var routes = ModalRoute.of(context)?.settings.name;

    return Observer(builder: (_) {
      return AppBar(
        title: Text(routes!),
        actions: [
          Container(
            margin: const EdgeInsets.all(14),
            child: OutlinedButton(
              onPressed: () {
                Modular.to.navigate('/');
              },
              child: const Text("Home"),
            ),
          ),
          Switch(
            value: appStore.isDark,
            onChanged: (value) {
              appStore.changeTheme();
            },
          )
        ],
      );
    });
  }
}
