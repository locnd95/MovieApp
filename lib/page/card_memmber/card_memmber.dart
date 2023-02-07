import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:sizer/sizer.dart';

class CardMember extends StatefulWidget {
  const CardMember({super.key});

  @override
  State<CardMember> createState() => _CardMemberState();
}

class _CardMemberState extends State<CardMember> {
  TextEditingController cardNumberController = TextEditingController();
  String cardNumberWarningText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: const AppBarCommond(
                titlle: "Thay đổi mật khẩu",
                isLeading: true,
              ),
              body: Form(
                onChanged: () {
                  setState(() {
                    cardNumberWarningText = "";
                  });
                },
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.s),
                      child: BuildWarningText(
                          inputController: cardNumberController,
                          text: cardNumberWarningText),
                    ),
                    BuildTextFormField(
                      textController: cardNumberController,
                      textNormal: "Mã số thẻ CGV",
                    ),
                    Gap(40.s),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.s),
                      child: BuildLargeElevatedButton(
                          functionOnTap: () {
                            setState(() {
                              cardNumberController.text.isEmpty
                                  ? cardNumberWarningText =
                                      "Vui lòng nhập mật mã mới"
                                  : "";

                              if (cardNumberController.text.isNotEmpty) {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    alignment: Alignment.center,
                                    color: CommondColor.black54Commond,
                                    height: 50.s,
                                    child: Text(
                                      "Cài đặt mật mã thành công",
                                      style: CommondText.textSize18W500Black,
                                    ),
                                  ),
                                );
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () => Navigator.pop(context),
                                );
                              }
                            });
                          },
                          text: "ĐĂNG KÍ"),
                    ),
                    Gap(20.s),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.s),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Thẻ thành viên của bạn",
                            style: CommondText.textSize16W600,
                          ),
                          Gap(10.s),
                          Text(
                            "Moblie Card",
                            style: CommondText.textSize16W500,
                          ),
                          Text(
                            "1428043460346418",
                            style: CommondText.textSize16W500,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.s,
                      color: CommondColor.black45Commond,
                    )
                  ],
                )),
              ),
            )));
  }
}
