import 'package:intl/intl.dart';

class CommondConvertDateTime {
  String getTimeMovie(String timeStart, String timeEnd) {
    DateTime startMovie = DateTime.parse(timeStart);
    DateTime endMovie = DateTime.parse(timeEnd);
    Duration duration = startMovie.difference(endMovie).abs();
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    String timeMovie = '${hours * 60 + minutes} phút ';
    return timeMovie;
  }

  String getStartTime(String timeStart) {
    DateTime parseTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(timeStart);
    String startTimeParse = "${parseTime.hour}:${parseTime.minute}";
    return startTimeParse;
  }

  String getDate(String date) {
    DateTime parseTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    String dateStart = "${parseTime.day}/${parseTime.month}/${parseTime.year}";
    return dateStart;
  }
}
