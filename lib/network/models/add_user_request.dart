class AddUserRequest {
  String? title;
  int? userId;
  String? user;
  String? email;
  String? password;
  String? dateofbirth;
  String? gender;
  String? location;
  String? favorite;

  AddUserRequest(
      {this.title,
      this.userId,
      this.user,
      this.email,
      this.password,
      this.dateofbirth,
      this.gender,
      this.location,
      this.favorite});

  AddUserRequest.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    userId = json["userId"];
    user = json["user"];
    email = json["email"];
    password = json["password"];
    dateofbirth = json["dateofbirth"];
    gender = json["gender"];
    location = json["location"];
    favorite = json["favorite"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["userId"] = userId;
    _data["user"] = user;
    _data["email"] = email;
    _data["password"] = password;
    _data["dateofbirth"] = dateofbirth;
    _data["gender"] = gender;
    _data["location"] = location;
    _data["favorite"] = favorite;
    return _data;
  }
}
