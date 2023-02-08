import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_local_store.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/page/infor_user_page/infor_user_page.dart';
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
  String pwLocal = "";
  bool _isLoading = false;
  @override
  void initState() {
    _getLocalPassword();
    super.initState();
  }

  _getLocalPassword() async {
    pwLocal = await LocalUserCommond.getPassword();
  }

  TextEditingController passwordController = TextEditingController();
  String passwordWarningText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          appBar: const AppBarCommond(
              titlle: "Thông tin tài khoản", isLeading: true),
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
                              ? passwordWarningText =
                                  "Vui lòng nhập mật khẩu"
                              : "";
                          if (passwordWarningText.isEmpty) {
                            setState(() {
                              _isLoading = true;
                            });
                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                setState(() {
                                  _isLoading = false;
                                });
                                if (passwordController.text == pwLocal) {
                                  Navigator.pushReplacementNamed(
                                      context, RouterName.inforUserPage);
                                } else {
                                  setState(() {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const BuildShowDialogNotification(
                                            content: "Mật khẩu không đúng");
                                      },
                                    );
                                  });
                                }
                              },
                            );
                          }
                        });
                      },
                      text: "XÁC NHẬN"),
                )
              ],
            ),
          ),
        ),
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.2),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    ));
  }
}
