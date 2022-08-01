// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app_store.dart';

final _borderRadius = BorderRadius.circular(20);

class GlassBox extends StatelessWidget {
  final height;
  final width;
  final child;

  const GlassBox({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppStore store = Modular.get<AppStore>();
    return ClipRRect(
      borderRadius: _borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: store.currentTheme.backgroundColor.withOpacity(0)),
                  borderRadius: _borderRadius,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        store.currentTheme.scaffoldBackgroundColor
                            .withOpacity(0.5),
                        store.currentTheme.scaffoldBackgroundColor
                            .withOpacity(0.1)
                      ])),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
