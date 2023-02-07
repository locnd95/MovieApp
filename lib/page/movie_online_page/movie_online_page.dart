import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieOnline extends StatefulWidget {
  const MovieOnline({super.key});

  @override
  State<MovieOnline> createState() => _MovieOnlineState();
}

class _MovieOnlineState extends State<MovieOnline> {
  // final data = ModalRoute.of(context)!.settings.arguments as String;

  // final videoURL = "https://www.youtube.com/watch?v=Ru4Jbmh7bcQ";
  // late YoutubePlayerController controller;
  // @override
  // void initState() {
  //   final videoID = YoutubePlayer.convertUrlToId(videoURL);
  //   controller = YoutubePlayerController(
  //       initialVideoId: videoID!,
  //       flags: const YoutubePlayerFlags(autoPlay: true));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as String;
    final videoURL = data;
    YoutubePlayerController controller;
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: true));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          controller: controller,
          // showVideoProgressIndicator: true,
          onReady: () {
            // print("Ready");
          },
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
            ),
            FullScreenButton()
          ],
        ),
      ),
    );
  }
}
