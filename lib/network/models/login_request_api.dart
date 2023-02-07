class LoginRequestApi {
  String? phoneNumber;
  String? password;

  LoginRequestApi({this.phoneNumber, this.password});

  LoginRequestApi.fromJson(Map<String, dynamic> json) {
    phoneNumber = json["phoneNumber"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["phoneNumber"] = phoneNumber;
    _data["password"] = password;
    return _data;
  }

  LoginRequestApi copyWith({
    String? phoneNumber,
    String? password,
  }) =>
      LoginRequestApi(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
      );
}
