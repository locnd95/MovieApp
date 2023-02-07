import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalUserCommond {
  static const _localUserCommond = FlutterSecureStorage();
  static const _user = "userName";
  static const _phoneNumber = "phoneNumber";
  static const _email = "email";
  static const _password = "password";
  static const _dateOfBirth = "dateOfBirth";
  static const _gender = "gender";
  static const _location = "location";
  static const _favoriteCimena = "favoriteCimena";
  static const _id = "id";
  static const _image = "image";
  static const _token = "token";
  static const _tokenAdmin = "tokenAdmin";

  static Future<void> deleteUser() async {
    return await _localUserCommond.deleteAll();
  }

  static Future<void> setUserName({required String userName}) async {
    return await _localUserCommond.write(key: _user, value: userName);
  }

  static Future<String> getUserName() async {
    return await _localUserCommond.read(key: _user) ?? "";
  }

  static Future<void> setphoneNumber({required String phoneNumber}) async {
    return await _localUserCommond.write(key: _phoneNumber, value: phoneNumber);
  }

  static Future<String> getphoneNumber() async {
    return await _localUserCommond.read(key: _phoneNumber) ?? "";
  }

  static Future<void> setEmail({required String email}) async {
    return await _localUserCommond.write(key: _email, value: email);
  }

  static Future<String> getEmail() async {
    return await _localUserCommond.read(key: _email) ?? "";
  }

  static Future<void> setPassword({required String password}) async {
    return await _localUserCommond.write(key: _password, value: password);
  }

  static Future<String> getPassword() async {
    return await _localUserCommond.read(key: _password) ?? "";
  }

  static Future<void> setDateOfBirth({required String dateOfBirth}) async {
    return await _localUserCommond.write(key: _dateOfBirth, value: dateOfBirth);
  }

  static Future<String> getDateOfBirth() async {
    return await _localUserCommond.read(key: _dateOfBirth) ?? "";
  }

  static Future<void> setGender({required String gender}) async {
    return await _localUserCommond.write(key: _gender, value: gender);
  }

  static Future<String> getGender() async {
    return await _localUserCommond.read(key: _gender) ?? "";
  }

  static Future<void> setLocation({required String location}) async {
    return await _localUserCommond.write(key: _location, value: location);
  }

  static Future<String> getLocation() async {
    return await _localUserCommond.read(key: _location) ?? "";
  }

  static Future<void> setFavoritCemina({required String favoriteCimena}) async {
    return await _localUserCommond.write(
        key: _favoriteCimena, value: favoriteCimena);
  }

  static Future<String> getFavoritCemina() async {
    return await _localUserCommond.read(key: _favoriteCimena) ?? "";
  }

  static Future<void> setId({required String id}) async {
    return await _localUserCommond.write(key: _id, value: id);
  }

  static Future<String> getId() async {
    return await _localUserCommond.read(key: _id) ?? "";
  }

  static Future<void> setImage({required String image}) async {
    return await _localUserCommond.write(key: _image, value: image);
  }

  static Future<String> getImage() async {
    return await _localUserCommond.read(key: _image) ?? "";
  }

  static Future<String> getToken() async {
    return await _localUserCommond.read(key: _token) ?? "";
  }

  static Future<void> setToken({required String token}) async {
    return await _localUserCommond.write(key: _token, value: token);
  }

  static Future<String> getTokenAdmin() async {
    return await _localUserCommond.read(key: _tokenAdmin) ?? "";
  }

  static Future<void> setTokenAdmin({required String tokenAdmin}) async {
    return await _localUserCommond.write(key: _tokenAdmin, value: tokenAdmin);
  }
}
