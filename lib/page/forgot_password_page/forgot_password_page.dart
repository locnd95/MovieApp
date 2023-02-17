import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/network/models/get_todo_response.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  static String verify = "";

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  List<Todos?> listTodo = [];
  bool _isLoading = false;
  int total = 30;
  int limit = 30;
  int skip = 0;
  String phoneInput = "";
  ScrollController controller = ScrollController();
  @override
  initState() {
    super.initState();
  }

  requestOTP({required String phoneUser}) async {
    setState(() {
      _isLoading = true;
    });
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: phoneUser,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        // if(e.message!.contains("invalid")){
        //   showDialog(
        //   context: context,
        //   builder: (context) => BuildSimpleDialog(
        //       content: "Mã OTP không đúng",
        //       firstButtonName: "Đóng",
        //       onTapFuncionFirst: () {
        //         TextButton(
        //             onPressed: () => Navigator.pop(context),
        //             child: Text(
        //               "Đóng",
        //               style: CommondText.textSize16W500,
        //             ));
        //       }));
        // }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _isLoading = false;
        });
        ForgotPasswordPage.verify = verificationId;
        Navigator.pushReplacementNamed(context, RouterName.otpPage,
            arguments: phoneUser);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _isLoading = false;
        });
      },
    );
  }

  TextEditingController userController = TextEditingController();
  String userWarningText = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
          child: Scaffold(
        appBar: const AppBarCommond(
            titlle: "Quên mật khẩu",
            isLeading: true,
            isBackgroundColor: true),
        body: RefreshIndicator(
          onRefresh: () async {
            // listTodo = [];
            // skip = 0;
            // await _getTodoList(currentPage: 0);
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ScrollPhysics(),
                controller: controller,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.s),
                  child: Column(
                    children: [
                      Gap(30.s),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.s),
                        child: Text(
                          "Nhập email hoặc số điện thoại",
                          style: CommondText.textSize16W600,
                        ),
                      ),
                      BuildWarningText(
                          inputController: userController,
                          text: userWarningText),
                      BuildTextFormField(
                          prefixIcon: const Icon(Icons.email),
                          textNormal: "Email hoặc số điện thoại",
                          textController: userController),
                      Gap(30.s),
                      Form(
                        onChanged: () {
                          setState(() {
                            userWarningText = "";
                          });
                        },
                        child: BuildLargeElevatedButton(
                            functionOnTap: () {
                              setState(() {
                                userController.text.isEmpty
                                    ? userWarningText =
                                        "Vui lòng nhập email hoặc số điện thoại"
                                    : userWarningText = "";
                                const patternEmail =
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                final regExpEmail = RegExp(patternEmail);
                                String patternPhoneNumber =
                                    r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExpPhoneNumber =
                                    RegExp(patternPhoneNumber);
                                if (userController.text.isEmpty) {
                                  userWarningText =
                                      'Vui lòng nhập email hoặc số điện thoại';
                                } else {
                                  if (!regExpPhoneNumber
                                          .hasMatch(userController.text) &&
                                      !regExpEmail
                                          .hasMatch(userController.text)) {
                                    userWarningText =
                                        'Email hoặc số điện thoại không đúng';
                                  } else {
                                    String userPhoneNumber =
                                        userController.text;
                                    String convertPhoneNumber = userPhoneNumber
                                        .substring(1, userPhoneNumber.length);
                                    phoneInput = "+84 $convertPhoneNumber";
                                    print(phoneInput);
                                    requestOTP(phoneUser: phoneInput);
                                  }
                                }
                              });
                            },
                            text: "TIẾP TỤC"),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isLoading)
                Container(
                    color: CommondColor.blackCommond.withOpacity(0.2),
                    child: const Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      )),
    );
  }
}
