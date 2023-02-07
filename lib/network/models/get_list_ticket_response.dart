class GetListTicketResponse {
  List<Items>? items;
  Headers? headers;

  GetListTicketResponse({this.items, this.headers});

  GetListTicketResponse.fromJson(Map<String, dynamic> json) {
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

  GetListTicketResponse copyWith({
    List<Items>? items,
    Headers? headers,
  }) =>
      GetListTicketResponse(
        items: items ?? this.items,
        headers: headers ?? this.headers,
      );
}

class Headers {
  int? xPage;
  int? xTotalCount;
  int? xPagesCount;
  int? xPerPage;
  int? xNextPage;

  Headers(
      {this.xPage,
      this.xTotalCount,
      this.xPagesCount,
      this.xPerPage,
      this.xNextPage});

  Headers.fromJson(Map<String, dynamic> json) {
    xPage = json["x-page"];
    xTotalCount = json["x-total-count"];
    xPagesCount = json["x-pages-count"];
    xPerPage = json["x-per-page"];
    xNextPage = json["x-next-page"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["x-page"] = xPage;
    _data["x-total-count"] = xTotalCount;
    _data["x-pages-count"] = xPagesCount;
    _data["x-per-page"] = xPerPage;
    _data["x-next-page"] = xNextPage;
    return _data;
  }

  Headers copyWith({
    int? xPage,
    int? xTotalCount,
    int? xPagesCount,
    int? xPerPage,
    int? xNextPage,
  }) =>
      Headers(
        xPage: xPage ?? this.xPage,
        xTotalCount: xTotalCount ?? this.xTotalCount,
        xPagesCount: xPagesCount ?? this.xPagesCount,
        xPerPage: xPerPage ?? this.xPerPage,
        xNextPage: xNextPage ?? this.xNextPage,
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
  Information? information;

  Items(
      {this.id,
      this.chairId,
      this.chairName,
      this.filmId,
      this.status,
      this.type,
      this.price,
      this.information});

  Items.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    chairId = json["chairId"];
    chairName = json["chairName"];
    filmId = json["filmId"];
    status = json["status"];
    type = json["type"];
    price = json["price"];
    information = json["information"] == null
        ? null
        : Information.fromJson(json["information"]);
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
    if (information != null) {
      _data["information"] = information?.toJson();
    }
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
    Information? information,
  }) =>
      Items(
        id: id ?? this.id,
        chairId: chairId ?? this.chairId,
        chairName: chairName ?? this.chairName,
        filmId: filmId ?? this.filmId,
        status: status ?? this.status,
        type: type ?? this.type,
        price: price ?? this.price,
        information: information ?? this.information,
      );
}

class Information {
  String? userId;
  String? userName;
  String? bookedAt;

  Information({this.userId, this.userName, this.bookedAt});

  Information.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    userName = json["userName"];
    bookedAt = json["bookedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["userName"] = userName;
    _data["bookedAt"] = bookedAt;
    return _data;
  }

  Information copyWith({
    String? userId,
    String? userName,
    String? bookedAt,
  }) =>
      Information(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        bookedAt: bookedAt ?? this.bookedAt,
      );
}
