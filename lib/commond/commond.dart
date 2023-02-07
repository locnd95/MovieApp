import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommondColor {
  static const blackCommond = Colors.black;
  static const black54Commond = Colors.black54;
  static const black45Commond = Colors.black45;
  static const whiteCommond = Colors.white;
  static const grayCommond = Colors.grey;
  static Color redCommond = Colors.red.shade700;
  static Color backroundCommond = Colors.teal;
}

class CommondText {
  static final textSize18W600White = TextStyle(
      fontSize: 18.s,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: CommondColor.whiteCommond);
  static final textSize18W500Black = TextStyle(
      fontSize: 18.s,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: CommondColor.blackCommond);
  static final textSize18W400Black = TextStyle(
      fontSize: 18.s,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: CommondColor.blackCommond);
  static final textSize16W600 = TextStyle(
      fontSize: 16.s,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: CommondColor.blackCommond);
  static final textSize16W500Black54 = TextStyle(
      fontSize: 16.s,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: CommondColor.black54Commond);
  static final textSize14W500 = TextStyle(
      fontSize: 14.s,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: CommondColor.whiteCommond);
  static final textSize12W500 = TextStyle(
      fontSize: 12.s,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: CommondColor.black45Commond);
  static final textButton = TextStyle(
      fontSize: 14.s,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: CommondColor.black54Commond);
  static final textWarning = TextStyle(
      fontSize: 12.s,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: CommondColor.redCommond);
  static final textDialog = TextStyle(
      fontSize: 18.s,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: CommondColor.redCommond);
  static final textSize16W500 = TextStyle(
      fontSize: 16.s,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: CommondColor.blackCommond);
  static final textSize16W400 = TextStyle(
      fontSize: 16.s,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: CommondColor.black54Commond);
  static final textSize20W500Black = TextStyle(
      fontSize: 20.s,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: CommondColor.blackCommond);
  static final textSize25W500Black = TextStyle(
      fontSize: 25.s,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: CommondColor.blackCommond);
}

class Constanst {
  static const defaulTimeOut = 30000;
  static const baseURL = "http://66.42.54.109:8010";
}
