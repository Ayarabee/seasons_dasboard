import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;
// https://cors-anywhere.herokuapp.com/
  static init()
  {
    dio = Dio(
        BaseOptions(
            baseUrl: "https://api.seasonsge.com",
            receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 5),
        )
    );
  }
  static Future<Response> getDate
      ({
    required String endPoint,
    Map <String,dynamic>? query,
  }) async
  {
    return await dio.get(
        endPoint,
        queryParameters: query
    );
  }

  static Future<Response> postDate
      ({
        required String endPoint,
        Map <String,dynamic>? query,
      }) async
  {
    return dio.post(
      endPoint,
      //queryParameters: query,
      data: FormData.fromMap(query!)
    );
  }

  static Future<Response> putDate
      ({
    required String url,
    required Map <String,dynamic> data,
    Map <String,dynamic>? query,
    String lang = 'en',
    String? token ,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type' : 'application/json',
      'lang':lang,
      'Authorization': token??''
    };
    return  dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }


}