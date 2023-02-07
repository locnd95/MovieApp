class ListInforHotNew {
  final String linkImage;
  final String textTittle;
  final String period;
  final String? time;
  final String locationUse;
  final String content;
  final String userManaul;
  ListInforHotNew({
    required this.linkImage,
    required this.textTittle,
    required this.period,
    this.time,
    this.locationUse = "Website cgv.vn, ứng dụng CGV Cinemas, Quầy vé CGV",
    required this.content,
    this.userManaul = " Truy cập Website hoặc Ứng dụng CGV Cinemas.",
  });
}
