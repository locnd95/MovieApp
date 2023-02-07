class MovieDataApi {
  List<Item>? items;
  Headers? headers;

  MovieDataApi({this.items, this.headers});

  MovieDataApi.fromJson(Map<String, dynamic> json) {
    items = json["items"] == null
        ? null
        : (json["items"] as List).map((e) => Item.fromJson(e)).toList();
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

  MovieDataApi copyWith({
    List<Item>? items,
    Headers? headers,
  }) =>
      MovieDataApi(
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

class Item {
  String? id;
  String? title;
  String? slug;
  String? description;
  String? content;
  String? videoUrl;
  String? thumbnail;
  String? thumbnailMobile;
  String? category;
  String? director;
  String? actor;
  String? language;
  String? startTime;
  String? endTime;
  int? heartTotal;
  int? price;
  String? status;
  String? createdAt;

  Item(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.content,
      this.videoUrl,
      this.thumbnail,
      this.thumbnailMobile,
      this.category,
      this.director,
      this.actor,
      this.language,
      this.startTime,
      this.endTime,
      this.heartTotal,
      this.price,
      this.status,
      this.createdAt});

  Item.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    content = json["content"];
    videoUrl = json["videoUrl"];
    thumbnail = json["thumbnail"];
    thumbnailMobile = json["thumbnailMobile"];
    category = json["category"];
    director = json["director"];
    actor = json["actor"];
    language = json["language"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    heartTotal = json["heartTotal"];
    price = json["price"];
    status = json["status"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["slug"] = slug;
    _data["description"] = description;
    _data["content"] = content;
    _data["videoUrl"] = videoUrl;
    _data["thumbnail"] = thumbnail;
    _data["thumbnailMobile"] = thumbnailMobile;
    _data["category"] = category;
    _data["director"] = director;
    _data["actor"] = actor;
    _data["language"] = language;
    _data["startTime"] = startTime;
    _data["endTime"] = endTime;
    _data["heartTotal"] = heartTotal;
    _data["price"] = price;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    return _data;
  }

  Item copyWith({
    String? id,
    String? title,
    String? slug,
    String? description,
    String? content,
    String? videoUrl,
    String? thumbnail,
    String? thumbnailMobile,
    String? category,
    String? director,
    String? actor,
    String? language,
    String? startTime,
    String? endTime,
    int? heartTotal,
    int? price,
    String? status,
    String? createdAt,
  }) =>
      Item(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        description: description ?? this.description,
        content: content ?? this.content,
        videoUrl: videoUrl ?? this.videoUrl,
        thumbnail: thumbnail ?? this.thumbnail,
        thumbnailMobile: thumbnailMobile ?? this.thumbnailMobile,
        category: category ?? this.category,
        director: director ?? this.director,
        actor: actor ?? this.actor,
        language: language ?? this.language,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        heartTotal: heartTotal ?? this.heartTotal,
        price: price ?? this.price,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
}
