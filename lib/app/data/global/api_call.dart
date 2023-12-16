import 'package:dio/dio.dart';
import 'package:weather_app/app/const.dart';


class ApiCall {
  // init
  // get data
  // post
  // delete
  // put
  static Dio dio = Dio();
  static void initData() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        // connectTimeout: Duration(seconds: 15),
        // receiveTimeout: Duration(seconds: 15),
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
