enum HttpMethod { GET, POST, DELETE }

///基础请求
abstract class BaseRequest {
  ///请求参数
  var pathParams;
  var userHttps = true;

  ///设置域名
  String authority() {
    return 'api.devio.org';
  }

  ///抽象方法
  HttpMethod httpMethod();

  ///请求链接的路径
  String path();

  ///请求连接
  String url() {
    Uri uri;
    var pathStr = path();

    ///http和https的切换
    if (userHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    print('url:${uri.toString()}');
    return uri.toString();
  }

  ///判断是否需要登录
  bool needLogin();

  Map<String,String>params=<String,String>{};

  ///添加参数
  BaseRequest add(String key,Object value){
    params[key]=value.toString();
    return this;
  }
  Map<String,dynamic>header=<String,dynamic>{};

  ///添加Header
  BaseRequest addHeader(String key,Object value){
    header[key]=value.toString();
    return this;
  }

}
