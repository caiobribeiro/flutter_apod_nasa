import 'package:flutter/material.dart';
import 'package:flutter_apod_nasa/app/hive/boxes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/nasa_apod_model.dart';
import '../modules/home/home_store.dart';

class Media extends StatefulWidget {
  final String midiaType;
  final String url;
  final int? dbIndex;
  final bool? isConnected;
  const Media({
    Key? key,
    required this.midiaType,
    required this.url,
    this.dbIndex,
    this.isConnected,
  }) : super(key: key);

  @override
  State<Media> createState() => _MidiaState();
}

final HomeStore store = Modular.get<HomeStore>();

late YoutubePlayerController ytController;

initYoutubeController(mediaType, url) {
  if (mediaType == "video") {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: true,
          enableCaption: false),
    );
  }
}

class _MidiaState extends State<Media> {
  @override
  void initState() {
    initYoutubeController(widget.midiaType, widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.isConnected == true
          ? widget.midiaType == "video"
              ? YoutubePlayer(
                  controller: ytController,
                  showVideoProgressIndicator: true,
                )
              : Image.network(
                  widget.url,
                  fit: BoxFit.cover,
                )
          : ValueListenableBuilder<Box<NasaApodModel>>(
              valueListenable: Boxes.getNasaApodModel().listenable(),
              builder: ((context, box, _) {
                final nasaApodModelList =
                    box.values.toList().cast<NasaApodModel>();
                return Image.memory(
                    nasaApodModelList[widget.dbIndex!].imageFile!);
              }),
            ),
    );
  }
}
