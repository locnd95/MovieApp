import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:sizer/sizer.dart';

class SettingPasswordPayment extends StatefulWidget {
  const SettingPasswordPayment({super.key});

  @override
  State<SettingPasswordPayment> createState() => _SettingPasswordPaymentState();
}

class _SettingPasswordPaymentState extends State<SettingPasswordPayment> {
  bool isShow = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cài đặt mật mã thanh toán",
                            style: CommondText.textSize16W600,
                          ),
                          Text(
                            "- Mật mã thanh toán dùng để xác minh các giao dịch thanh toán bằng Coupon ,Voucher ,Đổi điểm thưởng ,Thẻ ưu tiên ,Thẻ quà tặng .",
                            style: CommondText.textSize16W500,
                          ),
                          Text(
                            "- Mật mã thanh toán phải có đúng 6 chữ số và không được là 6 chữ số trùng nhau (VD :111111)",
                            style: CommondText.textSize16W500,
                          ),
                        ],
                      ),
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
                      textNormal: "Mật mã mới",
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
                      textNormal: "Nhập lại mật mã mới",
                      iconShow: const Icon(Icons.visibility_off),
                      iconOff: const Icon(Icons.visibility),
                    ),
                    Gap(40.s),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.s),
                      child: BuildLargeElevatedButton(
                          functionOnTap: () {
                            setState(() {
                              newPasswordController.text.isEmpty
                                  ? newPasswordWarningText =
                                      "Vui lòng nhập mật mã mới"
                                  : "";
                              confirmPasswordController.text.isEmpty
                                  ? confirmPasswordWarningText =
                                      "Vui lòng nhập lại mật mã mới"
                                  : "";
                              if (newPasswordController.text.isNotEmpty &&
                                  confirmPasswordController.text.isNotEmpty) {
                                if (newPasswordController.text !=
                                    confirmPasswordController.text) {
                                  newPasswordWarningText =
                                      "Mật mã không trùng nhau";
                                  confirmPasswordWarningText =
                                      "Mật mã không trùng nhau";
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
                                    "Cài đặt mật mã thành công",
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
                          text: "CÀI ĐẶT MẬT MÃ THANH TOÁN"),
                    )
                  ],
                )),
              ),
            )));
  }
}
