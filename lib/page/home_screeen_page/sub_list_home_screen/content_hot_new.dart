import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_body_listview.dart';
import 'package:movie_app/commond/commond_button_show_all_contents.dart';
import 'package:movie_app/page/home_screeen_page/data_hotnew.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

final List<ListInforHotNew> listInforHotNew = [
  ListInforHotNew(
    linkImage: 'assets/images/list_image1.jpg',
    textTittle: "TRANG SỨC KIÊU SA NÂNG TẦM NHAN SẮC QUÝ CÔ",
    period: "Đến hết tháng 1/2023",
    time: "15/12/2022 - 15/1/2023",
    content:
        "Bạn mới: Giảm 25.000đ cho giao dịch đặt vé từ 90.000đ. Mỗi khách hàng chỉ được tham gia chương trình một lần.",
  ),
  ListInforHotNew(
    linkImage: 'assets/images/list_image2.jpg',
    textTittle: "KHẢO SÁT PHIM TẾT 2023",
    period: "Đến hết tháng 12/2022",
    time: "20/12/2022 - 1/1/2023",
    content:
        """Nhằm phục vụ nhu cầu giải trí cho khách hàng được tốt hơn trong thời gian Tết Nguyên Đán 2023,
           CGV kính mời bạn tham gia khảo sát về “PHIM TẾT 2023” theo link khảo sát bên dưới.""",
  ),
  ListInforHotNew(
    linkImage: 'assets/images/list_image3.jpg',
    textTittle: "MÙA PHIM BOM TẤN CUỐI NĂN ZALOPAY TẶNG VÉ 9K",
    period: "Đến hết tháng 12/2022",
    time: " Từ ngày 05/12 - 31/12/2022",
    content: """Lần đầu tiên liên kết thẻ/ tài khoản ngân hàng mới với ZaloPay 
          trong thời gian diễn ra chương trình và chưa từng thực hiện giao dịch thanh toán trên ZaloPay.""",
  ),
  ListInforHotNew(
    linkImage: 'assets/images/list_image4.jpg',
    textTittle:
        "NHẬP HỘI U22 ZALOPAY VỚI CHỈ 1K/VÉ CGV!GIẢM GIÁ TƯNG BỪNG ,GIẢM ĐẬM SÂU",
    period:
        "Áp dụng cho tất cả các suất chiếu từ Thứ 2 đến Thứ 6 (bao gồm Happy Day, Culture Day và Lateshow)",
    content:
        """Khách hàng có độ tuổi từ 12 - 22 (trước ngày sinh nhật lần thứ 23) 
          nhanh chóng nhập hội CGV U22 để nhận ngay ưu đãi đồng giá vô cùng hấp dẫn:
          - 45.000 VNĐ - 55.000 VNĐ - 65.000 VNĐ/ 1 vé 2D (*)""",
  ),
  ListInforHotNew(
    linkImage: 'assets/images/list_image5.jpg',
    textTittle: "ĐĂNG KÍ OMNI - NHẬN VÉ PHIM HAY",
    period:
        "Chương trình triển khai từ ngày 16/10/2022 đến ngày 31/12/2022 hoặc đến khi sử dụng hết ngân sách nhận thưởng.",
    content:
        "Chương trình “Mở tài khoản-Nhận hoàn tiền” là chương trình ưu đãi đặc biệt dành cho Khách hàng cá nhân mới chưa là khách hàng hiện hữu của Techcombank.",
  ),
];

SizedBox buildContentHotNew(BuildContext context) {
  return SizedBox(
    height: 170.s,
    child: ListView.builder(
      itemCount: listInforHotNew.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => BuildBodyListView(
        imageLink: listInforHotNew[index].linkImage,
        textContentsHotNew: listInforHotNew[index].textTittle,
        heightImage: 110.s,
        widthContainer: 180.s,
        navigatorFuncion: () {
          Navigator.pushNamed(context, RouterName.detailContentImage,
              arguments: listInforHotNew[index]);
        },
      ),
    ),
  );
}

Padding buildTittleHotNew(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.s),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Tin nóng ",
          style: CommondText.textSize18W500Black,
        ),
        BuildButtonShowAllContent(
          onTapFuncion: () {
            Navigator.pushNamed(context, RouterName.allDetailContentImage,
                arguments: listInforHotNew);
          },
        )
      ],
    ),
  );
}
