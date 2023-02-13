import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

class BuildSimpleDialog extends StatelessWidget {
  BuildSimpleDialog({
    Key? key,
    this.title,
    required this.content,
    required this.firstButtonName,
    this.secondButtonName,
    required this.onTapFuncionFirst,
    this.onTapFuncionSecond,
  }) : super(key: key);
  final String? title;
  final String content;
  final String? firstButtonName;
  String? secondButtonName;
  final void Function()? onTapFuncionFirst;
  void Function()? onTapFuncionSecond;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(8.s, 12.s, 8.s, 16.s),
      title: title != null
          ? Center(
              child: Text(
                title!,
                style: CommondText.textSize16W600,
              ),
            )
          : null,
      children: [
        Column(
          children: [
            Center(
                child: Text(
              content,
              style: CommondText.textSize16W500,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (firstButtonName != null)
                  BuildButtonDialog(
                    onTapFuncion: () {
                      onTapFuncionFirst!();
                    },
                    text: firstButtonName!,
                  ),
                if (secondButtonName != null)
                  BuildButtonDialog(
                      onTapFuncion: () {
                        onTapFuncionSecond!();
                      },
                      text: secondButtonName!),
              ],
            )
          ],
        )
      ],
    );
  }
}

class BuildButtonDialog extends StatelessWidget {
  const BuildButtonDialog({
    Key? key,
    required this.text,
    required this.onTapFuncion,
  }) : super(key: key);
  final String text;
  final void Function() onTapFuncion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFuncion();
      },
      child: Padding(
        padding: EdgeInsets.all(10.s),
        child: Text(
          text,
          style: CommondText.textDialog,
        ),
      ),
    );
  }
}
