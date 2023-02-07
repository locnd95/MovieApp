import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/page/home_screeen_page/home_screeen_page.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AllVideosContents extends StatefulWidget {
  const AllVideosContents({super.key});

  @override
  State<AllVideosContents> createState() => _AllVideosContentsState();
}

class _AllVideosContentsState extends State<AllVideosContents> {
  ScrollController controller = ScrollController();

  // @override
  // void initState() {
  //   controller.jumpTo(400.);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as List<ListVideosContent>;
    // final videoURL = data[0].linkVideo;
    // YoutubePlayerController controller;
    // final videoID = YoutubePlayer.convertUrlToId(videoURL);
    // controller = YoutubePlayerController(
    //     initialVideoId: videoID!,
    //     flags: const YoutubePlayerFlags(autoPlay: true));
    // controller.jumpTo(data.length * 10);
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 0));
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.jumpTo(100.s);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              size: 30.s,
              color: CommondColor.blackCommond,
            ),
          ),
          title: Text("Videos",
              style: CommondText.textSize18W600White
                  .copyWith(color: CommondColor.blackCommond)),
          actions: [
            Icon(
              Icons.reply,
              size: 30.s,
              color: CommondColor.blackCommond,
            ),
          ],
        ),
        body: ListView.builder(
          controller: controller,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) => Column(children: [
            Stack(
              children: [
                YoutubePlayer(
                  controller: YoutubePlayerController(
                      initialVideoId:
                          YoutubePlayer.convertUrlToId(data[index].linkVideo) ??
                              "",
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                      )),
                  onReady: () {},
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(
                      isExpanded: true,
                    ),
                    FullScreenButton()
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.s, vertical: 10.s),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: const AssetImage(
                            'assets/images2/image_cgv_merry_christmas.jpg'),
                        radius: 20.s,
                      ),
                      Gap(15.s),
                      Expanded(
                        child: Text(
                          data[index].contentVideo,
                          style: CommondText.textSize18W600White
                              .copyWith(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.s),
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                data[index].contentVideo,
                style: CommondText.textSize18W600White.copyWith(
                    color: CommondColor.blackCommond,
                    fontWeight: FontWeight.w400),
              ),
            )
          ]),
          itemCount: data.length,
        ),
      ),
    );
  }
}
