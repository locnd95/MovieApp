import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

class Imax4DX extends StatelessWidget {
  const Imax4DX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> listImageImax = [
      "assets/images2/image_imax1.png",
      "assets/images2/image_imax2.png",
      "assets/images2/image_imax3.png"
    ];

    final dataImax4DX = ModalRoute.of(context)!.settings.arguments as String;

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
        title: Text("IMAX",
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images2/image_imax_nerver_compromise.jpg",
                width: double.infinity, fit: BoxFit.fitWidth),
            _buildSliderContent(listImageImax),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataImax4DX,
                    style: CommondText.textSize18W600White
                        .copyWith(color: CommondColor.blackCommond),
                  ),
                  const _BuildTittleContent(
                    tittle:
                        """IMAX là công nghệ chiếu phim tiên tiến nhất trên thế giới hiện nay,từ thiết kế phòng chiếu vô cùng choáng ngợp đến hiệu ứng âm thanh và hình ảnh đỉnh cao""",
                  ),
                  const _BuildTittleContent(
                      tittle:
                          """Trải nghiệm trọn vẹn bộ phim với màn hình cong cỡ lớn"""),
                  const _BuildContent(
                      content:
                          """Màn hình của phòng chiếu IMAX® không chỉ đơn thuần là màn hình cỡ lớn, mà độ cong của màn hình cũng được thiết kế đến mức cực đại. Thiết kế cong của màn hình nhằm đưa hình ảnh lấp đầy tầm nhìn, biến mỗi thước phim trở nên ấn tượng tuyệt đối. Góc nhìn của người xem trong phòng chiếu thường là 54 độ, với IMAX® đó là 70 độ!
ặc biệt, với khoảng cách giữa màn hình, ghế ngồi và độ nghiêng của sàn, khán giả có thể thưởng thức trọn vẹn bộ phim tại bất kì vị trí nào trong phòng chiếu IMAX®."""),
                  const _BuildTittleContent(
                      tittle: """Hình ảnh sắc nét với IMAX DMR®"""),
                  const _BuildContent(
                      content:
                          "Với phòng chiếu IMAX®, bạn như đang bước vào thế giới của chính bộ phim. Hình ảnh không chỉ được mở rộng để phù hợp với kích thước cực đại của màn hình, mà nó còn được chuyển hóa hoàn toàn.phối hợp chặt chẽ với các nhà làm phim trong quá trình được gọi là IMAX DMR® (Digital Re-mastering), để nâng cao chất lượng của hàng trăm chi tiết trong phần lớn các cảnh phim và mang tới hình ảnh cực kỳ sắc nét."),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  CarouselSlider _buildSliderContent(List<String> listImageImax) {
    return CarouselSlider(
        items: listImageImax.map((e) => Image.asset(e)).toList(),
        options: CarouselOptions(viewportFraction: 1, autoPlay: true));
  }
}

class _BuildTittleContent extends StatelessWidget {
  const _BuildTittleContent({
    Key? key,
    required this.tittle,
  }) : super(key: key);
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.s),
      child: Text(
        tittle,
        style: CommondText.textSize16W600,
      ),
    );
  }
}

class _BuildContent extends StatelessWidget {
  const _BuildContent({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.s),
      child: Text(
        content,
        style: CommondText.textSize16W500,
      ),
    );
  }
}
