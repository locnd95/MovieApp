import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/page/gift_voucher_coupon/gift_voucher_coupon.dart';
import 'package:sizer/sizer.dart';

class PoitnCGVPage extends StatelessWidget {
  const PoitnCGVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PointUser> pointUser = [
      PointUser(titlle: "Điểm của bạn", points: "0 điểm"),
      PointUser(titlle: "Điểm sẽ nhận", points: "0 điểm"),
      PointUser(titlle: "Tổng Chi Tiêu 2023", points: "0 đ"),
    ];

    return SafeArea(
        child: Scaffold(
      appBar: const AppBarCommond(titlle: "Điểm CGV", isLeading: true),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            height: 60.s,
            color: CommondColor.grayCommond.shade500,
            child: Text("TỔNG KẾT", style: CommondText.textSize18W500Black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.s, vertical: 10.s),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: pointUser.length,
              itemBuilder: (context, index) => BuildRowPoint(
                padding: 15.s,
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
