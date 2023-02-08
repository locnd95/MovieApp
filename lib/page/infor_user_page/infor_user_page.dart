import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_local_store.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/network/models/movie_data_api.dart';
import 'package:movie_app/page/booking_movie_seat_page/booking_movie_seat_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class InforUserPage extends StatefulWidget {
  const InforUserPage({super.key});

  @override
  State<InforUserPage> createState() => _InforUserPageState();
}

class _InforUserPageState extends State<InforUserPage> {
  MovieDataApi movieDataApi = MovieDataApi();
  bool isReadOnly = true;
  bool _isLoading = false;
  bool onChange = false;
  bool noActive = false;

  @override
  initState() {
    getValues();
    super.initState();
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
    print('Dispose used');
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
  String dateOfBirthWarningText = "";
  String genderWarningText = "";
  String locationWarningText = "";
  String favoriteCeminaWarningText = "";
  int radioIndexGender = 0;
  int radioIndexLocation = 0;
  int radioIndexFavoritCemina = 0;
  DateTime dateTime = DateTime.now();

  void getValues() async {
    userController.text = await LocalUserCommond.getUserName();
    phoneNumberController.text = await LocalUserCommond.getphoneNumber();
    emailController.text = await LocalUserCommond.getEmail();
    passwordController.text = await LocalUserCommond.getPassword();
    dateOfBirthController.text = await LocalUserCommond.getDateOfBirth();

    genderController.text = await LocalUserCommond.getGender();
    locationController.text = await LocalUserCommond.getLocation();
    favoriteCeminaController.text = await LocalUserCommond.getFavoritCemina();
  }

  void setValues({
    required String userNameInput,
    required String phoneNumberInput,
    required String emailInput,
    required String dateOfBirthInput,
    required String genderInput,
    required String locationInput,
    required String favoriteCimenaInput,
  }) {
    setState(() {
      LocalUserCommond.setUserName(userName: userNameInput);
      LocalUserCommond.setphoneNumber(phoneNumber: phoneNumberInput);
      LocalUserCommond.setEmail(email: emailInput);
      LocalUserCommond.setDateOfBirth(dateOfBirth: dateOfBirthInput);
      LocalUserCommond.setGender(gender: genderInput);
      LocalUserCommond.setLocation(location: locationInput);
      LocalUserCommond.setFavoritCemina(favoriteCimena: favoriteCimenaInput);
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
            appBar: AppBarCommond(
              titlle: "Thông tin tài khoản",
              isLeading: true,
              actionWidget: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isReadOnly = false;
                      noActive = true;
                      onChange = true;
                    });
                  },
                  child: Icon(
                    Icons.edit,
                    size: 24.s,
                    color: CommondColor.blackCommond,
                  ),
                )
              ],
            )
            // AppBar(
            // actions: [
            //   GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         isReadOnly = false;
            //         noActive = true;
            //         onChange = true;
            //       });
            //     },
            //     child: Icon(
            //       Icons.edit,
            //       size: 24.s,
            //       color: CommondColor.blackCommond,
            //     ),
            //   )
            // ],
            //   backgroundColor: Colors.white,
            //   automaticallyImplyLeading: true,
            //   elevation: 0,
            //   leading: GestureDetector(
            //     onTap: () => Navigator.pop(context),
            //     child: Icon(
            //       Icons.arrow_back,
            //       size: 30.s,
            //       color: CommondColor.redCommond,
            //     ),
            //   ),
            //   title: Text("Thông tn tài khoản",
            //       style: CommondText.textSize18W600White
            //           .copyWith(color: CommondColor.blackCommond)),
            // ),
            ,
            body: Form(
              onChanged: () {
                setState(() {
                  print("onchange");
                  userWarningText = "";
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
                      Gap(40.s),
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
                            // BuildWarningText(
                            //   inputController: passwordController,
                            //   text: passwordWarningText,
                            // ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      BuildWarningText(
                                        inputController: dateOfBirthController,
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
                              child: Text.rich(
                                  textAlign: TextAlign.start,
                                  TextSpan(
                                      text: "*",
                                      style: CommondText.textSize16W500
                                          .copyWith(
                                              color: CommondColor.redCommond),
                                      children: [
                                        TextSpan(
                                            text: "Thông tin bắt buộc",
                                            style: CommondText.textSize16W500)
                                      ])),
                            ),
                            Gap(20.s),
                            _buildElevatedButton(),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  // if (userController.text.isNotEmpty ||
                                  //     phoneNumberController.text.isNotEmpty ||
                                  //     emailController.text.isNotEmpty ||
                                  //     passwordController.text.isNotEmpty ||
                                  //     dateOfBirthController.text.isNotEmpty ||
                                  //     genderController.text.isNotEmpty ||
                                  //     locationController.text.isNotEmpty ||
                                  //     favoriteCeminaController
                                  //         .text.isNotEmpty) {

                                  setState(() {
                                    context.read<Calculator>().resest();
                                    context.read<CheckLogin>().logOut();
                                    LocalUserCommond.deleteUser();
                                    userController.text = "";
                                    phoneNumberController.text = "";
                                    emailController.text = "";
                                    dateOfBirthController.text = "";
                                    genderController.text = "";
                                    locationController.text = "";
                                    favoriteCeminaController.text = "";
                                  });

                                  Future.delayed(
                                    const Duration(seconds: 1),
                                    () {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Fluttertoast.showToast(
                                          msg: "Đăng xuất thành công",
                                          fontSize: 16.s);

                                      Future.delayed(
                                          const Duration(seconds: 1),
                                          () => Navigator.pushReplacementNamed(
                                              context, RouterName.homeScreen));
                                    },
                                  );

                                  // }
                                },
                                child: Text(
                                  "Đăng xuất",
                                  style: CommondText.textSize14W500
                                      .copyWith(color: Colors.blue),
                                ))
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
              child: const Center(child: CircularProgressIndicator()))
      ],
    ));
  }

  BuildLargeElevatedButton _buildElevatedButton() {
    return BuildLargeElevatedButton(
      notOTPtype: onChange,
      functionOnTap: () {
        onChange
            ? setState(() {
                emailController.text.isEmpty
                    ? emailWarningText = "Vui lòng nhập Email"
                    : "";
                userController.text.isEmpty
                    ? userWarningText = "Vui lòng nhập tên người dùng"
                    : "";
                phoneNumberController.text.isEmpty
                    ? phoneNumberWarningText =
                        "Vui lòng nhập số điện thoại"
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
                    ? favoriteCeminaWarningText =
                        "Vui lòng nhập Rạp yêu thích"
                    : "";

                if (userController.text.isNotEmpty &&
                    phoneNumberController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    dateOfBirthController.text.isNotEmpty &&
                    genderController.text.isNotEmpty &&
                    locationController.text.isNotEmpty &&
                    favoriteCeminaController.text.isNotEmpty) {
                  setState(() {
                    _isLoading = true;
                  });

                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      onChange = false;
                      _isLoading = false;
                    });
                    setValues(
                        userNameInput: userController.text,
                        emailInput: emailController.text,
                        dateOfBirthInput: dateOfBirthController.text,
                        genderInput: genderController.text,
                        locationInput: locationController.text,
                        favoriteCimenaInput: favoriteCeminaController.text,
                        phoneNumberInput: phoneNumberController.text);

                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Center(
                              child: Text(
                                "Thông báo",
                                style: CommondText.textSize18W500Black,
                              ),
                            ),
                            children: [
                              Center(
                                child: Text("Đổi thông tin thành công",
                                    style: CommondText.textSize16W500),
                              ),
                              Center(
                                child: TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Đóng",
                                        style: CommondText.textSize16W500)),
                              )
                            ],
                          );
                        });
                  });
                }
              })
            : null;
      },
      text: 'SỬA THÔNG TIN',
    );
  }

  BuildTextFormField _buildFavoriteCeminaForm(BuildContext context) {
    return BuildTextFormField(
      noActive: noActive,
      readOnly: isReadOnly,
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
      noActive: noActive,
      readOnly: isReadOnly,
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
      noActive: noActive,
      readOnly: isReadOnly,
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
      noActive: noActive,
      readOnly: isReadOnly,
      textRich: " *",
      textNormal: "Họ tên",
      textController: userController,
    );
  }

  BuildTextFormField _buildPhoneNumberForm() {
    return BuildTextFormField(
      noActive: noActive,
      readOnly: isReadOnly,
      textRich: " *",
      textNormal: "Số điện thoại",
      textController: phoneNumberController,
    );
  }

  BuildTextFormField _buildEmailForm() {
    return BuildTextFormField(
      noActive: noActive,
      readOnly: isReadOnly,
      textRich: " *",
      textNormal: "Email",
      textController: emailController,
    );
  }

  BuildTextFormField _buildDateOfBirthForm(BuildContext context) {
    return BuildTextFormField(
      noActive: noActive,
      readOnly: isReadOnly,
      radioFuncion: () {
        setState(() {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 230.s,
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
                                                print(
                                                    dateOfBirthController.text);
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
                        ),
                        Gap(20.s)
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

class BuildShowDialogNotification extends StatelessWidget {
  const BuildShowDialogNotification({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.fromLTRB(12, 12.0, 12, 16.0),
      title: Center(
        child: Text(
          "Thông báo",
          style: CommondText.textSize18W500Black,
        ),
      ),
      children: [
        Center(
          child: Text(content, style: CommondText.textSize16W500),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "ĐÓNG",
              style: TextStyle(fontSize: 16.s, fontWeight: FontWeight.w500),
            ))
      ],
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
        setState(() {
          widget.controller.text = widget.nameTittle;
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
