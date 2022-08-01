import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InformationCardApod extends StatefulWidget {
  final DateTime? date;
  final String? explanation;
  final String? title;

  const InformationCardApod({
    Key? key,
    @required this.date,
    @required this.explanation,
    @required this.title,
  }) : super(key: key);

  @override
  State<InformationCardApod> createState() => _InformationCardApodState();
}

class _InformationCardApodState extends State<InformationCardApod> {
  @override
  Widget build(BuildContext context) {
    var apodFormatDate = DateFormat("dd/MM/yyyy");
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Text(widget.title!),
            Text("${apodFormatDate.format(widget.date!)} "),
            const Divider(),
            Text(widget.explanation!),
          ],
        ),
      ),
    );
  }
}
