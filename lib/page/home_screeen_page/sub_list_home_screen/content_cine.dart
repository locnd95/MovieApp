import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_body_listview.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

List<AgrumentCineChannel> listAgrumentCineChannel = [
  AgrumentCineChannel(
      title:
          "Cơn sốt đến từ âm nhạc: One Piece chiêu đãi khán giả một concert thật sự, OST gây bão khắp nơi",
      linkImage: 'assets/images/list_kenhcine1.jpg',
      linkWeb:
          "https://kenhcine.cgv.vn/con-sot-den-tu-am-nhac-one-piece-chieu-dai-khan-gia-mot-concert-that-su-ost-gay-bao-khap-noi.html"),
  AgrumentCineChannel(
      title:
          "Cú đấm quyền năng của The Rock mở ra kỷ nguyên mới của DC ",
      linkImage: 'assets/images/list_kenhcine2.jpg',
      linkWeb:
          "https://kenhcine.cgv.vn/cu-dam-quyen-nang-cua-the-rock-mo-ra-ky-nguyen-moi-cua-dc.html"),
  AgrumentCineChannel(
      title:
          "Tất tần tật về nhóm anh hùng mới ở bom tấn BLACK ADAM :Chính là \"cha đẻ\"của Liên Minh Công Lý",
      linkImage: 'assets/images/list_kenhcine3.jpg',
      linkWeb:
          "https://kenhcine.cgv.vn/tat-tan-tat-ve-nhom-anh-hung-moi-o-bom-tan-black-adam-chinh-la-cha-de-cua-lien-minh-cong-ly.html"),
  AgrumentCineChannel(
      title:
          "Bản hùng ca CHÚA TỂ CỦA NHỮNG CHIẾC NHẪN trở lại màn ảnh rộng với định dạng mới",
      linkImage: 'assets/images/list_kenhcine4.jpg',
      linkWeb:
          "https://kenhcine.cgv.vn/ban-hung-ca-chua-te-cua-nhung-chiec-nhan-tro-lai-man-anh-rong-voi-dinh-dang-moi.html"),
  AgrumentCineChannel(
      title: "Kỉ nguyên mới của Marvel với loại SIÊU ANH HÙNG mới nổi",
      linkImage: 'assets/images/list_kenhcine5.jpg',
      linkWeb:
          "https://kenhcine.cgv.vn/diem-lai-nhung-lan-thanos-bi-danh-bai-trong-truyen-tranh-marvel.html"),
];

SizedBox buildContentCineChannel() {
  return SizedBox(
    height: 210.s,
    child: ListView.builder(
      itemCount: listAgrumentCineChannel.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => BuildBodyListView(
        imageLink: listAgrumentCineChannel[index].linkImage,
        textContentsHotNew: listAgrumentCineChannel[index].title,
        heightImage: 140.s,
        widthContainer: 240.s,
        navigatorFuncion: () {
          Navigator.pushNamed(context, RouterName.cineChannel,
              arguments: listAgrumentCineChannel[index]);
        },
      ),
    ),
  );
}

Padding buildTittleCineChannel() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.s),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Kênh Cine ",
          style: CommondText.textSize18W500Black,
        ),
      ],
    ),
  );
}

class AgrumentCineChannel {
  final String title;
  final String linkImage;
  final String linkWeb;
  AgrumentCineChannel(
      {required this.title, required this.linkImage, required this.linkWeb});
}
