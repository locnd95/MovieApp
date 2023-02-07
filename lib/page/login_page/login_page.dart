import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_covert_date_time.dart';
import 'package:movie_app/commond/commond_large_elevated_button.dart';
import 'package:movie_app/commond/commond_local_store.dart';
import 'package:movie_app/commond/commond_text_form_fiel.dart';
import 'package:movie_app/commond/commond_warning_text.dart';
import 'package:movie_app/network/api/api_network.dart';
import 'package:movie_app/network/models/login_respose_api.dart';
import 'package:movie_app/network/models/login_request_api.dart';
import 'package:movie_app/page/infor_user_page/infor_user_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginResponseApi loginResponseApi = LoginResponseApi();
  bool _isLoading = false;
  onLoginSubmit(
      {required String userNameInput, required String passwordInput}) async {
    setState(() {
      _isLoading = true;
    });

    final loginRequestApi =
        LoginRequestApi(phoneNumber: userNameInput, password: passwordInput);

    var response = await CommondApi().postData(
        dataInput: loginRequestApi,
        endPoint: "/api/cinemas/auth/login",
        function: () {
          print("call funcion login");
          showDialog(
            context: context,
            builder: (context) => const BuildShowDialogNotification(
                content: "Tài khoản hoặc mật khẩu không đúng"),
          );
          setState(() {
            _isLoading = false;
          });
        });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        loginResponseApi;
        _isLoading = false;
        loginResponseApi = LoginResponseApi.fromJson(response.data);

        LocalUserCommond.setUserName(
            userName: loginResponseApi.data?.userName ?? "");
        LocalUserCommond.setphoneNumber(
            phoneNumber: loginResponseApi.data?.phoneNumber ?? "");
        LocalUserCommond.setEmail(email: loginResponseApi.data?.email ?? "");
        LocalUserCommond.setPassword(password: "123456");
        LocalUserCommond.setToken(
            token: loginResponseApi.data?.accessToken ?? "");
        LocalUserCommond.setDateOfBirth(
            dateOfBirth: CommondConvertDateTime().getDate(
                loginResponseApi.data?.lastLoginAt ??
                    "2023-01-19T17:09:00.628Z"));
        LocalUserCommond.setGender(gender: "Nam");
        LocalUserCommond.setLocation(location: "Hà Nội");
        LocalUserCommond.setFavoritCemina(
            favoriteCimena: "CGV Artemis Lê Trọng Tấn");
        LocalUserCommond.setId(id: loginResponseApi.data?.id ?? "");
        LocalUserCommond.setImage(image: loginResponseApi.data?.imageUrl ?? "");
        LocalUserCommond.setToken(
            token: loginResponseApi.data?.accessToken ?? "");
      });

      context.read<CheckLogin>().login();
      Future.delayed(
        const Duration(seconds: 1),
        () {
          return Navigator.pushReplacementNamed(context, RouterName.memberPage);
        },
      );
    }
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    print('Dispose used');
    super.dispose();
  }

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShow = true;
  String userWarningText = "";
  String passwordWarningText = "";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
              child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const AppBarCommond(
              titlle: "Đăng nhập",
            ),
            body: Form(
              onChanged: () {
                setState(() {
                  userWarningText = "";
                  passwordWarningText = "";
                });
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageBackGround(),
                    Gap(40.s),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.s),
                      child: Column(
                        children: [
                          BuildWarningText(
                            inputController: userController,
                            text: userWarningText,
                          ),
                          _buildFormName(),
                          BuildWarningText(
                            inputController: userController,
                            text: userWarningText,
                          ),
                          _buildFormPassword(),
                          Gap(30.s),
                          _buildButtonLogin(),
                          Gap(20.s),
                          _buildButtonForgotPW(context),
                          _buildTittleOr(),
                          _buildButtonSignin(context),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
        ),
        if (_isLoading)
          Container(
              color: CommondColor.blackCommond.withOpacity(0.2),
              child: const Center(child: CircularProgressIndicator())),
      ],
    );
  }

  GestureDetector _buildButtonSignin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.signUpPage);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: CommondColor.black54Commond,
              width: 1.s,
            ),
            borderRadius: BorderRadius.circular(20.s)),
        width: double.infinity,
        height: 40.s,
        child: Text(
          "Đăng kí tài khoản CGV",
          style: CommondText.textButton,
        ),
      ),
    );
  }

  Padding _buildTittleOr() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: Divider(thickness: 1, color: CommondColor.black45Commond),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.s),
            child: Text(
              "hoặc",
              style: CommondText.textSize12W500
                  .copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          const Flexible(
            child: Divider(thickness: 1, color: CommondColor.black45Commond),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildButtonForgotPW(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.forgotPasswordPage);
      },
      child: const Text("Quên mật khẩu",
          style: TextStyle(decoration: TextDecoration.underline)
          //  CommondText.textTittleButton,
          ),
    );
  }

  BuildLargeElevatedButton _buildButtonLogin() {
    return BuildLargeElevatedButton(
      functionOnTap: () {
        setState(() {
          userController.text.isEmpty
              ? userWarningText = "Vui lòng nhập Email hoặc số điện thoại"
              : "";
          passwordController.text.isEmpty
              ? passwordWarningText = "Vui lòng nhập mật khẩu"
              : "";
        });
        if (userController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          print("User not emty");
          onLoginSubmit(
              userNameInput: userController.text,
              passwordInput: passwordController.text);
        }
      },
      text: 'ĐĂNG NHẬP',
    );
  }

  BuildTextFormField _buildFormPassword() {
    return BuildTextFormField(
      textController: passwordController,
      isObscure: isShow,
      textNormal: "Mật khẩu",
      iconShow: const Icon(Icons.visibility_off),
      iconOff: const Icon(Icons.visibility),
    );
  }

  BuildTextFormField _buildFormName() {
    return BuildTextFormField(
      textNormal: "Email hoặc số điện thoại",
      textController: userController,
    );
  }

  Image _buildImageBackGround() {
    return Image.asset(
      "assets/images2/image_background_login.jpg",
      width: double.infinity,
      height: 180.s,
      fit: BoxFit.fitWidth,
    );
  }
}
