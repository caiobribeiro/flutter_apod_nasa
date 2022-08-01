// ignore_for_file: file_names
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/glass_box_effect.dart';
import '../../../widgets/info_card_apod_widget.dart';
import '../../../widgets/media_widget.dart';
import '../../home/home_store.dart';
import '../details_store.dart';

class DetailsPageDesktop extends StatefulWidget {
  final String title;
  final DateTime date;
  final String explanation;
  final int dbIndex;
  final String url;
  final String mediaType;
  final bool isConnected;
  const DetailsPageDesktop({
    Key? key,
    required this.title,
    required this.date,
    required this.dbIndex,
    required this.explanation,
    required this.url,
    required this.mediaType,
    required this.isConnected,
  }) : super(key: key);
  @override
  DetailsPagePageState createState() => DetailsPagePageState();
}

class DetailsPagePageState extends State<DetailsPageDesktop> {
  final DetailsStore store = Modular.get();
  final HomeStore homeStore = Modular.get<HomeStore>();

  late YoutubePlayerController ytController;

  initYoutubeController(mediaType, url) {
    if (mediaType == "video" && mediaType != null) {
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

  @override
  void initState() {
    initYoutubeController(widget.mediaType, widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: widget.isConnected == true
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Media(
                          midiaType: widget.mediaType,
                          url: widget.url,
                          isConnected: true,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GlassBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: InformationCardApod(
                          title: widget.title,
                          date: widget.date,
                          explanation: widget.explanation,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Media(
                          midiaType: widget.mediaType,
                          url: widget.url,
                          dbIndex: widget.dbIndex,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GlassBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: InformationCardApod(
                          title: widget.title,
                          date: widget.date,
                          explanation: widget.explanation,
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
