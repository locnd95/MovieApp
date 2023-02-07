import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/page/home_screeen_page/data_hotnew.dart';
import 'package:sizer/sizer.dart';

class BuildBodyListView extends StatelessWidget {
  const BuildBodyListView({
    Key? key,
    required this.imageLink,
    required this.textContentsHotNew,
    required this.widthContainer,
    required this.heightImage,
    this.list,
    required this.navigatorFuncion,
  }) : super(key: key);
  final String imageLink;
  final String textContentsHotNew;
  final double widthContainer;
  final double heightImage;
  final ListInforHotNew? list;
  final void Function() navigatorFuncion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.s),
      width: widthContainer,
      child: Column(
        children: [
          SizedBox(
            height: heightImage,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.s),
              child: Material(
                child: Ink.image(
                  image: AssetImage(imageLink),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: () {
                      navigatorFuncion();
                    },
                  ),
                ),
              ),
            ),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       fit: BoxFit.fill, image: AssetImage(imageLink)),
            //   borderRadius: BorderRadius.circular(12.s),
            // ),
          ),
          Gap(5.s),
          Expanded(
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textContentsHotNew,
              style: CommondText.textSize16W600,
            ),
          )
        ],
      ),
    );
  }
}
