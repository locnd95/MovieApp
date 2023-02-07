import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/page/home_screeen_page/data_hotnew.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

class AllDetailContentImage extends StatefulWidget {
  const AllDetailContentImage({
    super.key,
  });

  @override
  State<AllDetailContentImage> createState() => _AllDetailContentImageState();
}

class _AllDetailContentImageState extends State<AllDetailContentImage> {
  final listController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as List<ListInforHotNew>;
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
        title: Text("Tin mới & Ưu đãi",
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
        controller: listController,
        child: Container(
          color: Colors.grey.shade400,
          child: Column(
            children: [
              _buildListContent(data),
              Gap(50.s),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // listController.jumpTo(0);
                    listController.animateTo(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  });
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.teal),
                    child: Padding(
                      padding: EdgeInsets.all(10.s),
                      child: Icon(
                        Icons.arrow_upward,
                        size: 30.s,
                      ),
                    )),
              ),
              Gap(20.s),
            ],
          ),
        ),
      ),
    ));
  }

  ListView _buildListContent(List<ListInforHotNew> data) {
    return ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 8.s, left: 8.s, right: 8.s),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.detailContentImage,
                      arguments: data[index]);
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.s),
                        child: Image(
                          image: AssetImage(data[index].linkImage),
                          fit: BoxFit.fitWidth,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            data[index].textTittle,
                            style: CommondText.textSize18W600White,
                          ),
                          if (data[index].time != null)
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              data[index].time ?? "",
                              style: CommondText.textSize16W500
                                  .copyWith(color: CommondColor.whiteCommond),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
