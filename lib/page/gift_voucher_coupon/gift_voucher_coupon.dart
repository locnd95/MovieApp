import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:sizer/sizer.dart';

class GiftVoucherCoupon extends StatelessWidget {
  const GiftVoucherCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PointUser> pointUser = [
      PointUser(titlle: "Qùa tặng", points: "0 "),
      PointUser(titlle: "Voucher", points: "0 "),
      PointUser(titlle: "Coupon", points: "0 "),
    ];

    return SafeArea(
        child: Scaffold(
      appBar: const AppBarCommond(titlle: "Điểm CGV", isLeading: true),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            height: 40.s,
            color: CommondColor.grayCommond.shade500,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.s, vertical: 10.s),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                thickness: 1.s,
                color: CommondColor.blackCommond,
              ),
              shrinkWrap: true,
              itemCount: pointUser.length,
              itemBuilder: (context, index) => BuildRowPoint(
                point: pointUser[index].points,
                title: pointUser[index].titlle,
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class BuildRowPoint extends StatelessWidget {
  const BuildRowPoint({
    Key? key,
    required this.title,
    required this.point,
    this.padding = 0,
  }) : super(key: key);
  final String title;
  final String point;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        BuildText(
          text: title,
        ),
        Row(
          children: [
            BuildText(text: point),
            Gap(20.s),
            Icon(
              Icons.arrow_forward_ios,
              size: 18.s,
            )
          ],
        )
      ]),
    );
  }
}

class BuildText extends StatelessWidget {
  const BuildText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CommondText.textSize16W500,
    );
  }
}

class PointUser {
  final String titlle;
  final String points;
  PointUser({
    required this.titlle,
    required this.points,
  });
}
