import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/network/api/api_network.dart';
import 'package:movie_app/network/models/booking_seat_request.dart';
import 'package:movie_app/network/models/booking_seat_response.dart';
import 'package:movie_app/page/booking_date_time_of_moive_page/booking_date_time_of_moive_page.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class BookingMovieSeat extends StatefulWidget {
  const BookingMovieSeat({super.key});

  @override
  State<BookingMovieSeat> createState() => _BookingMovieSeatState();
}

class _BookingMovieSeatState extends State<BookingMovieSeat> {
  MovieInforBooking data = MovieInforBooking(
      linkImage: "",
      endTime: "",
      idFirm: "",
      linkTrailer: "",
      nameCemina: "",
      typeMovie: "",
      date: "",
      startTime: "",
      nameMovie: "",
      price: 0,
      language: "");
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MovieInforBooking data =
          ModalRoute.of(context)!.settings.arguments as MovieInforBooking;
      _getListSeat(filmId: data.idFirm);
    });

    super.initState();
  }

  int countCopy = 0;
  List<String> listSeatCopy = [];
  bool _isLoading = false;
  List<List<Chair>> matrix = [];
  BookingSeatResponse bookingSeatResponse = BookingSeatResponse();

  _getListSeat({required String filmId}) async {
    var response = await CommondApi().getData(
        endPoint: "/api/cinemas/backend/reservations/$filmId",
        functioneError: () {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        bookingSeatResponse = BookingSeatResponse.fromJson(response.data);
        print("get list Seat Phim");
        matrix = ([
          [
            Chair(item: bookingSeatResponse.items?[0]),
            Chair(item: bookingSeatResponse.items?[1]),
            Chair(item: bookingSeatResponse.items?[2]),
            Chair(item: bookingSeatResponse.items?[3]),
            Chair(item: bookingSeatResponse.items?[4]),
            Chair(item: bookingSeatResponse.items?[5]),
            Chair(item: bookingSeatResponse.items?[6]),
            Chair(item: bookingSeatResponse.items?[7]),
            Chair(item: bookingSeatResponse.items?[8]),
            Chair(item: bookingSeatResponse.items?[9]),
          ],
          [
            Chair(item: bookingSeatResponse.items?[10]),
            Chair(item: bookingSeatResponse.items?[11]),
            Chair(item: bookingSeatResponse.items?[12]),
            Chair(item: bookingSeatResponse.items?[13]),
            Chair(item: bookingSeatResponse.items?[14]),
            Chair(item: bookingSeatResponse.items?[15]),
            Chair(item: bookingSeatResponse.items?[16]),
            Chair(item: bookingSeatResponse.items?[17]),
            Chair(item: bookingSeatResponse.items?[18]),
            Chair(item: bookingSeatResponse.items?[19]),
          ],
          [
            Chair(item: bookingSeatResponse.items?[20]),
            Chair(item: bookingSeatResponse.items?[21]),
            Chair(item: bookingSeatResponse.items?[22]),
            Chair(item: bookingSeatResponse.items?[23]),
            Chair(item: bookingSeatResponse.items?[24]),
            Chair(item: bookingSeatResponse.items?[25]),
            Chair(item: bookingSeatResponse.items?[26]),
            Chair(item: bookingSeatResponse.items?[27]),
            Chair(item: bookingSeatResponse.items?[28]),
            Chair(item: bookingSeatResponse.items?[29]),
          ],
          [
            Chair(item: bookingSeatResponse.items?[30]),
            Chair(item: bookingSeatResponse.items?[31]),
            Chair(item: bookingSeatResponse.items?[32]),
            Chair(item: bookingSeatResponse.items?[33]),
            Chair(item: bookingSeatResponse.items?[34]),
            Chair(item: bookingSeatResponse.items?[35]),
            Chair(item: bookingSeatResponse.items?[36]),
            Chair(item: bookingSeatResponse.items?[37]),
            Chair(item: bookingSeatResponse.items?[38]),
            Chair(item: bookingSeatResponse.items?[39]),
          ],
          [
            Chair(item: bookingSeatResponse.items?[40]),
            Chair(item: bookingSeatResponse.items?[41]),
            Chair(item: bookingSeatResponse.items?[42]),
            Chair(item: bookingSeatResponse.items?[43]),
            Chair(item: bookingSeatResponse.items?[44]),
            Chair(item: bookingSeatResponse.items?[45]),
            Chair(item: bookingSeatResponse.items?[46]),
            Chair(item: bookingSeatResponse.items?[47]),
            Chair(item: bookingSeatResponse.items?[48]),
            Chair(item: bookingSeatResponse.items?[49]),
          ],
          [
            Chair(item: bookingSeatResponse.items?[50]),
            Chair(item: bookingSeatResponse.items?[51]),
            Chair(item: bookingSeatResponse.items?[52]),
            Chair(item: bookingSeatResponse.items?[53]),
            Chair(item: bookingSeatResponse.items?[54]),
            Chair(item: bookingSeatResponse.items?[55]),
            Chair(item: bookingSeatResponse.items?[56]),
            Chair(item: bookingSeatResponse.items?[57]),
            Chair(item: bookingSeatResponse.items?[58]),
            Chair(item: bookingSeatResponse.items?[59]),
          ],
          [
            Chair(item: bookingSeatResponse.items?[60]),
            Chair(item: bookingSeatResponse.items?[61]),
            Chair(item: bookingSeatResponse.items?[62]),
            Chair(item: bookingSeatResponse.items?[63]),
            Chair(item: bookingSeatResponse.items?[64]),
            Chair(item: bookingSeatResponse.items?[65]),
            Chair(item: bookingSeatResponse.items?[66]),
            Chair(item: bookingSeatResponse.items?[67]),
            Chair(item: bookingSeatResponse.items?[68]),
            Chair(item: bookingSeatResponse.items?[69]),
          ],
          [
            Chair(item: bookingSeatResponse.items?[70]),
            Chair(item: bookingSeatResponse.items?[71]),
            Chair(item: bookingSeatResponse.items?[72]),
            Chair(item: bookingSeatResponse.items?[73]),
            Chair(item: bookingSeatResponse.items?[74]),
            Chair(item: bookingSeatResponse.items?[75]),
            Chair(item: bookingSeatResponse.items?[76]),
            Chair(item: bookingSeatResponse.items?[77]),
            Chair(item: bookingSeatResponse.items?[78]),
            Chair(item: bookingSeatResponse.items?[79]),
          ],
        ]);
        context.read<Calculator>().resest();
      });
    } else {
      Fluttertoast.showToast(
          msg: "Lỗi sever - Lấy danh sách ghế không thành công");
    }
  }

  _bookingTiket(
      {List<String>? chairIds,
      String? filmId,
      required Function functionSucess,
      required Function functionFail}) async {
    BookingSeatRequest bookingSeatResponse =
        BookingSeatRequest(chairIds: chairIds, filmId: filmId);
    var response = await CommondApi().postData(
        function: () {
          functionFail();
        },
        dataInput: bookingSeatResponse,
        endPoint: "/api/cinemas/backend/reservations");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Thành công booking Seat Phim");
      functionSucess();
      setState(() {
        _getListSeat(filmId: context.read<SetIdFirm>().idFirm);
      });
    } else {
      functionFail();
    }
  }

  @override
  Widget build(BuildContext context) {
    MovieInforBooking data =
        ModalRoute.of(context)!.settings.arguments as MovieInforBooking;
    return SafeArea(
        child: matrix.isNotEmpty
            ? Stack(
                children: [
                  Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: true,
                      leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30.s,
                          color: CommondColor.blackCommond,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.nameCemina,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CommondText.textSize18W400Black
                                  .copyWith(color: CommondColor.blackCommond)),
                          Row(
                            children: [
                              Text(
                                "Cimema 6",
                                style: TextStyle(
                                    color: CommondColor.blackCommond,
                                    fontSize: 14.s,
                                    fontWeight: FontWeight.w400),
                              ),
                              Gap(10.s),
                              Text(
                                data.date,
                                style: TextStyle(
                                    color: CommondColor.blackCommond,
                                    fontSize: 14.s,
                                    fontWeight: FontWeight.w400),
                              ),
                              Gap(10.s),
                              Expanded(
                                child: Text(
                                  "${data.startTime} ~ ${data.endTime}",
                                  style: TextStyle(
                                      color: CommondColor.blackCommond,
                                      fontSize: 14.s,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            Share.share(data.linkTrailer);
                          },
                          child: Icon(
                            Icons.reply,
                            size: 30.s,
                            color: CommondColor.blackCommond,
                          ),
                        ),
                      ],
                    ),
                    body: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InteractiveViewer(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: CommondColor.blackCommond.withOpacity(0.8),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 80.s),
                                  // color: Colors.red,
                                  child: Text(
                                    "MÀN HÌNH",
                                    style: CommondText.textSize18W600White
                                        .copyWith(fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.s),
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: matrix[0].length,
                                    children: matrix
                                        .expand((row) => row.map((val) {
                                              return val;
                                            }).toList())
                                        .toList(),
                                  ),
                                ),
                                Gap(20.s),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const _BuildTypeChair(
                                      name: 'Đang chọn',
                                      typeColors: Colors.yellowAccent,
                                    ),
                                    Gap(20.s),
                                    const _BuildTypeChair(
                                      name: 'Đã đặt',
                                      typeColors: Colors.white,
                                    ),
                                    Gap(20.s),
                                    _BuildTypeChair(
                                      name: 'Ghế thường',
                                      typeColors: Colors.grey.shade400,
                                    ),
                                  ],
                                ),
                                Gap(5.s),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _BuildTypeChair(
                                      name: 'Ghế VIP',
                                      typeColors: Colors.pink.shade700,
                                    ),
                                    Gap(20.s),
                                    _BuildTypeChair(
                                      name: 'SweetBox',
                                      typeColors: Colors.deepPurple.shade700,
                                    ),
                                    Gap(20.s),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: CommondColor.whiteCommond,
                          height: 100.s,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.s),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                data.nameMovie,
                                style: CommondText.textSize18W500Black,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "2D ",
                                        style: CommondText.textSize16W500,
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        data.language.isNotEmpty
                                            ? "Phụ đề tiếng Việt"
                                            : "",
                                        style: CommondText.textSize16W500,
                                      ),
                                    ],
                                  ),
                                  _buildInforTiket(context, data),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data.price.toInt() * context.watch<Calculator>().count}",
                                      style: CommondText.textSize16W600,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        "${context.watch<Calculator>().count} ghế",
                                        style: CommondText.textSize16W500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  if (_isLoading)
                    Container(
                        color: Colors.black45,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ))
                ],
              )
            : Container(
                color: Colors.black45,
                child: const Center(
                  child: CircularProgressIndicator(),
                )));
  }

  GestureDetector _buildInforTiket(
      BuildContext context, MovieInforBooking data) {
    return GestureDetector(
      onTap: () {
        if (context.read<Calculator>().listSeatCode.isNotEmpty) {
          setState(() {
            print("ĐẶT VÉ");
            _bookingTiket(
                filmId: data.idFirm,
                chairIds: context.read<Calculator>().listSeatCode,
                functionSucess: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.s, vertical: 10.s),
                      titlePadding: const EdgeInsets.all(0),
                      title: StatefulBuilder(
                        builder: (context, setState) => Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(data.linkImage)),
                            Positioned(
                                top: -15.s,
                                left: -15.s,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      print("SHOWW DIALOG");
                                    });
                                    Navigator.pop(context, true);
                                  },
                                  child: Icon(
                                    Icons.highlight_off,
                                    size: 30.s,
                                    color: CommondColor.whiteCommond,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(10.s),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              data.nameMovie,
                              style: CommondText.textSize18W500Black,
                            ),
                            Gap(15.s),
                            BuildRowInInforTiket(
                              content1: data.date,
                              title1: 'DATE : ',
                              title2: 'TIME : ',
                              content2: data.startTime,
                            ),
                            BuildRowInInforTiket(
                                content1: countCopy.toString(),
                                title1: 'TIKET : ',
                                title2: 'SEAT : ',
                                content2: listSeatCopy.toString()),
                            Gap(10.s),
                            Image.asset("assets/images2/image_code.jpg",
                                width: 150.s, height: 50.s, fit: BoxFit.fill),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                functionFail: () {
                  Fluttertoast.cancel();
                  Fluttertoast.showToast(
                      msg: "Lỗi sever - Đặt vé không thành công",
                      webShowClose: true);
                });
            context.read<YourTiket>().addTiket(
                inforTiket: InforTiket(
                    name: data.nameMovie,
                    seat: context.read<Calculator>().listSeat,
                    date: data.date,
                    time: data.startTime,
                    number: context.read<Calculator>().count));
            listSeatCopy = [...context.read<Calculator>().listSeat];
            countCopy = context.read<Calculator>().count;
          });
        } else {
          Fluttertoast.showToast(
              msg: "Bạn chưa chọn ghế ,mời bạn chọn ghế");
        }
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
    );
  }
}

class BuildRowInInforTiket extends StatelessWidget {
  const BuildRowInInforTiket({
    Key? key,
    required this.title1,
    required this.content1,
    required this.title2,
    required this.content2,
  }) : super(key: key);
  final String title1;
  final String content1;
  final String title2;
  final String content2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BuildInforTiket(
          title: title1,
          content: content1,
        ),
        _BuildInforTiket(
          title: title2,
          content: content2,
        )
      ],
    );
  }
}

class _BuildInforTiket extends StatelessWidget {
  const _BuildInforTiket({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.red[800],
              fontSize: 16.s,
              fontWeight: FontWeight.w500),
        ),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          content,
          style: TextStyle(
              color: Colors.black, fontSize: 16.s, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class _BuildTypeChair extends StatelessWidget {
  const _BuildTypeChair({
    Key? key,
    required this.name,
    required this.typeColors,
  }) : super(key: key);
  final String name;
  final Color typeColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        name != "Đã đặt"
            ? Container(
                alignment: Alignment.center,
                width: 15.s,
                height: 15.s,
                color: typeColors,
              )
            : Container(
                width: 15.s,
                height: 15.s,
                margin: EdgeInsets.all(1.s),
                padding: EdgeInsets.all(1.s),
                color: Colors.grey.shade300,
                child: Image.asset(
                  "assets/images2/image_x.png",
                  fit: BoxFit.fill,
                )),
        Padding(
          padding: EdgeInsets.only(left: 5.s),
          child: Text(
            name,
            style: CommondText.textSize14W500.copyWith(
                fontWeight: FontWeight.w400, color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}

class Chair extends StatefulWidget {
  Chair({
    super.key,
    this.isTap = false,
    required this.item,
  });
  bool isTap;
  final Items? item;

  @override
  State<Chair> createState() => _ChairState();
}

class _ChairState extends State<Chair> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.isTap);
        setState(() {
          if (context.read<Calculator>().count <= 0) {
            if (widget.item?.status == "UNBOOKED") {
              widget.isTap = !widget.isTap;
            }

            widget.item?.status == "UNBOOKED"
                ? widget.isTap
                    ? context.read<Calculator>().add()
                    : context.read<Calculator>().subtract()
                : null;
            widget.item?.status == "UNBOOKED"
                ? widget.isTap
                    ? context.read<Calculator>().addNameSeat(
                        widget.item?.chairName ?? "",
                        widget.item?.chairId ?? "")
                    : context.read<Calculator>().subtractNameSeat(
                        widget.item?.chairName ?? "",
                        widget.item?.chairId ?? "")
                : null;
          } else {
            if (context.read<Calculator>().count > 0 && widget.isTap == false) {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                  msg: "Bạn chỉ được đặt 1 vé", webShowClose: true);
            } else if (widget.isTap == true) {
              widget.isTap = !widget.isTap;
              widget.item?.status == "UNBOOKED"
                  ? widget.isTap
                      ? context.read<Calculator>().add()
                      : context.read<Calculator>().subtract()
                  : null;
              widget.item?.status == "UNBOOKED"
                  ? widget.isTap
                      ? context.read<Calculator>().addNameSeat(
                          widget.item?.chairName ?? "",
                          widget.item?.chairId ?? "")
                      : context.read<Calculator>().subtractNameSeat(
                          widget.item?.chairName ?? "",
                          widget.item?.chairId ?? "")
                  : null;
            }
          }
        });
      },
      child: widget.item?.status == "UNBOOKED"
          ? Container(
              margin: EdgeInsets.all(1.s),
              width: 20.s,
              height: 20.s,
              color: widget.isTap
                  ? Colors.yellow
                  : (widget.item?.type == "MANUAL")
                      ? Colors.grey.shade400
                      : Colors.pink.shade600,
              child: Center(
                  child: Text(
                overflow: TextOverflow.fade,
                widget.item?.chairName ?? "",
                style: TextStyle(fontSize: 11.s),
              )),
            )
          : Container(
              margin: EdgeInsets.all(1.s),
              padding: EdgeInsets.all(1.s),
              color: Colors.grey.shade300,
              child: Image.asset(
                "assets/images2/image_x.png",
                fit: BoxFit.fill,
              )),
    );
  }
}

class Calculator with ChangeNotifier {
  List<String> listSeat = [];
  List<String> listSeatCode = [];
  int count = 0;
  add() {
    count++;
    notifyListeners();
  }

  addNameSeat(String seat, String seatCode) {
    listSeat.add(seat);
    listSeatCode.add(seatCode);
    print("add ${listSeatCode.toList()}");
    print(listSeat.toList().toString());
    notifyListeners();
  }

  subtract() {
    count--;
    notifyListeners();
  }

  subtractNameSeat(String seat, String seatCode) {
    listSeat.remove(seat);
    listSeatCode.remove(seatCode);
    print(listSeat.toList());
    print("remove ${listSeatCode.toList()}");
    notifyListeners();
  }

  resest() {
    listSeatCode = [];
    listSeat = [];
    count = 0;
    notifyListeners();
  }
}

class InforTiket {
  InforTiket({
    required this.name,
    required this.seat,
    required this.date,
    required this.time,
    required this.number,
  });
  final String? name;
  final List<String?> seat;
  final String? date;
  final String? time;
  final int? number;
}

class YourTiket with ChangeNotifier {
  List<InforTiket> listTiket = [];
  addTiket({required InforTiket inforTiket}) {
    listTiket.add(inforTiket);
    notifyListeners();
  }
}
