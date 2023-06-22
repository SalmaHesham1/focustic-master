import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static init() async {
    // final dio = Dio();
    // dio.post("https://focustic-2.000webhostapp.com/api/v1/login",
    // data: {
    //   "email":"Ahmedeed240@gmail.com",
    //   "password":"123456789!",
    // },
    // options: Options(
    //     receiveDataWhenStatusError: true,
    //     headers: {
    //     "Accept":"application/vnd.api+json",
    //     "Content-Type":"application/vnd.api+json",
    //   }
    // )
    // ).then((value) {
    //   print(value.data);
    // });
    // dio = Dio(BaseOptions(
    //   baseUrl: "https://focustic-2.000webhostapp.com",
    //   receiveDataWhenStatusError: true,
    //     headers: {
    //       "Accept": "application/vnd.api+json",
    //       'Content-Type': 'application/vnd.api+json',
    //     },
    // ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    // dio!.options = BaseOptions(
    //   headers: {},
    // );
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    required Map<String, dynamic> headers,
  }) async {
    final dio = Dio();
    dio.post(url,
        data: data,
        options: Options(
          receiveDataWhenStatusError: true,
          headers: headers,
        )
    ).then((value) {
      print(value.data);
      print(value.toString());
      return value.data;
    }).catchError((error) {
      print(error.toString());
    });
  }
// dio!.options = BaseOptions(
//   headers: {
//     "Accept": "application/vnd.api+json",
//     'Content-Type': 'application/vnd.api+json',
//   },
// );
//   return await dio!.post(
//     url,
//     data: data,
//   );
// }
}
