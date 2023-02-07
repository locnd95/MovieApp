import 'package:dio/dio.dart';
import 'package:movie_app/commond/commond_local_store.dart';

class CommondApi {
  static const url = "http://66.42.54.109:8010";
  Dio dio = Dio();
  // String token = await LocalUserCommond.getToken();
  getData(
      {required String endPoint,
      String? tokenInput,
      required Function functioneError}) async {
    String token = await LocalUserCommond.getToken();
    print("get token =$token");

    print("$url$endPoint");
    dio.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      print("Lỗi call $e");
      functioneError();
    }));
    var response = await dio.get("$url$endPoint",
        options: Options(headers: {
          if (tokenInput == null)
            "Authorization": "Bearer $token"
          else
            "Authorization": "Bearer $tokenInput",
          "accept": "application/json",
        }));
    return response;
  }

  postData(
      {required dynamic dataInput,
      required String endPoint,
      required Function function}) async {
    String token = await LocalUserCommond.getToken();
    print("post token =$token");

    print("URL Bookingseat $url$endPoint");
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        function();
      },
    ));

    var response = await dio.post("$url$endPoint",
        data: dataInput,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "accept": "application/json",
          "Content-Type": "application/json"
        }));
    return response;
  }

  deleteData(
      {required String endPoint,
      required String idFirm,
      required String idChair,
      required Function function}) async {
    String token = await LocalUserCommond.getToken();
    print("delete token =$token");
    print("URL delete $url$endPoint$idFirm/$idChair");
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        function();
        print("Lỗi delete $e");
      },
    ));

    var response = await dio.delete("$url$endPoint$idFirm/$idChair",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "accept": "application/json"
        }));
    return response;
  }
}
