class CreatAcountRequest {
  String? name;
  String? userName;
  String? phoneNumber;
  String? email;
  String? imageUrl;
  List<dynamic>? roles;
  String? password;

  CreatAcountRequest(
      {this.name,
      this.userName,
      this.phoneNumber,
      this.email,
      this.imageUrl,
      this.roles,
      this.password});

  CreatAcountRequest.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    userName = json["userName"];
    phoneNumber = json["phoneNumber"];
    email = json["email"];
    imageUrl = json["imageUrl"];
    roles = json["roles"] ?? [];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["userName"] = userName;
    _data["phoneNumber"] = phoneNumber;
    _data["email"] = email;
    _data["imageUrl"] = imageUrl;
    if (roles != null) {
      _data["roles"] = roles;
    }
    _data["password"] = password;
    return _data;
  }

  CreatAcountRequest copyWith({
    String? name,
    String? userName,
    String? phoneNumber,
    String? email,
    String? imageUrl,
    List<dynamic>? roles,
    String? password,
  }) =>
      CreatAcountRequest(
        name: name ?? this.name,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        imageUrl: imageUrl ?? this.imageUrl,
        roles: roles ?? this.roles,
        password: password ?? this.password,
      );
}
