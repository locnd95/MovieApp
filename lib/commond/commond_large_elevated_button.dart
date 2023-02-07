import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

class BuildLargeElevatedButton extends StatelessWidget {
  const BuildLargeElevatedButton({
    Key? key,
    this.controller,
    required this.functionOnTap,
    this.notOTPtype = true,
    required this.text,
  }) : super(key: key);
  final void Function() functionOnTap;
  final String text;
  final bool? notOTPtype;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        functionOnTap();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: notOTPtype == true
                ? Colors.red.shade700
                : controller?.text.length == 6
                    ? Colors.red.shade700
                    : Colors.grey,
            borderRadius: BorderRadius.circular(20.s)),
        width: double.infinity,
        height: 40.s,
        child: Text(
          text,
          style: CommondText.textButton.copyWith(
            color: CommondColor.whiteCommond,
          ),
        ),
      ),
    );
  }
}
