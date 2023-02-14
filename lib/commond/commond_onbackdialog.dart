import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond_show_dialog.dart';

Future<bool> onBackDialog(BuildContext context) async {
  bool exitApp = await showDialog(
        context: context,
        builder: (context) => BuildSimpleDialog(
          content: 'Bạn có muốn thoát ?',
          firstButtonName: 'Đồng ý',
          onTapFuncionFirst: () {
            exit(0);
            // Navigator.of(context).pop(true);
          },
          title: 'Thông báo',
          onTapFuncionSecond: () {
            Navigator.pop(context);
          },
          secondButtonName: 'Hủy bỏ',
        ),
      ) ??
      false;
  return exitApp;
}
