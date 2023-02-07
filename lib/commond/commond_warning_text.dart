import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';

class BuildWarningText extends StatelessWidget {
  const BuildWarningText({
    Key? key,
    required this.inputController,
    required this.text,
  }) : super(key: key);
  final String text;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(text, style: CommondText.textWarning),
    );
  }
}
