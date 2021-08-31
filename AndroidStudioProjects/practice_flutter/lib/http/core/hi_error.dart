
///统一网络异常格式类
class HiNetError implements Exception{

  final int errorCode;
  final String message;
  final dynamic data;

  HiNetError(this.errorCode,this.message,{this.data});
}

///需要登录授权的异常
class NeedAuthError extends HiNetError{
  NeedAuthError(String message,{int code=403,dynamic data}) : super(code, message,data: data);
}

///需要登录的异常
class NeedLoginError extends HiNetError{
  NeedLoginError({String message='请登录',int code=401,dynamic data}) : super(code, message,data: data);
}