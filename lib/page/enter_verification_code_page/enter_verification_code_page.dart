import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/router/router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class EnterVerificationCode extends StatefulWidget {
  const EnterVerificationCode({super.key});

  @override
  State<EnterVerificationCode> createState() => _EnterVerificationCodeState();
}

class _EnterVerificationCodeState extends State<EnterVerificationCode> {
  TextEditingController userController = TextEditingController();
  String userWarningText = "";
  TextEditingController textEditingController = TextEditingController();
  String otpNumber = "";
  bool sendBack = false;
  int time = 60;
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
    return SafeArea(
        child: Scaffold(
      appBar: const AppBarCommond(
        titlle: "Nhập mã xác minh",
        isLeading: true,
        isBackgroundColor: true,
      ),
      //  AppBar(
      //   leading: GestureDetector(
      //     onTap: () => Navigator.pop(context),
      //     child: Icon(
      //       Icons.arrow_back,
      //       size: 30.s,
      //     ),
      //   ),
      //   title: Text(
      //     "Nhập mã xác minh",
      //     style: CommondText.textSize18W600White
      //         .copyWith(fontWeight: FontWeight.w400),
      //   ),
      // ),
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
            _buildElevatedButton(context),
            Gap(10.s),
            _buildCountdownTime(),
            Gap(10.s),
            if (sendBack)
              GestureDetector(
                  onTap: () {
                    setState(() {
                      sendBack = false;
                      timeController.restart();
                    });
                  },
                  child: Text("Gửi lại",
                      style: CommondText.textSize16W500
                          .copyWith(color: CommondColor.redCommond))),
          ],
        ),
      ),
    ));
  }

  Countdown _buildCountdownTime() {
    return Countdown(
      controller: timeController,
      seconds: time,
      build: (BuildContext context, double time) => isCheckOTP
          ? const Text("")
          : Text(
              "Gửi lại trong : ${time.toInt().toString()} giây",
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
      "Nhập mã xác minh đã được gửi đến số điện thoại 0346418055. Mỗi số điện thoại chỉ nhận được tối đa 3 mã trong 1 ngày",
      style: CommondText.textSize16W500,
    );
  }

  Form _buildElevatedButton(BuildContext context) {
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
              String b = convertString("0346418055");
              if (userController.text.isEmpty) {
                userWarningText = "Vui lòng nhập mã OTP";
              } else {
                if (userController.text != "999999") {
                  userWarningText = 'Mã OTP không đúng';
                } else {
                  isCheckOTP = true;
                  timeController.pause();
                  userWarningText = "";
                  Navigator.pushNamed(context, RouterName.testPage);
                }
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
  a.replaceRange(5, 8, "*****");
  return a;
}
