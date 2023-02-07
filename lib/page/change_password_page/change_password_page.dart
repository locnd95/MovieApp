import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    print('Dispose used');
    super.dispose();
  }

  bool isShow = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String passwordWarningText = "";
  String newPasswordWarningText = "";
  String confirmPasswordWarningText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: const AppBarCommond(
                  titlle: "Thay đổi mật khẩu", isLeading: true),
              body: Form(
                onChanged: () {
                  setState(() {
                    passwordWarningText = "";
                    newPasswordWarningText = "";
                    confirmPasswordWarningText = "";
                  });
                },
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.s),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.s),
                      child: Text(
                        "Mật khẩu đăng nhập",
                        style: CommondText.textSize16W600,
                      ),
                    ),
                    Gap(20.s),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.s),
                      child: BuildWarningText(
                          inputController: passwordController,
                          text: passwordWarningText),
                    ),
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
                          inputController: newPasswordController,
                          text: newPasswordWarningText),
                    ),
                    BuildTextFormField(
                      textController: newPasswordController,
                      isObscure: isShow,
                      textNormal: "Mật khẩu mới",
                      iconShow: const Icon(Icons.visibility_off),
                      iconOff: const Icon(Icons.visibility),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.s),
                      child: BuildWarningText(
                          inputController: confirmPasswordController,
                          text: confirmPasswordWarningText),
                    ),
                    BuildTextFormField(
                      textController: confirmPasswordController,
                      isObscure: isShow,
                      textNormal: "Xác nhận mật khẩu",
                      iconShow: const Icon(Icons.visibility_off),
                      iconOff: const Icon(Icons.visibility),
                    ),
                    Gap(40.s),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.s),
                      child: BuildLargeElevatedButton(
                          functionOnTap: () {
                            setState(() {
                              passwordController.text.isEmpty
                                  ? passwordWarningText =
                                      "Vui lòng nhập mật khẩu"
                                  : "";
                              newPasswordController.text.isEmpty
                                  ? newPasswordWarningText =
                                      "Vui lòng nhập mật khẩu mới"
                                  : "";
                              confirmPasswordController.text.isEmpty
                                  ? confirmPasswordWarningText =
                                      "Vui lòng nhập xác nhận mật khẩu"
                                  : "";
                              if (newPasswordController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty &&
                                  confirmPasswordController.text.isNotEmpty) {
                                if (newPasswordController.text !=
                                    confirmPasswordController.text) {
                                  newPasswordWarningText =
                                      "Mật khẩu không trùng nhau";
                                  confirmPasswordWarningText =
                                      "Mật khẩu không trùng nhau";
                                  FocusScope.of(context).unfocus();
                                }
                              }
                              // else {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  alignment: Alignment.center,
                                  color: CommondColor.black54Commond,
                                  height: 50.s,
                                  child: Text(
                                    "Đổi mật khẩu thành công",
                                    style: CommondText.textSize18W500Black,
                                  ),
                                ),
                              );
                              Future.delayed(
                                const Duration(seconds: 1),
                                () => Navigator.pop(context),
                              );
                              // }
                            });
                          },
                          text: "THAY ĐỔI MẬT KHẨU"),
                    )
                  ],
                )),
              ),
            )));
  }
}
