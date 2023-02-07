class LoginResponseApi {
  bool? success;
  Data? data;

  LoginResponseApi({this.success, this.data});

  LoginResponseApi.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  LoginResponseApi copyWith({
    bool? success,
    Data? data,
  }) =>
      LoginResponseApi(
        success: success ?? this.success,
        data: data ?? this.data,
      );
}

class Data {
  String? id;
  String? name;
  String? userName;
  String? phoneNumber;
  String? email;
  String? imageUrl;
  String? status;
  List<String>? roles;
  String? lastLoginAt;
  String? accessToken;

  Data(
      {this.id,
      this.name,
      this.userName,
      this.phoneNumber,
      this.email,
      this.imageUrl,
      this.status,
      this.roles,
      this.lastLoginAt,
      this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    userName = json["userName"];
    phoneNumber = json["phoneNumber"];
    email = json["email"];
    imageUrl = json["imageUrl"];
    status = json["status"];
    roles = json["roles"] == null ? null : List<String>.from(json["roles"]);
    lastLoginAt = json["lastLoginAt"];
    accessToken = json["accessToken"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["userName"] = userName;
    _data["phoneNumber"] = phoneNumber;
    _data["email"] = email;
    _data["imageUrl"] = imageUrl;
    _data["status"] = status;
    if (roles != null) {
      _data["roles"] = roles;
    }
    _data["lastLoginAt"] = lastLoginAt;
    _data["accessToken"] = accessToken;
    return _data;
  }

  Data copyWith({
    String? id,
    String? name,
    String? userName,
    String? phoneNumber,
    String? email,
    String? imageUrl,
    String? status,
    List<String>? roles,
    String? lastLoginAt,
    String? accessToken,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        imageUrl: imageUrl ?? this.imageUrl,
        status: status ?? this.status,
        roles: roles ?? this.roles,
        lastLoginAt: lastLoginAt ?? this.lastLoginAt,
        accessToken: accessToken ?? this.accessToken,
      );
}
