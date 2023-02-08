import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

class MyTicket extends StatelessWidget {
  const MyTicket({super.key});

  @override
  // TabController controller =TabController();
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: CommondColor.grayCommond.shade300,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 40),
                  child: TabBar(
                      // indicatorColor: Theme.of(context).highlightColor,
                      labelColor: Colors.black54,
                      labelStyle: TextStyle(
                        height: 16.s,
                      ),
                      tabs: const [
                        Tab(
                          text: "Phim sắp xem",
                        ),
                        Tab(text: "Phim đã xem")
                      ])),
              // backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
              elevation: 0,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  size: 30.s,
                  color: CommondColor.redCommond,
                ),
              ),
              title: Text("Vé của tôi",
                  style: CommondText.textSize18W600White
                      .copyWith(color: CommondColor.blackCommond)),
            ),
            body: TabBarView(children: [
              const _BuildShowNoInfor(),
              Column(
                children: [
                  Gap(20.s),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.s),
                    child: Text(
                        "Chỉ hiển thị giao dịch Online trong 3 tháng gần nhất . Để kiểm tra lịch sử giao dịch tại quầy vui lòng liên hệ hotline :19006017",
                        style: CommondText.textSize16W500),
                  ),
                  const Center(child: _BuildShowNoInfor()),
                ],
              )
            ])),
      ),
    );
  }
}

class _BuildShowNoInfor extends StatelessWidget {
  const _BuildShowNoInfor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20.s),
        const Icon(
          Icons.search,
          size: 40,
        ),
        Text(
          "Không có dữ liệu",
          style: CommondText.textSize16W500,
        ),
      ],
    );
  }
}
