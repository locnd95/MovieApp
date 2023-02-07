import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

class BuildButtonShowAllContent extends StatelessWidget {
  const BuildButtonShowAllContent({
    Key? key,
    required this.onTapFuncion,
  }) : super(key: key);
  final void Function() onTapFuncion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFuncion();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.s),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.s),
            border: Border.all(color: CommondColor.black54Commond)),
        child: Center(
          child: Text(
            "TẤT CẢ ",
            style: CommondText.textSize16W500Black54,
          ),
        ),
      ),
    );
  }
}
