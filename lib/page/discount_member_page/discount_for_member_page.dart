import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

class DiscountForMember extends StatefulWidget {
  const DiscountForMember({super.key});

  @override
  State<DiscountForMember> createState() => _DiscountForMemberState();
}

class _DiscountForMemberState extends State<DiscountForMember> {
  int currentIndexPage = 0;
  List<InforDiscount> listDiscountMemberImage = [
    InforDiscount(
        linkImage: 'assets/images2/image_discount_member1.jpg',
        tittleImage: "CHƯƠNG TRÌNH KHUYẾN MÃI",
        contentDiscount:
            'Nhiều chương trình hấp dẫn \ndành riêng cho thành viên CGV'),
    InforDiscount(
        linkImage: 'assets/images2/image_discount_member2.jpg',
        tittleImage: "CHƯƠNG TRÌNH TÍCH ĐIỂM",
        contentDiscount:
            '1 điểm = 1.000 VND \ntại tất cả các rạp CGV trên toàn quốc'),
    InforDiscount(
        linkImage: 'assets/images2/image_discount_member3.jpg',
        tittleImage: "QUÀ TẶNG SINH NHẬT",
        contentDiscount:
            'Qùa tặng dành cho cả 4 cấp độ thành viên \ntrong tháng sinh nhật'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: 30.s,
          ),
        ),
        title: Text(
          "Ưu đãi cho thành viên",
          style: CommondText.textSize18W600White
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSliderContents(),
                DotsIndicator(
                  dotsCount: listDiscountMemberImage.length,
                  position: currentIndexPage.toDouble(),
                ),
                Gap(160.s),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButtonLogin(context),
                _buildButtonSignin(context),
              ],
            ),
          )
        ],
      ),
    ));
  }

  GestureDetector _buildButtonSignin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.signUpPage);
      },
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20.s)),
          width: 160.s,
          height: 40.s,
          child: Text(
            "ĐĂNG KÝ",
            style: CommondText.textButton.copyWith(
              color: CommondColor.whiteCommond,
            ),
          )),
    );
  }

  GestureDetector _buildButtonLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.loginPage);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: CommondColor.black54Commond,
              width: 1.s,
            ),
            borderRadius: BorderRadius.circular(20.s)),
        width: 160.s,
        height: 40.s,
        child: Text(
          "ĐĂNG NHẬP",
          style: CommondText.textButton,
        ),
      ),
    );
  }

  CarouselSlider _buildSliderContents() {
    return CarouselSlider(
        items: listDiscountMemberImage
            .map((item) => Column(
                  children: [
                    Image.asset(item.linkImage),
                    Text(
                      item.tittleImage,
                      style: CommondText.textSize16W600
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      item.contentDiscount,
                      style: CommondText.textSize12W500,
                    ),
                  ],
                ))
            .toList(),
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              currentIndexPage = index;
            });
          },
          height: 500.s,
          aspectRatio: 1 / 1,
          viewportFraction: 1,
        ));
  }
}

// class _BuildSmallTextButton extends StatelessWidget {
//   const _BuildSmallTextButton({
//     Key? key,
//   }) : super(key: key);
//   final String text;
//   final Color colorButton;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: CommondColor.black54Commond,
//             width: 1.s,
//           ),
//           borderRadius: BorderRadius.circular(20.s)),
//       width: 160.s,
//       height: 40.s,
//       child: Text(
//         "ĐĂNG NHẬP",
//         style: CommondText.textButton,
//       ),
//     );
//   }
// }

class InforDiscount {
  final String linkImage;
  final String tittleImage;
  final String contentDiscount;
  InforDiscount(
      {required this.linkImage,
      required this.tittleImage,
      required this.contentDiscount});
}
