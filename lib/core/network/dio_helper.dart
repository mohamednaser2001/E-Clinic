

import 'package:dio/dio.dart';
import 'package:e_clinic/core/network/api_constants.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String ? token,
  })async{
    dio.options.headers={
      'Accept':'application/json',
      'Authorization': token??'',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }



  static Future<Response> postData({
    required String endPoint,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String ? token,
  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization': token??'',
    };
    return await dio.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> patchData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String ? token,
  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      'Authorization': token??'',
    };
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

}
