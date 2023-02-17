import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/page/forgot_password_page/forgot_password_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OPTPage extends StatefulWidget {
  const OPTPage({super.key});

  @override
  State<OPTPage> createState() => _OPTPageState();
}

class _OPTPageState extends State<OPTPage> {
  TextEditingController userController = TextEditingController();
  String userWarningText = "";
  TextEditingController textEditingController = TextEditingController();
  String otpNumber = "";
  bool sendBack = false;
  int time = 60;
  bool _isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  requestOTP({required String phoneUser}) async {
    setState(() {
      _isLoading = true;
    });
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: phoneUser,
      verificationCompleted: (PhoneAuthCredential credential) {
        // setState(() {
        //   timeController.restart();
        // });
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          timeController.restart();
          _isLoading = false;
        });
        ForgotPasswordPage.verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          // timeController.restart();
          _isLoading = false;
        });
      },
    );
  }

  confirmOTP(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: ForgotPasswordPage.verify, smsCode: otpNumber);
      setState(() {
        _isLoading = false;
      });

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      Navigator.pushNamed(context, RouterName.homeScreen);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      showDialog(
          context: context,
          builder: (context) => SimpleDialog(
                children: [
                  Column(children: [
                    Text(
                      "Mã OPT không đúng",
                      style: CommondText.textSize16W500,
                    ),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Đóng",
                          style: CommondText.textSize16W500
                              .copyWith(color: Colors.red),
                        ))
                  ])
                ],
              )
          // BuildSimpleDialog(
          //     content: "Mã OTP không đúng",
          //     firstButtonName: "Đóng",
          //     onTapFuncionFirst: () {
          //       TextButton(
          //           onPressed: () => Navigator.pop(context),
          //           child: Text(
          //             "Đóng",
          //             style: CommondText.textSize16W500,
          //           ));
          //     })
          );
    }
  }
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  bool isCheckOTP = false;

  bool hasError = false;
  String currentText = "";
  CountdownController timeController = CountdownController(autoStart: true);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          appBar: const AppBarCommond(
            titlle: "Nhập mã xác minh",
            isLeading: true,
            isBackgroundColor: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.s),
            child: Column(
              children: [
                Gap(30.s),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.s),
                  child: _buildTextTittle(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.s),
                  child: BuildWarningText(
                      inputController: userController, text: userWarningText),
                ),
                _buildOTPCode(context),
                Gap(30.s),
                _buildElevatedButton(context, data),
                Gap(10.s),
                _buildCountdownTime(),
                Gap(10.s),
                if (sendBack)
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          sendBack = false;

                          requestOTP(phoneUser: data);
                          timeController.restart();
                        });
                      },
                      child: Text("Gửi lại",
                          style: CommondText.textSize16W500
                              .copyWith(color: CommondColor.redCommond))),
              ],
            ),
          ),
        ),
        if (_isLoading)
          Container(
              color: CommondColor.blackCommond.withOpacity(0.2),
              child: const Center(child: CircularProgressIndicator())),
      ],
    ));
  }

  Countdown _buildCountdownTime() {
    return Countdown(
      controller: timeController,
      seconds: time,
      build: (BuildContext context, double time) => isCheckOTP
          ? const Text("")
          : Text.rich(
              TextSpan(text: "Gửi lại trong : ",
                  // style: CommondText.textSize16W500,
                  children: [
                    TextSpan(
                        text: time.toInt().toString(),
                        style: CommondText.textSize16W500
                            .copyWith(color: Colors.red)),
                    const TextSpan(text: " giây"),
                  ]),
              style: CommondText.textSize16W500,
            ),
      interval: const Duration(seconds: 1),
      onFinished: () {
        setState(() {
          sendBack = true;
        });
      },
    );
  }

  Text _buildTextTittle() {
    return Text(
      textAlign: TextAlign.center,
      maxLines: 3,
      "Nhập mã xác minh đã được gửi đến số điện thoại +84 34****055. Mỗi số điện thoại chỉ nhận được tối đa 3 mã trong 1 ngày",
      style: CommondText.textSize16W500,
    );
  }

  Form _buildElevatedButton(BuildContext context, String phone) {
    return Form(
      onChanged: () {
        setState(() {
          userWarningText = "";
        });
      },
      child: BuildLargeElevatedButton(
          controller: userController,
          notOTPtype: false,
          functionOnTap: () {
            setState(() {
              String b = convertString(phone);
              if (userController.text.isEmpty) {
                userWarningText = "Vui lòng nhập mã OTP";
              } else {
                setState(() {
                  _isLoading = true;
                });
                confirmOTP(context);
                //
              }
            });
          },
          text: "KÍCH HOẠT"),
    );
  }

  Form _buildOTPCode(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: PinCodeTextField(
            appContext: context,
            pastedTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            length: 6,
            // obscureText: false,
            // obscuringCharacter: '*',
            animationType: AnimationType.fade,
            validator: (value) {
              if (value!.length < 6) {
                return "Mã không hợp lệ";
              } else {
                return null;
              }
            },

            onCompleted: (value) {
              setState(() {
                otpNumber = value;
              });
            },
            // onTap: () {
            //   print("Pressed");
            // },
            onChanged: (value) {
              setState(() {
                userWarningText = "";
                userController.text = value;
                currentText = value;
              });
            },
            beforeTextPaste: (text) {
              // print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          )),
    );
  }
}

String convertString(String phoneNumber) {
  String a = phoneNumber;
  a.replaceRange(5, 8, "****");
  print("$a");
  return a;
}
