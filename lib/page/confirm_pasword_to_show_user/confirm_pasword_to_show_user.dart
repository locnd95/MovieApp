import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

class ConfirmPasswordToShowUser extends StatefulWidget {
  const ConfirmPasswordToShowUser({super.key});

  @override
  State<ConfirmPasswordToShowUser> createState() =>
      _ConfirmPasswordToShowUserState();
}

class _ConfirmPasswordToShowUserState extends State<ConfirmPasswordToShowUser> {
  bool isShow = true;
  TextEditingController passwordController = TextEditingController();
  String passwordWarningText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          const AppBarCommond(titlle: "Thông tin tài khoản", isLeading: true),
      body: Form(
        onChanged: () {
          setState(() {
            passwordWarningText = "";
          });
        },
        child: Column(
          children: [
            BuildTextFormField(
              textController: passwordController,
              isObscure: isShow,
              textNormal: "Mật khẩu",
              iconShow: const Icon(Icons.visibility_off),
              iconOff: const Icon(Icons.visibility),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.s),
              child: BuildWarningText(
                inputController: passwordController,
                text: passwordWarningText,
              ),
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "Để bảo mật vui lòng nhập mật khẩu của bạn ",
              style: CommondText.textSize16W400,
            ),
            Gap(40.s),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.s),
              child: BuildLargeElevatedButton(
                  functionOnTap: () {
                    setState(() {
                      passwordController.text.isEmpty
                          ? passwordWarningText = "Vui lòng nhập mật khẩu"
                          : "";
                      if (passwordController.text.isNotEmpty) {
                        Navigator.pushReplacementNamed(
                            context, RouterName.inforUserPage);
                      }
                    });
                  },
                  text: "XÁC NHẬN"),
            )
          ],
        ),
      ),
    ));
  }
}
