import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_covert_date_time.dart';
import 'package:movie_app/network/models/movie_data_api.dart';

import 'package:movie_app/router/router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class BookingDateTimeOfMovie extends StatefulWidget {
  const BookingDateTimeOfMovie({super.key});

  @override
  State<BookingDateTimeOfMovie> createState() => _BookingDateTimeOfMovieState();
}

class _BookingDateTimeOfMovieState extends State<BookingDateTimeOfMovie> {
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<String> list = ["A", "B", "C", "D"];
    final data = ModalRoute.of(context)!.settings.arguments as Item;

    String timeStart = CommondConvertDateTime()
        .getStartTime(data.startTime ?? "2022-12-18T18:30:42.812Z");
    String timeEnd = CommondConvertDateTime()
        .getStartTime(data.endTime ?? "2022-12-18T20:30:42.812Z");
    String dateStart = CommondConvertDateTime()
        .getDate(data.startTime ?? "2022-12-18T18:30:42.812Z");
    MovieInforBooking movieInforBooking = MovieInforBooking(
      idFirm: data.id ?? "",
      nameCemina: "CGV VinCom Bà Triệu",
      typeMovie: "IMAX 3D",
      date: dateStart,
      nameMovie: data.title ?? "",
      price: data.price?.toDouble() ?? 0,
      language: data.language ?? "",
      startTime: timeStart,
      linkImage: data.thumbnail ?? "",
      linkTrailer: data.videoUrl ?? "",
      endTime: timeEnd,
    );

    return SafeArea(
        child: Scaffold(
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
        title: Text(data.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CommondText.textSize18W600White
                .copyWith(color: CommondColor.blackCommond)),
        actions: [
          Icon(
            Icons.reply,
            size: 30.s,
            color: CommondColor.blackCommond,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.s),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Định dạng phim",
                    style: CommondText.textSize16W500,
                  ),
                  TextButton(
                    child: Row(
                      children: [
                        Text(
                          "TẤT CẢ ",
                          style: CommondText.textSize18W400Black
                              .copyWith(color: CommondColor.redCommond),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.s, vertical: 20.s),
                            children: [
                              Text(
                                "TẤT CẢ",
                                style: CommondText.textSize18W400Black
                                    .copyWith(color: CommondColor.redCommond),
                              ),
                              const _BuildMoveType(type: "3D"),
                              const _BuildMoveType(type: "IMAX 3D"),
                              const _BuildMoveType(type: "2D"),
                              const _BuildMoveType(type: "4DX 3D"),
                            ]),
                      );
                    },
                  ),
                ],
              ),
            ),
            _buildCalendar(),
            _buildDateTime(),
            _BuildCemina(
                movieInforBooking: movieInforBooking,
                data: data,
                nameCemina: movieInforBooking.nameCemina,
                time1: "18:30",
                time2: "20:05",
                time3: "22:10"),
            _BuildCemina(
                movieInforBooking: movieInforBooking,
                data: data,
                nameCemina: "CGV Long Biên ",
                time1: "17:45",
                time2: "19:30",
                time3: "21:50"),
          ],
        ),
      ),
    ));
  }

  Container _buildDateTime() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Text(
            "Thứ ${_selectedDay.weekday} ,${_selectedDay.day} tháng ${_selectedDay.month} năm ${_selectedDay.year}",
            style: CommondText.textSize18W500Black.copyWith(
              color: CommondColor.whiteCommond,
            )),
      ),
    );
  }

  WeeklyDatePicker _buildCalendar() {
    return WeeklyDatePicker(
      selectedDay: _selectedDay,
      changeDay: (value) => setState(() {
        _selectedDay = value;
      }),
      enableWeeknumberText: false,
      weeknumberColor: const Color(0xFF57AF87),
      weeknumberTextColor: Colors.white,
      backgroundColor: CommondColor.blackCommond,
      weekdayTextColor: const Color(0xFF8A8A8A),
      digitsColor: Colors.white,
      selectedBackgroundColor: Colors.red,
      weekdays: const ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
      daysInWeek: 7,
    );
  }
}

class _BuildCemina extends StatelessWidget {
  const _BuildCemina({
    Key? key,
    required this.movieInforBooking,
    required this.data,
    required this.nameCemina,
    required this.time1,
    required this.time2,
    required this.time3,
  }) : super(key: key);

  final MovieInforBooking movieInforBooking;
  final Item data;
  final String nameCemina;
  final String time1;
  final String time2;
  final String time3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nameCemina, style: CommondText.textSize16W500),
          Row(
            children: [
              Text(
                movieInforBooking.typeMovie,
                style: CommondText.textSize16W400,
              ),
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  movieInforBooking.language,
                  style: CommondText.textSize16W400,
                ),
              )
            ],
          ),
          Row(
            children: [
              _BuildMoiveTime(
                  arguments: movieInforBooking,
                  idFirm: data.id ?? "",
                  timeMovie: time1),
              const Gap(10),
              _BuildMoiveTime(
                  arguments: movieInforBooking,
                  idFirm: data.id ?? "",
                  timeMovie: time2),
              const Gap(10),
              _BuildMoiveTime(
                  arguments: movieInforBooking,
                  idFirm: data.id ?? "",
                  timeMovie: time3),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildMoiveTime extends StatelessWidget {
  const _BuildMoiveTime({
    Key? key,
    required this.arguments,
    required this.idFirm,
    this.timeMovie,
  }) : super(key: key);
  final dynamic arguments;
  final dynamic idFirm;
  final String? timeMovie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SetIdFirm>().setFirm(idFirm);
        Navigator.pushNamed(context, RouterName.bookingMovieChair,
            arguments: arguments);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.s),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.s),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.s),
              border: Border.all(color: CommondColor.blackCommond)),
          child: Text(
            timeMovie ?? arguments.startTime,
            style: CommondText.textSize16W400,
          ),
        ),
      ),
    );
  }
}

class _BuildMoveType extends StatelessWidget {
  const _BuildMoveType({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.s),
      child: Text(type, style: CommondText.textSize18W400Black),
    );
  }
}

class MovieInforBooking {
  final String idFirm;
  final String endTime;
  final String nameCemina;
  final String typeMovie;
  final String date;
  final String startTime;
  final String nameMovie;
  final double price;
  final String language;
  final String linkImage;
  final String linkTrailer;
  MovieInforBooking({
    required this.linkImage,
    required this.endTime,
    required this.idFirm,
    required this.linkTrailer,
    required this.nameCemina,
    required this.typeMovie,
    required this.date,
    required this.startTime,
    required this.nameMovie,
    required this.price,
    required this.language,
  });
}

class SetIdFirm with ChangeNotifier {
  String idFirm = "";
  setFirm(String id) {
    idFirm = id;
    notifyListeners();
  }
}
