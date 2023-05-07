import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/network/api/api_network.dart';
import 'package:movie_app/network/models/creat_account_request.dart';
import 'package:movie_app/network/models/login_respose_api.dart';
import 'package:movie_app/network/models/movie_data_api.dart';
import 'package:movie_app/page/infor_user_page/infor_user_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  initState() {
    super.initState();
    // getValues();
  }

  @override
  void dispose() {
    userController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dateOfBirthController.dispose();
    genderController.dispose();
    locationController.dispose();
    favoriteCeminaController.dispose();
    super.dispose();
  }

  TextEditingController userController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController favoriteCeminaController = TextEditingController();
  bool isShow = true;
  String userWarningText = "";
  String emailWarningText = "";
  String phoneNumberWarningText = "";
  String passwordWarningText = "";
  String dateOfBirthWarningText = "";
  String genderWarningText = "";
  String locationWarningText = "";
  String favoriteCeminaWarningText = "";
  int radioIndexGender = 0;
  int radioIndexLocation = 0;
  int radioIndexFavoritCemina = 0;
  DateTime dateTime = DateTime.now();
  bool _isLoading = false;
  LoginResponseApi loginResponseApi = LoginResponseApi();
  MovieDataApi movieDataApi = MovieDataApi();
  creatAccount({
    required String userNameInput,
    required String phoneInput,
    required String emailInput,
    required String passwordInput,
    required String dateOfBirthInput,
    required String genderInput,
    required String locationInput,
    required String favoritCeminaInput,
  }) async {
    setState(() {
      _isLoading = true;
    });

    final creatAcountRequest = CreatAcountRequest(
        name: userNameInput,
        userName: userNameInput,
        email: emailInput,
        password: passwordInput,
        phoneNumber: phoneInput,
        imageUrl: "",
        roles: []);

    var response = await CommondApi().postData(
        dataInput: creatAcountRequest,
        endPoint: "/api/cinemas/backend/users",
        function: () {
          showDialog(
              context: context,
              builder: (context) => const BuildShowDialogNotification(
                  content: "Đăng kí không thành công"));
          setState(() {
            _isLoading = false;
          });
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      // onLoginSubmit(userNameInput: userNameInput, passwordInput: passwordInput);
      Fluttertoast.showToast(msg: "Đăng kí thành công");
      Future.delayed(
        const Duration(seconds: 2),
        () {
          return Navigator.pushReplacementNamed(context, RouterName.homeScreen);
        },
      );
      setState(() {
        userController.clear();
        phoneNumberController.clear();
        emailController.clear();
        passwordController.clear();
        dateOfBirthController.clear();
        genderController.clear();
        locationController.clear();
        favoriteCeminaController.clear();
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GestureDetector(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: const AppBarCommond(titlle: "Đăng kí", isLeading: true),
              body: Form(
                onChanged: () {
                  setState(() {
                    userWarningText = "";
                    passwordWarningText = "";
                    phoneNumberWarningText = "";
                    emailWarningText = "";
                    dateOfBirthWarningText = "";
                    genderWarningText = "";
                    locationWarningText = "";
                    favoriteCeminaWarningText = "";
                  });
                },
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images2/image_background_singin.jpg",
                          width: double.infinity,
                          height: 200.s,
                          fit: BoxFit.fitWidth,
                        ),
                        Gap(10.s),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.s),
                          child: Column(
                            children: [
                              BuildWarningText(
                                inputController: userController,
                                text: userWarningText,
                              ),
                              _buildFullNameForm(),
                              BuildWarningText(
                                inputController: phoneNumberController,
                                text: phoneNumberWarningText,
                              ),
                              _buildPhoneNumberForm(),
                              BuildWarningText(
                                inputController: emailController,
                                text: emailWarningText,
                              ),
                              _buildEmailForm(),
                              BuildWarningText(
                                inputController: passwordController,
                                text: passwordWarningText,
                              ),
                              _buildPasswordForm(),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        BuildWarningText(
                                          inputController:
                                              dateOfBirthController,
                                          text: dateOfBirthWarningText,
                                        ),
                                        _buildDateOfBirthForm(context),
                                      ],
                                    ),
                                  ),
                                  Gap(20.s),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        BuildWarningText(
                                          inputController: genderController,
                                          text: genderWarningText,
                                        ),
                                        _buildGenderForm(context),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              BuildWarningText(
                                inputController: locationController,
                                text: locationWarningText,
                              ),
                              _buildLocatationForm(context),
                              BuildWarningText(
                                inputController: favoriteCeminaController,
                                text: favoriteCeminaWarningText,
                              ),
                              _buildFavoriteCeminaForm(context),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.s, horizontal: 10.s),
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, RouterName.testPage),
                                  child: Text.rich(
                                      textAlign: TextAlign.start,
                                      TextSpan(
                                          text: "*",
                                          style: CommondText.textSize16W500
                                              .copyWith(
                                                  color:
                                                      CommondColor.redCommond),
                                          children: [
                                            TextSpan(
                                                text: "Thông tin bắt buộc",
                                                style:
                                                    CommondText.textSize16W500)
                                          ])),
                                ),
                              ),
                              Gap(20.s),
                              _buildElevatedButton(context),
                              Gap(20.s),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.s, horizontal: 10.s),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    _buildTextTermOfUse(context),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
                color: CommondColor.blackCommond.withOpacity(0.2),
                child: const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }

  Text _buildTextTermOfUse(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.start,
        TextSpan(
            text: "Khi đăng kí, tôi đã xem xét và đồng ý với ",
            style: CommondText.textSize16W500,
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pushNamed(
                        context, RouterName.termOfUse,
                        arguments: ArgumentsTermOfUse(
                            title: "Điều khoản Sử dụng",
                            linkWeb:
                                "https://www.cgv.vn/default/terms-conditions/")),
                  text: "Điều khoản Sử dụng ",
                  style: CommondText.textSize16W500.copyWith(
                      color: CommondColor.redCommond,
                      decoration: TextDecoration.underline)),
              TextSpan(text: "và ", style: CommondText.textSize16W500),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pushNamed(
                        context, RouterName.termOfUse,
                        arguments: ArgumentsTermOfUse(
                            title: "Chính Sách Bảo Mật",
                            linkWeb:
                                "https://www.cgv.vn/default/privacy-policy/")),
                  text: "Chính Sách Bảo Mật ",
                  style: CommondText.textSize16W500.copyWith(
                      color: CommondColor.redCommond,
                      decoration: TextDecoration.underline)),
              TextSpan(
                  text: "của CGV Việt Nam ",
                  style: CommondText.textSize16W500),
            ]));
  }

  BuildLargeElevatedButton _buildElevatedButton(BuildContext context) {
    return BuildLargeElevatedButton(
      functionOnTap: () {
        setState(() {
          emailController.text.isEmpty
              ? emailWarningText = "Vui lòng nhập Email"
              : "";
          userController.text.isEmpty
              ? userWarningText = "Vui lòng nhập tên người dùng"
              : "";

          // const patternEmail = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
          // final regExpEmail = RegExp(patternEmail);
          String patternPhoneNumber = r'(^(?:[+0]9)?[0-9]{10,12}$)';
          RegExp regExpPhoneNumber = RegExp(patternPhoneNumber);
          if (phoneNumberController.text.isEmpty) {
            phoneNumberWarningText = 'Vui lòng nhập số điện thoại';
          } else {
            if (!regExpPhoneNumber.hasMatch(phoneNumberController.text)) {
              phoneNumberWarningText = 'Số điện thoại không đúng';
            }
          }
          passwordController.text.isEmpty
              ? passwordWarningText = "Vui lòng nhập mật khẩu"
              : "";
          passwordController.text.length < 6
              ? passwordWarningText = "Mật khẩu có ít nhất 6 kí tự"
              : "";

          dateOfBirthController.text.isEmpty
              ? dateOfBirthWarningText = "Vui lòng nhập ngày sinh"
              : "";
          genderController.text.isEmpty
              ? genderWarningText = "Vui lòng nhập giới tính"
              : "";
          locationController.text.isEmpty
              ? locationWarningText = "Vui lòng nhập Khu vực"
              : "";
          favoriteCeminaController.text.isEmpty
              ? favoriteCeminaWarningText = "Vui lòng nhập Rạp yêu thích"
              : "";
          if (userWarningText.isEmpty &&
              phoneNumberWarningText.isEmpty &&
              emailWarningText.isEmpty &&
              passwordWarningText.isEmpty &&
              dateOfBirthWarningText.isEmpty &&
              genderWarningText.isEmpty &&
              locationWarningText.isEmpty &&
              favoriteCeminaWarningText.isEmpty) {
            creatAccount(
                dateOfBirthInput: dateOfBirthController.text,
                emailInput: emailController.text,
                favoritCeminaInput: favoriteCeminaController.text,
                locationInput: locationController.text,
                phoneInput: phoneNumberController.text,
                genderInput: genderController.text,
                userNameInput: userController.text,
                passwordInput: passwordController.text);

            SnackBar(
                content: Text(
              "Đăng kí thành công",
              style: CommondText.textSize16W500,
            ));
          }
        });
      },
      text: 'ĐĂNG KÍ',
    );
  }

  BuildTextFormField _buildFavoriteCeminaForm(BuildContext context) {
    return BuildTextFormField(
      textRich: " *",
      textController: favoriteCeminaController,
      textNormal: "Rạp yêu thích",
      iconShow: const Icon(Icons.arrow_drop_down),
      radioFuncion: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
              contentPadding:
                  EdgeInsets.only(left: 10.s, right: 10.s, bottom: 15.s),
              title: Center(
                  child: Text(
                "Chọn rạp",
                style: CommondText.textSize18W600White
                    .copyWith(color: CommondColor.blackCommond),
              )),
              children: [
                Column(
                  children: [
                    _BuildRadioList(
                      groupIndex: radioIndexFavoritCemina,
                      controller: favoriteCeminaController,
                      nameTittle: 'CGV Aeon Long Biên',
                      valueIndex: 1,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexFavoritCemina,
                      controller: favoriteCeminaController,
                      nameTittle: 'CGV Aeon Mall Hải Phòng',
                      valueIndex: 2,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexFavoritCemina,
                      controller: favoriteCeminaController,
                      nameTittle: 'CGV Aeon Tân Phú',
                      valueIndex: 3,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexFavoritCemina,
                      controller: favoriteCeminaController,
                      nameTittle: 'CGV Hồ Gươm Plaze',
                      valueIndex: 4,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexFavoritCemina,
                      controller: favoriteCeminaController,
                      nameTittle: 'CGV Tràng Tiền Plaza',
                      valueIndex: 5,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexFavoritCemina,
                      controller: favoriteCeminaController,
                      nameTittle: 'CGV Center Vincom Bà Triệu',
                      valueIndex: 6,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  BuildTextFormField _buildLocatationForm(BuildContext context) {
    return BuildTextFormField(
      textRich: " *",
      textController: locationController,
      textNormal: "Khu vực",
      iconShow: const Icon(Icons.arrow_drop_down),
      radioFuncion: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
              contentPadding:
                  EdgeInsets.only(left: 10.s, right: 10.s, bottom: 15.s),
              title: Center(
                  child: Text(
                "Khu vực",
                style: CommondText.textSize18W600White
                    .copyWith(color: CommondColor.blackCommond),
              )),
              children: [
                Column(
                  children: [
                    _BuildRadioList(
                      groupIndex: radioIndexLocation,
                      controller: locationController,
                      nameTittle: 'Hà Nội',
                      valueIndex: 1,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexLocation,
                      controller: locationController,
                      nameTittle: 'Hải Dương',
                      valueIndex: 2,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexLocation,
                      controller: locationController,
                      nameTittle: 'Hải Phòng',
                      valueIndex: 3,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexLocation,
                      controller: locationController,
                      nameTittle: 'Thanh Hóa',
                      valueIndex: 4,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexLocation,
                      controller: locationController,
                      nameTittle: 'Nghệ An',
                      valueIndex: 5,
                    ),
                    _BuildRadioList(
                      groupIndex: radioIndexLocation,
                      controller: locationController,
                      nameTittle: 'T.P Hồ Chí Minh',
                      valueIndex: 6,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  BuildTextFormField _buildGenderForm(BuildContext context) {
    return BuildTextFormField(
      textController: genderController,
      textNormal: "Giới tính",
      iconShow: const Icon(Icons.arrow_drop_down),
      radioFuncion: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
              contentPadding:
                  EdgeInsets.only(left: 10.s, right: 10.s, bottom: 15.s),
              title: Center(
                  child: Text(
                "Giới tính",
                style: CommondText.textSize18W600White
                    .copyWith(color: CommondColor.blackCommond),
              )),
              children: [
                Column(
                  children: [
                    _BuildRadioList(
                        groupIndex: radioIndexGender,
                        nameTittle: "Nam",
                        controller: genderController,
                        valueIndex: 1),
                    _BuildRadioList(
                        groupIndex: radioIndexGender,
                        nameTittle: "Nữ",
                        controller: genderController,
                        valueIndex: 2),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  BuildTextFormField _buildFullNameForm() {
    return BuildTextFormField(
      textRich: " *",
      textNormal: "Họ tên",
      textController: userController,
    );
  }

  BuildTextFormField _buildPhoneNumberForm() {
    return BuildTextFormField(
      textRich: " *",
      textNormal: "Số điện thoại",
      textController: phoneNumberController,
    );
  }

  BuildTextFormField _buildEmailForm() {
    return BuildTextFormField(
      textRich: " *",
      textNormal: "Email",
      textController: emailController,
    );
  }

  BuildTextFormField _buildPasswordForm() {
    return BuildTextFormField(
      textRich: "  *",
      textController: passwordController,
      isObscure: isShow,
      textNormal: "Mật khẩu",
      iconShow: const Icon(Icons.visibility_off),
      iconOff: const Icon(Icons.visibility),
    );
  }

  BuildTextFormField _buildDateOfBirthForm(BuildContext context) {
    return BuildTextFormField(
      radioFuncion: () {
        setState(() {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 200.s,
                      child: CupertinoDatePicker(
                        minimumYear: 1900,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: dateTime,
                        onDateTimeChanged: (dateTime) => setState(() {
                          this.dateTime = dateTime;
                        }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _BuildTextButtonShowDialog(
                          text: "HỦY",
                          onTapFuncion: () {
                            Navigator.pop(context);
                          },
                        ),
                        _BuildTextButtonShowDialog(
                          text: "OK",
                          onTapFuncion: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.s, horizontal: 15.s),
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${dateTime.day}-${dateTime.month}-${dateTime.year} có phải là ngày sinh của bạn",
                                          textAlign: TextAlign.start,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            _BuildTextButtonShowDialog(
                                              text: "KHÔNG",
                                              onTapFuncion: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            _BuildTextButtonShowDialog(
                                              text: "ĐỒNG Ý",
                                              onTapFuncion: () {
                                                // print(
                                                //     dateOfBirthController.text);
                                                dateOfBirthController.text =
                                                    "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
      },
      textController: dateOfBirthController,
      textNormal: "Ngày sinh",
      iconShow: const Icon(Icons.arrow_drop_down),
      // iconOff: const Icon(Icons.visibility),
    );
  }
}

class _BuildRadioList extends StatefulWidget {
  _BuildRadioList({
    Key? key,
    required this.groupIndex,
    required this.nameTittle,
    required this.controller,
    required this.valueIndex,
  }) : super(key: key);

  int groupIndex;
  final int valueIndex;
  final String nameTittle;
  final TextEditingController controller;

  @override
  State<_BuildRadioList> createState() => _BuildRadioListState();
}

class _BuildRadioListState extends State<_BuildRadioList> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(widget.nameTittle,
          style:
              CommondText.textSize16W600.copyWith(fontWeight: FontWeight.w500)),
      value: widget.valueIndex,
      groupValue: widget.groupIndex,
      onChanged: (value) {
        widget.controller.text = widget.nameTittle;
        setState(() {
          widget.groupIndex = value ?? 0;
        });
        Future.delayed(
          const Duration(
            milliseconds: 50,
          ),
          () => Navigator.pop(context),
        );
      },
    );
  }
}

class _BuildTextButtonShowDialog extends StatelessWidget {
  const _BuildTextButtonShowDialog({
    Key? key,
    required this.text,
    required this.onTapFuncion,
  }) : super(key: key);
  final String text;
  final void Function() onTapFuncion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTapFuncion();
        },
        child: Text(
          text,
          style: CommondText.textDialog,
        ),
      ),
    );
  }
}

class ArgumentsTermOfUse {
  final String title;
  final String linkWeb;
  ArgumentsTermOfUse({required this.title, required this.linkWeb});
}
