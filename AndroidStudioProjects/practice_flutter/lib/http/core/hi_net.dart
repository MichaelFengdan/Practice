
import 'package:practice_flutter/http/request/base_request.dart';

import 'hi_error.dart';
import 'hi_net_adapter.dart';
import 'mock_adapter.dart';

class HiNet{
  HiNet._();
  static HiNet _instance;
  static HiNet getInstance(){
    if(_instance==null){
      _instance=HiNet._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async{
    HiNetResponse response;
    var error;
    try{
      response=await send(request);
    } on HiNetError catch(exception){
      error=exception;
      if(exception.data is HiNetResponse){
        response=exception.data;
      }
      print(exception.message);
    }catch(e){
      error=e;
      printLog(e);
    }
    if(response==null){
      printLog(error);
    }
    var result=response.data;
    printLog(result);
    var stautsCode=response.statusCode;
    switch(stautsCode){
      case 200:
        return result;
      case 401:
        throw NeedLginError();
      case 403:
        throw NeedAuthError(result.toString(),data: result);
      default:
        throw HiNetError(stautsCode,result.toString(),data: result);
    }
  }

  Future<dynamic> send<T>(BaseRequest request) async{
    printLog('url:${request.url()}');
    ///使用mock发送请求
    HiNetAdapter adapter=MockAdatpter();
    return adapter.send(request);
  }

  void printLog(log){
    print('hi_net:${log.toString()}');
  }
}