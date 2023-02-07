import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/page/home_screeen_page/data_hotnew.dart';
import 'package:sizer/sizer.dart';

class DetailContentImage extends StatelessWidget {
  const DetailContentImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as ListInforHotNew;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(data.linkImage,
                width: double.infinity, height: 200.s, fit: BoxFit.fitWidth),
            Padding(
              padding: EdgeInsets.all(10.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.textTittle,
                    style: CommondText.textSize18W600White
                        .copyWith(color: CommondColor.blackCommond),
                  ),
                  Gap(15.s),
                  Text(
                    data.period,
                    style: CommondText.textSize16W500,
                  ),
                  Gap(30.s),
                  if (data.time != null)
                    _BuildContentProperties(
                        data: data,
                        description: "Thời gian : ",
                        descriptionContents: data.time),
                  Gap(30.s),
                  _BuildContentProperties(
                      data: data,
                      description: "Địa điểm sử dụng : ",
                      descriptionContents: data.locationUse),
                  Gap(30.s),
                  _BuildContentProperties(
                      data: data,
                      description: "Nội dung chương trình : ",
                      descriptionContents: data.content),
                  Gap(30.s),
                  _BuildContentProperties(
                      data: data,
                      description: "Hướng dẫn sử dụng : ",
                      descriptionContents: data.userManaul),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class _BuildContentProperties extends StatelessWidget {
  const _BuildContentProperties({
    Key? key,
    required this.data,
    required this.description,
    this.descriptionContents,
  }) : super(key: key);
  final String description;
  final String? descriptionContents;

  final ListInforHotNew data;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        TextSpan(
            text: description,
            style: CommondText.textSize16W600
                .copyWith(color: CommondColor.blackCommond),
            children: [
              TextSpan(
                  text: descriptionContents,
                  style: CommondText.textSize16W500
                      .copyWith(color: CommondColor.blackCommond)),
            ]));
  }
}
