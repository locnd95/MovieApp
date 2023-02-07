class BookingSeatResponse {
  List<Items>? items;
  Headers? headers;

  BookingSeatResponse({this.items, this.headers});

  BookingSeatResponse.fromJson(Map<String, dynamic> json) {
    items = json["items"] == null
        ? null
        : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    headers =
        json["headers"] == null ? null : Headers.fromJson(json["headers"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    if (headers != null) {
      _data["headers"] = headers?.toJson();
    }
    return _data;
  }

  BookingSeatResponse copyWith({
    List<Items>? items,
    Headers? headers,
  }) =>
      BookingSeatResponse(
        items: items ?? this.items,
        headers: headers ?? this.headers,
      );
}

class Headers {
  int? xTotalCount;

  Headers({this.xTotalCount});

  Headers.fromJson(Map<String, dynamic> json) {
    xTotalCount = json["x-total-count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["x-total-count"] = xTotalCount;
    return _data;
  }

  Headers copyWith({
    int? xTotalCount,
  }) =>
      Headers(
        xTotalCount: xTotalCount ?? this.xTotalCount,
      );
}

class Items {
  String? id;
  String? chairId;
  String? chairName;
  String? filmId;
  String? status;
  String? type;
  int? price;

  Items(
      {this.id,
      this.chairId,
      this.chairName,
      this.filmId,
      this.status,
      this.type,
      this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    chairId = json["chairId"];
    chairName = json["chairName"];
    filmId = json["filmId"];
    status = json["status"];
    type = json["type"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["chairId"] = chairId;
    _data["chairName"] = chairName;
    _data["filmId"] = filmId;
    _data["status"] = status;
    _data["type"] = type;
    _data["price"] = price;
    return _data;
  }

  Items copyWith({
    String? id,
    String? chairId,
    String? chairName,
    String? filmId,
    String? status,
    String? type,
    int? price,
  }) =>
      Items(
        id: id ?? this.id,
        chairId: chairId ?? this.chairId,
        chairName: chairName ?? this.chairName,
        filmId: filmId ?? this.filmId,
        status: status ?? this.status,
        type: type ?? this.type,
        price: price ?? this.price,
      );
}
