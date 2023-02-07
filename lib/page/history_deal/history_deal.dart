import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/page/gift_voucher_coupon/gift_voucher_coupon.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

class HistoryDeal extends StatelessWidget {
  const HistoryDeal({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> typeHistory = [
      "Lịch sử vé",
      "Lịch sử quầy Online",
      "Lịch sử chi tiêu"
    ];

    return SafeArea(
        child: Scaffold(
      appBar:
          const AppBarCommond(titlle: "Lịch sử giao dịch", isLeading: true),
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
              itemCount: typeHistory.length,
              itemBuilder: (context, index) => BuildRowHistory(
                title: typeHistory[index],
                function: () {
                  Navigator.pushNamed(context, RouterName.myTicket);
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class BuildRowHistory extends StatelessWidget {
  const BuildRowHistory({
    Key? key,
    required this.title,
    required this.function,
  }) : super(key: key);
  final String title;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.s),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          BuildText(
            text: title,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 18.s,
          )
        ]),
      ),
    );
  }
}
