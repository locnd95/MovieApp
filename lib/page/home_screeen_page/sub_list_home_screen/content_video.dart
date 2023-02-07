import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_body_listview.dart';
import 'package:movie_app/commond/commond_button_show_all_contents.dart';
import 'package:movie_app/page/home_screeen_page/home_screeen_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

List<ListVideosContent> listVideosContent = [
  ListVideosContent(
      linkVideo: "https://www.youtube.com/watch?v=tHjY0NKsynU",
      linkImage: 'assets/images/list_video1.jpg',
      contentVideo:
          "CÔNG VIỆC HẠNH PHÚC NHẤT CỦA JAMES TẠI SUSHI HOKKAIDO SACHI"),
  ListVideosContent(
    linkVideo: 'https://www.youtube.com/watch?v=qOP_CkRmfKQ',
    linkImage: 'assets/images/list_video2.jpg',
    contentVideo: "CHUYẾN ĐI NHỚ ĐỜI CỦA TIỂU ĐỘI GẤU BAY TRAILER -KC ",
  ),
  ListVideosContent(
    linkVideo: 'https://www.youtube.com/watch?v=cqGjhVJWtEg',
    linkImage: 'assets/images/list_video3.jpg',
    contentVideo: "SPIDER-MAN : ACROSS THE SPIDER-VERSE Official Trailer |DKKC",
  ),
  ListVideosContent(
    linkVideo: 'https://www.youtube.com/watch?v=oynJnBhWbXU',
    linkImage: 'assets/images/list_video4.jpg',
    contentVideo:
        "TRIANGLE OF SADNESS ( tựa Việt :ĐÁY THƯỢNG LƯU) - Trailer chính thức",
  ),
  ListVideosContent(
    linkVideo: 'https://www.youtube.com/watch?v=U76D0Cr10IY',
    linkImage: 'assets/images/list_video5.jpg',
    contentVideo:
        "Đảo độc Đắc : Tử Mẫu Thiên Linh Cái trailer - KC :23.12.2023",
  ),
];

SizedBox buildContentVideo(
    // List<ListVideosContent> listVideosContent
    ) {
  return SizedBox(
    height: 210.s,
    child: ListView.builder(
      itemCount: listVideosContent.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => BuildBodyListView(
        imageLink: listVideosContent[index].linkImage,
        textContentsHotNew: listVideosContent[index].contentVideo,
        heightImage: 140.s,
        widthContainer: 240.s,
        navigatorFuncion: () {
          Navigator.pushNamed(context, RouterName.allVideosContents,
              arguments: listVideosContent);
        },
      ),
    ),
  );
}

Padding buildTittleVideo(
  BuildContext context,
  //  List<ListVideosContent> listVideosContent
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.s),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Videos ",
          style: CommondText.textSize18W500Black,
        ),
        BuildButtonShowAllContent(
          onTapFuncion: () {
            Navigator.pushNamed(context, RouterName.allVideosContents,
                arguments: listVideosContent);
          },
        ),
      ],
    ),
  );
}
