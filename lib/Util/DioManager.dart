import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/Config/Config.dart';
import 'package:task/Util/Storage.dart';

import 'BaseListEntity.dart';
import 'BaseReaponse.dart';
import 'ErrorEntity.dart';
import 'NWMethod.dart';

class DioManager {
  static final DioManager _shared = DioManager._internal();
  factory DioManager() => _shared;
  Dio dio;
  DioManager._internal(){
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: Config.host,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: 30000,
        receiveTimeout: 3000,
      );
      dio = Dio(options);
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>({NWMethod method, String api,Map params, Function(T) success, Function(ErrorEntity) error}) async {
    try {
      String Authorization = await Storage.getObject("Authorization");
      print(Authorization);
      print(api);
      Map<String,dynamic> map = {"Authorization":Authorization};
      Response response = await dio.request(api, queryParameters: params, options: Options(method: NWMethodValues[method],headers: map));
      if (response != null) {
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        if (entity.code == "200") {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: "500", message: "未知错误"));
      }
    } on DioError catch(e) {
      print(e);
    }
  }

  // 请求，返回参数为 List
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>({NWMethod method, String api, Map params, Function(List<T>) success, Function(ErrorEntity) error}) async {
    try {
      String Authorization = await Storage.getObject("Authorization");
      Map map = {"Authorization":Authorization};
      Response response = await dio.request(api, queryParameters: params, options: Options(method: NWMethodValues[method],headers: map));
      if (response != null) {
        BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
        if (entity.code == 200) {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: "500", message: "未知错误"));
      }
    } on DioError catch(e) {
      print(e);
    }
  }

  // // 错误信息
  // ErrorEntity createErrorEntity(DioError error) {
  //   switch (error.type) {
  //     case DioErrorType.cancel:{
  //       return ErrorEntity(code: -1, message: "请求取消");
  //     }
  //     break;
  //     case DioErrorType.connectTimeout:{
  //       return ErrorEntity(code: -1, message: "连接超时");
  //     }
  //     break;
  //     case DioErrorType.sendTimeout:{
  //       return ErrorEntity(code: -1, message: "请求超时");
  //     }
  //     break;
  //     case DioErrorType.receiveTimeout:{
  //       return ErrorEntity(code: -1, message: "响应超时");
  //     }
  //     break;
  //     case DioErrorType.response:{
  //       try {
  //         int errCode = error.response.statusCode;
  //         String errMsg = error.response.statusMessage;
  //         return ErrorEntity(code: errCode, message: errMsg);
  //       } on Exception catch(_) {
  //         return ErrorEntity(code: -1, message: "未知错误");
  //       }
  //     }
  //     break;
  //     default: {
  //       return ErrorEntity(code: -1, message: error.message);
  //     }
  //   }
  // }
}