class GetMovieNameResponse {
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

  GetMovieNameResponse(
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

  GetMovieNameResponse.fromJson(Map<String, dynamic> json) {
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

  GetMovieNameResponse copyWith({
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
      GetMovieNameResponse(
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
