import 'package:dio/dio.dart';
import 'package:movie_app/commond/commond.dart';

class DioApp with DioMixin implements Dio {
  DioApp._([BaseOptions? optionsCommond]) {
    optionsCommond = BaseOptions(
        connectTimeout: Constanst.defaulTimeOut,
        receiveTimeout: Constanst.defaulTimeOut,
        sendTimeout: Constanst.defaulTimeOut,
        baseUrl: Constanst.baseURL);

    options = optionsCommond;
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("REQUEST");
          print(options.path);
          if (options.data != null) {
            print(options.data);
          }
        },
        onResponse: (response, handler) {
          print("RESPOSE");
          print(response.statusCode);
          if (response.data != null) {
            print(response.data);
          }
        },
        onError: (e, handler) {
          print("ERROR");
          print(e);
        },
      ),
    );
  }
  static get instanse => DioApp._();
}
