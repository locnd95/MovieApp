import 'package:dio/dio.dart';
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

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  List<Todos?> listTodo = [];
  bool _isLoading = false;
  bool _isLoadMore = false;
  int total = 30;
  int limit = 30;
  int skip = 0;
  ScrollController controller = ScrollController();
  @override
  initState() {
    _getTodoList(currentPage: skip);
    // print()
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if ((skip + 1) * limit < total) {
          setState(() {
            _isLoadMore = false;
            skip++;
          });
          _getTodoList(currentPage: skip);
        }
      }
    });
  }

  _getTodoList({required int currentPage}) async {
    _isLoading = currentPage == 0 ? true : false;
    _isLoadMore = currentPage > 0 ? true : false;

    Response response;
    Dio dio = Dio();
    response = await dio
        .get('https://dummyjson.com/todos?limit=$limit&skip=$currentPage');

    final GetTodoListResponse getTodoListResponse =
        GetTodoListResponse.fromJson(response.data);
    // print(response.data);

    setState(() {
      listTodo.addAll(getTodoListResponse.todos ?? []);
      total = getTodoListResponse.total ?? 30;
      _isLoadMore = false;
      _isLoading = false;
    });

    // setState(() {
    //   _isLoadMore = false;
    // });
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
        // AppBar(
        //   leading: GestureDetector(
        //     onTap: () => Navigator.pop(context),
        //     child: Icon(
        //       Icons.arrow_back,
        //       size: 30.s,
        //     ),
        //   ),
        //   title: Text(
        //     "Quên mật khẩu",
        //     style: CommondText.textSize18W600White
        //         .copyWith(fontWeight: FontWeight.w400),
        //   ),
        // ),
        body: RefreshIndicator(
          onRefresh: () async {
            listTodo = [];
            skip = 0;
            await _getTodoList(currentPage: 0);
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
                                    Navigator.pushReplacementNamed(context,
                                        RouterName.enterVerificationCodePage);
                                  }
                                }
                              });
                            },
                            text: "TIẾP TỤC"),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                          thickness: 2.s,
                        ),
                        itemCount: listTodo.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(listTodo[index]?.todo ?? ""),
                        ),
                      ),
                      if (_isLoadMore) const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16.s,
                right: 16.s,
                child: GestureDetector(
                  onTap: () {
                    controller.animateTo(0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.fastOutSlowIn);
                  },
                  child: Container(
                    padding: EdgeInsets.all(14.s),
                    decoration: const BoxDecoration(
                        color: Colors.cyan, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_upward,
                      size: 30.s,
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
        ),
      )),
    );
  }
}
