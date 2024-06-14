// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://localhost:3000/',
          receiveDataWhenStatusError: true,
          // everything after this has nothing to do with the news app
          headers: {
            'Content-Type': 'application/json',
            'Connection':  'keep-alive',
            'Accept':'application/json',
            'User-Agent': 'PostmanRuntime/7.37.3',
            'Accept-Encoding' : 'gzip, deflate, br',

          }),
    );
  }

// we can also put query as dynamic or we can leave it empty
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    //required query,
  }) async {
    dio.options.headers = {
      //'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token,
    };
    // =BaseOptions(
    //     headers:
    //     {
    //       'lang':lang,
    //       'Authorization':token,
    //
    //     }
    // );
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
    // Map<String,dynamic>  query,
  }) async {
    dio.options.headers = {
      //'Content-Type':'application/json',
      'lang': lang,
      //'Authorization':token,
      'authorization': 'Bearer ${token!}',
    };
    //     BaseOptions(
    //   headers:
    //   {
    //     'lang':lang,
    //     'Authorization':token,
    //
    //   }
    // );
    return dio.post(
      url,
      //queryParameters: query,
      data: data,
    );
  }

  static Future<Response> signUpandLoginPostData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
    // Map<String,dynamic>  query,
  }) async {
    dio.options.headers = {
      //'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token,
      //'authorization': 'Bearer'+' '+token!,
    };

    // return dio.post(url,
    //   //queryParameters: query,
    //   data: data,
    // );
      return await dio.post(url, data: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
    // Map<String,dynamic>  query,
  }) async {
    dio.options.headers = {
      //'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token,
    };
    //     BaseOptions(
    //   headers:
    //   {
    //     'lang':lang,
    //     'Authorization':token,
    //
    //   }
    // );
    return dio.put(
      url,
      //queryParameters: query,
      data: data,
    );
  }
}
