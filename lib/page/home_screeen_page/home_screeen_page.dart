import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_covert_date_time.dart';
import 'package:movie_app/commond/commond_local_store.dart';
import 'package:movie_app/commond/commond_onbackdialog.dart';
import 'package:movie_app/commond/commond_show_dialog.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/network/api/api_network.dart';
import 'package:movie_app/network/models/get_list_ticket_response.dart';
import 'package:movie_app/network/models/login_respose_api.dart';
import 'package:movie_app/network/models/movie_data_api.dart';
import 'package:movie_app/page/appbar_title.dart';
import 'package:movie_app/page/booking_movie_seat_page/booking_movie_seat_page.dart';
import 'package:movie_app/page/home_screeen_page/data_hotnew.dart';
import 'package:movie_app/page/home_screeen_page/sub_list_home_screen/content_hot_new.dart';
import 'package:movie_app/page/login_page/login_page.dart';
import 'package:movie_app/page/member_page/member_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../network/notification_service/notification_service.dart';
import 'sub_list_home_screen/content_cine.dart';
import 'sub_list_home_screen/content_offer_partner.dart';
import 'sub_list_home_screen/content_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetListTicketResponse getListTicketResponse = GetListTicketResponse();
  NotificationService notificationService = NotificationService();

  init() async {
    String deviceToken = await getDeviceToken();
    print("###### PRINT DEVICE TOKEN TO USE FOR PUSH NOTIFCIATION ######");
    print(deviceToken);
    print("############################################################");

    // listen for user to click on notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      print("Pin đây");
      String? title = remoteMessage.notification!.title;
      String? description = remoteMessage.notification!.body;
      if (remoteMessage.notification != null) {
        print('Notification Title: ${remoteMessage.notification!.title}');
        print('Notification Body: ${remoteMessage.notification!.body}');
        NotificationService().showNotification(title: title, body: description);
      }

      // im gonna have an alertdialog when clicking from push notification
      // Alert(
      //   context: context,
      //   type: AlertType.error,
      //   title: title, // title from push notification data
      //   desc: description, // description from push notifcation data
      //   buttons: [
      //     DialogButton(
      //       child: Text(
      //         "COOL",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ),
      //       onPressed: () => Navigator.pop(context),
      //       width: 120,
      //     )
      //   ],
      // ).show();
    });
    FirebaseMessaging.onMessage.listen((event) {
      print("Pin đây");
      String? title = event.notification!.title;
      String? description = event.notification!.body;
      if (event.notification != null) {
        print('Notification Title: ${event.notification!.title}');
        print('Notification Body: ${event.notification!.body}');
        NotificationService().showNotification(title: title, body: description);
      }
    });
  }

  Map<String, String> mapName = {};
  List<TypeMovie> listRandom = [
    TypeMovie(type: "P", color: Colors.green.shade700),
    TypeMovie(type: "C13", color: Colors.yellow.shade700),
    TypeMovie(type: "C16", color: Colors.orange),
    TypeMovie(type: "C18", color: Colors.red.shade700),
  ];
  final random = Random();
  MovieDataApi movieDataApi = MovieDataApi();
  final List<String> listType = ["2D", "3D", "4DX"];
  ListInforHotNew techcombankContent = ListInforHotNew(
      linkImage: 'assets/images/image_tech.jpg',
      textTittle: "MỞ TÀI KHOẢN -NHẬN HOÀN TIỀN",
      period: "14/10/2022 - 31/12/2022",
      content: """Chương trình “Mở tài khoản - 
      Nhận hoàn tiền” là chương trình ưu đãi đặc biệt dành cho Khách hàng cá nhân mới chưa là khách hàng hiện hữu của Techcombank.""");
  List<AgrumentCircleContent> listAgrumentCircleContent = [
    AgrumentCircleContent(
      list1: ListAssetInfor(
          linkImage: "assets/images/image_cimina.jpg",
          textImage: "THUÊ RẠP & VÉ NHÓM",
          linkWeb: 'https://www.cgv.vn/default/cinemas/sale'),
      list2: ListAssetInfor(
          linkImage: "assets/images/logo_tech2.jpg",
          textImage: "MỞ TÀI KHOẢN - NHẬN HOÀN TIỀN",
          linkWeb: 'https://www.cgv.vn/default/gift-card'),
      list3: ListAssetInfor(
          linkImage: "assets/images/image_4dx.png",
          textImage: "4DX",
          linkWeb: 'https://www.cgv.vn/default/theaters/special/4dx'),
    ),
    AgrumentCircleContent(
      list1: ListAssetInfor(
          linkImage: "assets/images/image_sweetbox.jpg",
          textImage: "SWEAT BOX",
          linkWeb: 'https://www.cgv.vn/default/theaters/special/sweetbox'),
      list2: ListAssetInfor(
          linkImage: "assets/images/image_giaitri.jpg",
          textImage: "GIẢI TRÍ CÙNG CGV",
          linkWeb: 'https://www.cgv.vn/default/theaters/special/cine-suite'),
      list3: ListAssetInfor(
          linkImage: "assets/images/image_giaoducdienanh.jpg",
          textImage: "GIÁO DỤC ĐIỆN ẢNH",
          linkWeb:
              'https://www.cgv.vn/default/newsoffer/giao-duc-cung-dien-anh/'),
    ),
  ];
  List<String> listContentsType = ['Đang chiếu', "Đặc biệt", "Sắp chiếu"];
  double currentCircleView = 0;
  int currentIndex = 0;
  int _currentIconButtom = 0;
  int indexMovie = 0;
  final PageController pageController = PageController();
  CarouselController controller = CarouselController();

  @override
  void initState() {
    init();
    _onSubmit();
    _checkLogin();
    _getListTicket();
    notificationService.initNotification();
    super.initState();
  }

  _checkLogin() async {
    if (await LocalUserCommond.getphoneNumber() != "") {
      context.read<CheckLogin>().login();
      print("checkLoginfirst");
    }
  }

  _deleteTicket(
      {required String endPointInput,
      required String idFirmInput,
      required String idChairInput,
      required Function function}) async {
    var response = await CommondApi().deleteData(
        endPoint: endPointInput,
        idFirm: idFirmInput,
        idChair: idChairInput,
        function: () {
          Fluttertoast.showToast(msg: "Xóa không thành công", fontSize: 16.s);
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      Fluttertoast.showToast(msg: "Xóa vé thành công");
      function();
    } else {
      Fluttertoast.showToast(
          msg: "Lỗi sever - Xóa không thành công", fontSize: 16.s);
    }
  }

  _getListTicket() async {
    var response = await CommondApi().getData(
        endPoint: "/api/cinemas/backend/reservations/tickets",
        functioneError: () {});
    if (response.statusCode == 200 || response.statusCode == 201) {
      getListTicketResponse = GetListTicketResponse.fromJson(response.data);
      setState(() {
        print("list Ticket lenght ${getListTicketResponse.items?.length}");
        getListTicketResponse;
      });
    } else {
      Fluttertoast.showToast(
          msg: "Lỗi sever - Lấy danh sách không thành công");
    }
  }

  _loginAdmin() async {
    LoginResponseApi loginResponseApi = LoginResponseApi();
    var response = await CommondApi().postData(
        dataInput: {"phoneNumber": "0981248920", "password": "veryverysecret"},
        endPoint: "/api/cinemas/auth/login",
        function: () {
          print("token hết hạn, call API Admin");
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        loginResponseApi = LoginResponseApi.fromJson(response.data);
        print(loginResponseApi);

        LocalUserCommond.setTokenAdmin(
            tokenAdmin: loginResponseApi.data?.accessToken ?? "");
        _onSubmit();
      });
    } else {
      Fluttertoast.showToast(
          msg: "Lỗi sever - Login API Admin không thành công");
    }
  }

  _onSubmit() async {
    String tokenAdmin = await LocalUserCommond.getTokenAdmin();
    var response;
    response = await CommondApi().getData(
        endPoint: "/api/cinemas/admin/films",
        tokenInput: tokenAdmin,
        functioneError: () {
          // if (response.statusCode == 401) {
          print("call loginAdmin");
          _loginAdmin();
          // }
        });
    print("${response.statusCode} top");

    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        print(response.statusCode);
        movieDataApi = MovieDataApi.fromJson(response.data);
        for (int i = 0; i < movieDataApi.items!.length; i++) {
          mapName[movieDataApi.items?[i].id ?? ""] =
              movieDataApi.items?[i].title ?? "";
        }
      });
    } else {
      Fluttertoast.showToast(msg: "Lỗi sever - Login không thành công");
    }
  }

  @override
  Widget build(BuildContext context) {
    return movieDataApi.items != null
        ? RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: WillPopScope(
              onWillPop: () {
                return onBackDialog(context);
              },
              child: SafeArea(
                child: Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                      backgroundColor: Colors.black87,
                      currentIndex: _currentIconButtom,
                      iconSize: 30.s,
                      type: BottomNavigationBarType.fixed,
                      onTap: (value) {
                        setState(() {
                          pageController.jumpToPage(value);
                          _currentIconButtom = value;
                          if (_currentIconButtom == 2) {
                            getListTicketResponse;
                          }
                        });
                      },
                      unselectedItemColor: Colors.grey,
                      fixedColor: Colors.blue.shade400,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home,
                            ),
                            label: "Home"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.theaters), label: "Movies"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.bookmark), label: "Ticket"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle), label: "Person"),
                      ]),
                  extendBodyBehindAppBar: true,
                  appBar: _currentIconButtom == 0
                      ? null
                      : _currentIconButtom == 1
                          ? AppBar(
                              title: Text(
                                "Chọn phim của bạn",
                                style: CommondText.textSize18W500Black,
                              ),
                              automaticallyImplyLeading: false,
                              elevation: 0,
                              backgroundColor: Colors.red.shade600,
                            )
                          : _currentIconButtom == 2
                              ? const AppBarCommond(
                                  titlle: "Vé của bạn",
                                  isBackgroundColor: true,
                                )
                              : null,
                  body: PageView(
                    onPageChanged: (value) => setState(() {
                      _currentIconButtom = value;
                      print(_currentIconButtom);
                      if (_currentIconButtom == 2) {
                        setState(() {
                          _getListTicket();
                        });
                      }
                    }),
                    controller: pageController,
                    children: [
                      _buildFirstPage(context),
                      _buildPageSecon(),
                      _buildPageThird(context),
                      _buildPageFourth()
                    ],
                  ),
                ),
              ),
            ),
          )
        : _buildLoadingDataScreen();
  }

  Scaffold _buildPageThird(BuildContext context) {
    return Scaffold(
      backgroundColor: CommondColor.backroundCommond,
      body: SingleChildScrollView(
        child: getListTicketResponse.items?.length == 0 ||
                !context.read<CheckLogin>().check
            ? Column(
                children: [
                  Gap(300.s),
                  Icon(
                    Icons.search,
                    size: 40.s,
                    color: Colors.grey,
                  ),
                  Center(
                    child: Text(
                      "Không có dữ liệu",
                      style: CommondText.textSize18W500Black,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Gap(20.s),
                  ListView.separated(
                    separatorBuilder: (context, index) => Gap(20.s),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: getListTicketResponse.items?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return BuildSimpleDialog(
                                content:
                                    "Bạn có muốn hủy vé xem phim này không ?",
                                firstButtonName: "Có",
                                secondButtonName: "Không",
                                onTapFuncionFirst: () {
                                  _deleteTicket(
                                      function: () {
                                        _getListTicket();
                                      },
                                      endPointInput:
                                          "/api/cinemas/backend/reservations/",
                                      idFirmInput: getListTicketResponse
                                              .items?[index].filmId ??
                                          "",
                                      idChairInput: getListTicketResponse
                                              .items?[index].chairId ??
                                          "");
                                  Navigator.pop(context);
                                },
                                onTapFuncionSecond: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(horizontal: 30.s),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.s),
                                child: Column(children: [
                                  Gap(15.s),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.s),
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      mapName[getListTicketResponse
                                                  .items?[index].filmId ??
                                              ""] ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.s,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Gap(10.s),
                                  BuildRowInInforTiket(
                                    content2: CommondConvertDateTime()
                                        .getStartTime(getListTicketResponse
                                                .items?[index]
                                                .information
                                                ?.bookedAt ??
                                            "2023-01-27T03:51:40.423Z"),
                                    title1: 'DATE : ',
                                    title2: 'TIME : ',
                                    content1: CommondConvertDateTime().getDate(
                                        getListTicketResponse.items?[index]
                                                .information?.bookedAt ??
                                            "2023-01-27T03:51:40.423Z"),
                                  ),
                                  BuildRowInInforTiket(
                                    content1: "1",
                                    title1: 'TIKET : ',
                                    title2: 'SEAT : ',
                                    content2: getListTicketResponse
                                            .items?[index].chairName ??
                                        "",
                                  ),
                                  Gap(10.s),
                                  Image.asset("assets/images2/image_code.jpg",
                                      width: 150.s,
                                      height: 50.s,
                                      fit: BoxFit.fill),
                                  Gap(15.s),
                                ]),
                              ),
                            ),
                            Positioned(
                              left: 20.s,
                              top: -10.s,
                              child: CircleAvatar(
                                backgroundColor: CommondColor.backroundCommond,
                                radius: 10.s,
                              ),
                            ),
                            Positioned(
                              right: 20.s,
                              top: -10.s,
                              child: CircleAvatar(
                                backgroundColor: CommondColor.backroundCommond,
                                radius: 10.s,
                              ),
                            ),
                            Positioned(
                              right: 20.s,
                              bottom: -10.s,
                              child: CircleAvatar(
                                backgroundColor: CommondColor.backroundCommond,
                                radius: 10.s,
                              ),
                            ),
                            Positioned(
                              left: 20.s,
                              bottom: -10.s,
                              child: CircleAvatar(
                                backgroundColor: CommondColor.backroundCommond,
                                radius: 10.s,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }

  Consumer<CheckLogin> _buildPageFourth() {
    return Consumer<CheckLogin>(
      builder: (context, value, child) =>
          value.check ? const MemberPage() : const LoginPage(),
    );
  }

  SingleChildScrollView _buildPageSecon() {
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: movieDataApi.items?.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<CheckLogin>().check
                        ? Navigator.pushNamed(
                            context, RouterName.bookingDateTimeOfMovie,
                            arguments: movieDataApi.items?[index])
                        : pageController.jumpToPage(3);
                  },
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: CommondColor.grayCommond),
                          ),
                        ),
                        height: 140.s,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              movieDataApi.items?[index].thumbnailMobile ?? "",
                              fit: BoxFit.fill,
                              width: 95.s,
                              height: 140.s,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 10.s,
                                  left: 10.s,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movieDataApi.items?[index].title ?? "",
                                      style: CommondText.textSize18W500Black,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      CommondConvertDateTime().getTimeMovie(
                                          movieDataApi
                                                  .items?[index].startTime ??
                                              "",
                                          movieDataApi.items?[index].endTime ??
                                              ""),
                                      style: CommondText.textSize16W500,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      CommondConvertDateTime().getDate(
                                          movieDataApi
                                                  .items?[index].startTime ??
                                              ""),
                                      style: CommondText.textSize16W500,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Gap(15.s),
                                        itemCount: 3,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            _BuildTypeMoive(
                                          type: listType[index],
                                        ),
                                      ),
                                    ),
                                    Gap(5.s),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.s),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18.s,
                        ),
                      )
                    ],
                  ),
                )));
  }

  SingleChildScrollView _buildFirstPage(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                    opacity: const AlwaysStoppedAnimation(0.9),
                    "assets/images/image_backround_tet.jpg",
                    width: double.infinity,
                    height: 650.s,
                    fit: BoxFit.cover),
                Column(
                  children: [
                    buildAppBarTitle(context, listInforHotNew),
                    Gap(10.s),
                    _buildTextContentMovie(),
                    _buildListMovieMain(context, movieDataApi),
                    _buildNameMovie(context, movieDataApi),
                  ],
                ),
              ],
            ),
            _buildMapSearch(),
            Container(
              color: Colors.grey.shade300,
              padding: EdgeInsets.all(10.s),
              child: Column(
                children: [
                  Gap(10.s),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouterName.detailContentImage,
                            arguments: techcombankContent);
                      },
                      child: Assets.images.imageTech.image()),
                  Gap(20.s),
                  CarouselSlider(
                      items: listAgrumentCircleContent
                          .map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, RouterName.webViewPage,
                                        arguments: e.list1),
                                    child: _BuildCircleView(
                                      assetLink: e.list1.linkImage,
                                      assetText: e.list1.textImage,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, RouterName.webViewPage,
                                        arguments: e.list2),
                                    child: _BuildCircleView(
                                      assetLink: e.list2.linkImage,
                                      assetText: e.list2.textImage,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, RouterName.imax4DX,
                                        arguments: e.list3.textImage),
                                    child: _BuildCircleView(
                                      assetLink: e.list3.linkImage,
                                      assetText: e.list3.textImage,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentCircleView = index.toDouble();
                            });
                          },
                          viewportFraction: 1,
                          height: 135.s)),
                  DotsIndicator(
                    dotsCount: listAgrumentCircleContent.length,
                    position: currentCircleView,
                  ),
                ],
              ),
            ),
            Gap(10.s),
            Column(
              children: [
                buildTittleHotNew(context),
                Gap(20.s),
                buildContentHotNew(context),
                Gap(30.s),
                buildTittleVideo(context),
                Gap(20.s),
                buildContentVideo(),
                Gap(30.s),
                buildTittleCineChannel(),
                Gap(20.s),
                buildContentCineChannel(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.s),
                  child: Divider(
                    thickness: 8.s,
                    color: Colors.grey.shade400,
                  ),
                ),
                buildOfferPartner(),
                buildContentOfferPartner(listInforHotNew, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SafeArea _buildLoadingDataScreen() {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ));
  }

  Container _buildNameMovie(BuildContext context, MovieDataApi data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.s, vertical: 10.s),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    data.items?[indexMovie].title ?? "",
                    style: CommondText.textSize18W600White,
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    listRandom[random.nextInt(listRandom.length)].type,
                    style: TextStyle(
                        color:
                            listRandom[random.nextInt(listRandom.length)].color,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (context.read<CheckLogin>().check) {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(context,
                                          RouterName.bookingDateTimeOfMovie,
                                          arguments: data.items?[indexMovie]);
                                    } else {
                                      Navigator.pop(context);

                                      setState(() {
                                        pageController.jumpToPage(3);
                                        _currentIconButtom = 3;
                                      });
                                    }
                                  },
                                  child: const Text("Đặt vé phim này"),
                                ),
                                Divider(
                                  height: 2.s,
                                  color: CommondColor.blackCommond,
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (context.read<CheckLogin>().check) {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(context,
                                          RouterName.bookingDateTimeOfMovie,
                                          arguments: data.items?[indexMovie]);
                                    } else {
                                      Navigator.pop(context);

                                      setState(() {
                                        pageController.jumpToPage(3);
                                        _currentIconButtom = 3;
                                      });
                                    }
                                  },
                                  child: const Text("Đặt vé theo Rạp"),
                                ),
                                Divider(
                                  height: 2.s,
                                  color: CommondColor.blackCommond,
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (context.read<CheckLogin>().check) {
                                      Navigator.pop(context);
                                      pageController.jumpToPage(1);
                                    } else {
                                      Navigator.pop(context);
                                      pageController.jumpToPage(3);
                                      setState(() {
                                        // _currentIconButtom = 3;
                                      });
                                    }
                                  },
                                  child: const Text("Đặt vé theo Phim"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Hủy bỏ",
                                style:
                                    TextStyle(color: CommondColor.blackCommond),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.s, vertical: 3.s),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15.s),
                  border: Border.all(color: CommondColor.black54Commond)),
              child: Center(
                child: Text("ĐẶT VÉ",
                    style: CommondText.textSize16W500Black54.copyWith(
                      color: CommondColor.whiteCommond,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildListMovieMain(BuildContext context, MovieDataApi data) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.s,
      ),
      child: CarouselSlider(
          carouselController: controller,
          items: data.items
              ?.map(
                (item) => GestureDetector(
                  onTap: () {
                    if (context.read<CheckLogin>().check) {
                      // print(item.thumbnailMobile);
                      Navigator.pushNamed(context, RouterName.movie,
                          arguments: DataItems(
                              listInforHotNew: listInforHotNew, item: item));
                    } else {
                      setState(() {
                        // Navigator.pushNamed(context, RouterName.loginPage);
                        pageController.jumpToPage(3);
                        _currentIconButtom = 3;
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.s),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          item.thumbnailMobile ?? "",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(12.s),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              height: 380.s,
              onPageChanged: (index, reason) {
                setState(() {
                  indexMovie = index;
                });
              },
              viewportFraction: 0.7,
              aspectRatio: 1 / 1.8)),
    );
  }

  Future<void> refresh() {
    print(refresh);
    return _onSubmit();
  }

  Row _buildTextContentMovie() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              controller.animateToPage(
                0,
                duration: const Duration(milliseconds: 500),
              );
              currentIndex = 0;
            });
          },
          child: _BuildContentTypeMovie(
            index: currentIndex,
            title: 'Đang chiếu',
            indexOfPage: 0,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              controller.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
              );

              currentIndex = 1;
            });
          },
          child: _BuildContentTypeMovie(
            index: currentIndex,
            indexOfPage: 1,
            title: 'Đặc biệt',
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              controller.animateToPage(
                4,
                duration: const Duration(milliseconds: 500),
              );

              currentIndex = 2;
            });
          },
          child: _BuildContentTypeMovie(
            index: currentIndex,
            indexOfPage: 2,
            title: 'Sắp chiếu',
          ),
        ),
      ],
    );
  }

  GestureDetector _buildMapSearch() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.mapPage);
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.s, vertical: 8.s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tìm rạp gần bạn...",
                style: TextStyle(color: Colors.grey, fontSize: 14.s),
              ),
              const Icon(
                Icons.near_me_outlined,
                color: Colors.grey,
              )
            ],
          )
          // TextFormField(
          //   decoration: InputDecoration(
          //       border: InputBorder.none,
          //       hintText: "Tìm rạp gần bạn...",
          //       hintStyle: TextStyle(color: Colors.grey, fontSize: 14.s),
          //       suffixIcon: const Icon(
          //         Icons.near_me_outlined,
          //         color: Colors.grey,
          //       )),
          // ),
          ),
    );
  }
}

class _BuildTypeMoive extends StatelessWidget {
  const _BuildTypeMoive({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.s), border: Border.all()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.s),
        child: Text(
          // textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          type,
          style: TextStyle(
            fontSize: 16.s,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _BuildContentTypeMovie extends StatelessWidget {
  const _BuildContentTypeMovie({
    Key? key,
    required this.index,
    required this.title,
    required this.indexOfPage,
  }) : super(key: key);

  final int index;
  final int indexOfPage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: index == indexOfPage
          ? CommondText.textSize14W500
          : CommondText.textSize14W500.copyWith(color: Colors.blue),
    );
  }
}

class _BuildCircleView extends StatelessWidget {
  const _BuildCircleView({
    Key? key,
    required this.assetLink,
    required this.assetText,
  }) : super(key: key);
  final String assetLink;
  final String assetText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.s,
          height: 70.s,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage(assetLink), fit: BoxFit.fill),
          ),
        ),
        Gap(10.s),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          assetText,
          style: TextStyle(
              fontSize: 14.s, height: 1.4, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class AgrumentCircleContent {
  final ListAssetInfor list1;
  final ListAssetInfor list2;
  final ListAssetInfor list3;

  AgrumentCircleContent({
    required this.list1,
    required this.list2,
    required this.list3,
  });
}

class ListAssetInfor {
  final String linkImage;
  final String textImage;
  final String linkWeb;
  ListAssetInfor({
    required this.linkWeb,
    required this.linkImage,
    required this.textImage,
  });
}

class DataItems {
  final List<ListInforHotNew> listInforHotNew;
  final Item item;
  DataItems({
    required this.listInforHotNew,
    required this.item,
  });
}

class ListVideosContent {
  final String linkVideo;
  final String linkImage;
  final String contentVideo;
  ListVideosContent(
      {required this.linkVideo,
      required this.linkImage,
      required this.contentVideo});
}

class TypeMovie {
  TypeMovie({
    required this.type,
    required this.color,
  });
  final String type;
  final Color color;
}
