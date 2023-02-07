class BookingSeatRequest {
  String? filmId;
  List<String>? chairIds;

  BookingSeatRequest({this.filmId, this.chairIds});

  BookingSeatRequest.fromJson(Map<String, dynamic> json) {
    filmId = json["filmId"];
    chairIds =
        json["chairIds"] == null ? null : List<String>.from(json["chairIds"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["filmId"] = filmId;
    if (chairIds != null) {
      _data["chairIds"] = chairIds;
    }
    return _data;
  }

  BookingSeatRequest copyWith({
    String? filmId,
    List<String>? chairIds,
  }) =>
      BookingSeatRequest(
        filmId: filmId ?? this.filmId,
        chairIds: chairIds ?? this.chairIds,
      );
}
