import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_button_show_all_contents.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/network/models/movie_data_api.dart';
import 'package:movie_app/page/home_screeen_page/home_screeen_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class Movie extends StatefulWidget {
  const Movie({
    super.key,
  });

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  void initState() {
    super.initState();
  }

  String dateMovie = "";
  String timeMovie = "";
  bool isLike = false;
  int like = 6438;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as DataItems;
    String start = data.item.startTime ?? "2022-12-18T18:30:42.812Z";
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(start);
    dateMovie = "${parseDate.day}/${parseDate.month}/${parseDate.year}";
    print(dateMovie.toString());

    DateTime startMovie = DateTime.parse(data.item.startTime ?? "");
    DateTime endMovie = DateTime.parse(data.item.endTime ?? "");
    Duration duration = startMovie.difference(endMovie).abs();
    print(duration.toString());
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    timeMovie = '${hours * 60 + minutes} phút ';

    return SafeArea(
        child: Scaffold(
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
        title: Text("Phim",
            style: CommondText.textSize18W600White
                .copyWith(color: CommondColor.blackCommond)),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.reply,
              size: 30.s,
              color: CommondColor.blackCommond,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          // _buildBackgroundTrailerMovie(context, data),
                          _buildBackgroundTrailerMovie(context, data.item),
                          _buildMovieAvatar(data.item),
                          _buildNameMove(data.item),
                        ]),
                    Padding(
                      padding: EdgeInsets.only(left: 110.s, top: 7.s),
                      child: Column(
                        children: [
                          _buildRowDateTime(timeMovie, dateMovie),
                          Gap(3.s),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLike = !isLike;
                                  });
                                },
                                child: isLike
                                    ? const Icon(Icons.favorite_border,
                                        color: Colors.grey)
                                    : Icon(Icons.favorite,
                                        color: CommondColor.redCommond),
                              ),
                              Gap(3.s),
                              Text(
                                textAlign: TextAlign.center,
                                like.toString(),
                                style: CommondText.textSize16W500
                                    .copyWith(color: CommondColor.blackCommond),
                              ),
                              Gap(5.s),
                              GestureDetector(
                                  onTap: () {
                                    Share.share(data.item.videoUrl ?? "");
                                  },
                                  child: Icon(Icons.reply,
                                      color: CommondColor.redCommond))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.s),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.item.description ?? "",
                            style: CommondText.textSize16W500
                                .copyWith(color: CommondColor.blackCommond),
                          ),
                          Gap(15.s),
                          const _BuildInforMovie(
                            title: "Kiểm duyệt",
                            content: "C13 - Cấm trẻ em dưới 13 tuổi",
                          ),
                          _BuildInforMovie(
                            title: "Thể loại",
                            content: data.item.category ?? "",
                          ),
                          _BuildInforMovie(
                            maxLine: 1,
                            title: "Đạo diễn",
                            content: data.item.director ?? "",
                          ),
                          _BuildInforMovie(
                            title: "Diễn Viên",
                            content: data.item.actor ?? "",
                          ),
                          _BuildInforMovie(
                            title: "Ngôn ngữ",
                            content: data.item.language ?? "",
                          ),
                          Gap(10.s),
                          Divider(
                            thickness: 1.s,
                            color: CommondColor.grayCommond,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.s),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tin mới & Ưu đãi",
                                  style: CommondText.textSize18W500Black,
                                ),
                                BuildButtonShowAllContent(
                                  onTapFuncion: () {
                                    Navigator.pushNamed(context,
                                        RouterName.allDetailContentImage,
                                        arguments: data.listInforHotNew);
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.s),
                    _buildSliderHotNewDetail(data, context),
                    Gap(55.s),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.s, left: 15.s, right: 15.s),
            child: BuildLargeElevatedButton(
                functionOnTap: () {
                  Navigator.pushNamed(
                      context, RouterName.bookingDateTimeOfMovie,
                      arguments: data.item);
                },
                text: "ĐẶT VÉ"),
          )
        ],
      ),
    ));
  }

  GestureDetector _buildBackgroundTrailerMovie(
      BuildContext context, Item data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.movieOnline,
            arguments: data.videoUrl);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            data.thumbnail ?? "",
            width: double.infinity,
            height: 200.s,
            fit: BoxFit.cover,
          ),
          Icon(
            Icons.play_circle_outline,
            size: 35.s,
            color: CommondColor.whiteCommond,
          ),
        ],
      ),
    );
  }

  CarouselSlider _buildSliderHotNewDetail(
      DataItems data, BuildContext context) {
    return CarouselSlider(
        items: data.listInforHotNew
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.detailContentImage,
                        arguments: e);
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.s),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.s),
                          child: Image(
                            image: AssetImage(
                              e.linkImage,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.s, vertical: 10.s),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          e.textTittle,
                          style: CommondText.textSize18W600White,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(viewportFraction: 0.85, aspectRatio: 2 / 1));
  }

  Row _buildNameMove(Item data) {
    return Row(children: [
      Gap(105.s),
      Expanded(
        child: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          data.title ?? "",
          style: CommondText.textSize18W600White,
        ),
      ),
    ]);
  }

  Positioned _buildMovieAvatar(Item data) {
    return Positioned(
      left: 15.s,
      bottom: -60.s,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.s),
        child: Image.network(
          data.thumbnailMobile ?? "",
          width: 80.s,
          height: 120.s,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Row _buildRowDateTime(String time, String date) {
    return Row(
      children: [
        _BuildDateTimeMovie(
          data: date,
          iconType: Icons.calendar_month_outlined,
        ),
        Gap(10.s),
        _BuildDateTimeMovie(
          data: time,
          iconType: Icons.schedule,
        ),
      ],
    );
  }
}

class _BuildDateTimeMovie extends StatelessWidget {
  const _BuildDateTimeMovie({
    Key? key,
    required this.data,
    required this.iconType,
  }) : super(key: key);

  final String data;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.s),
          border: Border.all(width: 1.s, color: CommondColor.blackCommond)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.s),
        child: Row(
          children: [
            Icon(
              iconType,
              size: 20.s,
            ),
            Gap(4.s),
            Text(
              data,
              style: CommondText.textSize16W500
                  .copyWith(color: CommondColor.blackCommond),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildInforMovie extends StatelessWidget {
  const _BuildInforMovie({
    Key? key,
    required this.title,
    required this.content,
    this.maxLine = 2,
  }) : super(key: key);
  final String title;
  final String content;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: CommondText.textSize16W600,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            maxLines: maxLine,
            overflow: TextOverflow.ellipsis,
            content,
            style: CommondText.textSize16W500,
          ),
        ),
      ],
    );
  }
}
