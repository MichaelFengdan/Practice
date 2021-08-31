

import 'dart:convert';

import 'package:practice_flutter/http/request/base_request.dart';

abstract class HiNetAdapter{
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}

///统一的网络层返回格式
class HiNetResponse<T>{

  HiNetResponse({this.data, this.request, this.statusCode, this.statusMessage, this.extra});
  ///返回的数据
  T data;
  ///需要带上请求
  BaseRequest request;
  ///返回状态码
  int statusCode;
  ///返回状态信息
  String statusMessage;
  ///一些额外的数据
  dynamic extra;

  @override
  String toString() {
    if(data==null){
      return '';
    }
    if(data is Map){
      return jsonEncode(data);
    }
    return data.toString();
  }

}


