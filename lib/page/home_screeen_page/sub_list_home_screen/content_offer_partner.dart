import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/page/home_screeen_page/data_hotnew.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

Container buildContentOfferPartner(
    List<ListInforHotNew> list, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.s),
    child: CarouselSlider(
        items: list
            .map((item) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.detailContentImage,
                        arguments: item);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.s),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          item.linkImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(12.s),
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true, viewportFraction: 0.8, aspectRatio: 2.8 / 1)),
  );
}

Padding buildOfferPartner() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.s),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ưu đãi từ đối tác ",
          style: CommondText.textSize18W500Black,
        ),
      ],
    ),
  );
}
