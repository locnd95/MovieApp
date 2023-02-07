class LoginRespon {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  int? iat;
  int? exp;

  LoginRespon(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.image,
      this.iat,
      this.exp});

  LoginRespon.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    email = json["email"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    gender = json["gender"];
    image = json["image"];
    iat = json["iat"];
    exp = json["exp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["username"] = username;
    _data["email"] = email;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["gender"] = gender;
    _data["image"] = image;
    _data["iat"] = iat;
    _data["exp"] = exp;
    return _data;
  }
}
