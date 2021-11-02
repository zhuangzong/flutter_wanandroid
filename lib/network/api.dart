import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan/app/utils/sp_utils.dart';
import 'package:wan/base/api_url.dart';
import 'package:wan/base/buildConfig.dart';
import 'package:wan/base/sp_constant.dart';
import 'package:wan/network/response/ApiResultEntityTransform.dart';
import 'package:wan/network/response/Transform.dart';

import 'intercept/base_intercept.dart';
import 'myIntercept.dart';

///http请求
class HttpManager {
  static final int CONNECR_TIME_OUT = 1000 * 10;
  static final int RECIVE_TIME_OUT = 1000 * 10;
  static final CONTENT_TYPE_JSON = "application/json;charset=UTF-8";
  static final CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Dio? _dio;
  var cookieJar = CookieJar();

  static Map<String, CancelToken> _cancelTokens =
      new Map<String, CancelToken>();

  HttpManager._internal() {
    initDio();
  }

  static HttpManager _httpManger = HttpManager._internal();

  factory HttpManager() {
    return _httpManger;
  }

  //get请求
  Future<T> get<T>(
    String url,
    ResponseTransform<T> transform, {
    Map<String, dynamic>? queryParameters,
    BaseIntercept? baseIntercept,
    bool isCancelable = true,
  }) {
    return _requstHttp<T>(
        url, transform, true, queryParameters, baseIntercept, isCancelable);
  }

  //post请求
  Future<T> post<T>(String url, ResponseTransform<T> transform,
      {Map<String, dynamic>? queryParameters,
      BaseIntercept? baseIntercept,
      bool isCancelable = true,
      bool isSHowErrorToast = true}) {
    return _requstHttp<T>(
        url, transform, false, queryParameters, baseIntercept, isCancelable);
  }

  Future<T> posts<T>(String url, ResponseTransform<T> transform,
      {Object? queryParameters,
      BaseIntercept? baseIntercept,
      bool isCancelable = true,
      bool isSHowErrorToast = true}) {
    return _requestHttp<T>(
        url, transform, queryParameters, baseIntercept!, isCancelable);
  }

  /// 参数说明  url 请求路径
  /// queryParamerers  是 请求参数
  /// transform 请求结果处理的转换器
  /// baseIntercept用于 加载loading 和 设置 取消CanselToken
  /// isCancelable 是设置改请求是否 能被取消 ， 必须建立在 传入baseWidget或者baseInnerWidgetState的基础之上
  Future<T> _requstHttp<T>(String url, ResponseTransform transform,
      [bool? isGet,
      queryParameters,
      BaseIntercept? baseIntercept,
      bool? isCancelable]) {
    Future<Response<String>> future;

//    PublishSubject<T> publishSubject = PublishSubject<T>();
    if (transform == null) {
      transform = ApiStringTransform(); //内置一个 返回String 的Transform
    }

    Completer<T> completer=new Completer();

    if(baseIntercept!=null){
      transform.setBaseIntercept(baseIntercept);
      _setInterceptOrcancelAble(baseIntercept, isCancelable!);
    }
    transform.setPublishPubject(completer);



    if (isGet!) {
      future = _dio!.get(url,
          queryParameters: queryParameters,);
    } else {
      future = _dio!.post(url, data: queryParameters,
        options: Options(contentType: Headers.formUrlEncodedContentType),);
    }

    future.then((data) {
      transform.apply(data.data!);
    }).catchError((err) {
      _doError(err, transform);
    });

    return completer.future;
  }


  Future<T> _requestHttp<T> (String url, ResponseTransform transform,
      [queryParameters,
      BaseIntercept? baseIntercept,
      bool? isCancelable]) async {

    if (transform == null) {
      transform = ApiStringTransform(); //内置一个 返回String 的Transform
    }

    Completer<T> completer=new Completer();

    transform.setBaseIntercept(baseIntercept!);
    transform.setPublishPubject(completer);

    _setInterceptOrcancelAble(baseIntercept, isCancelable!);

    // UserModelEntity userModelEntity = await UserModelEntity.getUserModelEntity();
    // RequestPublic requestPublic = new RequestPublic("", userModelEntity, queryParameters);
    // LogUtil.v(url + "---加密前---：" + json.encode(requestPublic));
    // //加密
    // var encrypts = await FlutterDes.encryptToBase64(
    //     json.encode(requestPublic), Constant.key,
    //     iv: Constant.iv);
    // //参数
    // Map<String, dynamic> params = {'': encrypts};
    //
    // Future<Response<String>> future = _dio.post(url,data: params,
    //     options: Options(contentType: Headers.formUrlEncodedContentType),
    //     cancelToken: cancelToken);
    //
    // // return await FlutterDes.decryptFromBase64(resultPublic.EncryptionJson, key,
    // //     iv: iv);
    // future.then((data) {
    //   ResultPublic resultPublic = ResultPublic.fromJson(json.decode(data.data));
    //   FlutterDes.decryptFromBase64(resultPublic.EncryptionJson, Constant.key, iv: Constant.iv)
    //       .then((value) {LogUtil.v("解密：" + value);
    //       transform.apply(value);});
    //   // (FlutterDes.decryptFromBase64(resultPublic.EncryptionJson, Constant.key, iv: Constant.iv).toString());
    // }).catchError((err) {
    //   _doError(err, transform);
    // });

    return completer.future;
  }

  ///取消请求
  static void cancelHttp(String tag) {
    if (_cancelTokens.containsKey(tag)) {
      if (!_cancelTokens[tag]!.isCancelled) {
        _cancelTokens[tag]!.cancel();
      }
      _cancelTokens.remove(tag);
    }
  }

  ///配置dio
  void initDio() async{
    _dio = Dio();


    /// 添加拦截器
   // _dio!.interceptors.add(MyIntercept());

    // 配置dio实例
    _dio!.options.baseUrl = Url.base_url;
    _dio!.options.connectTimeout = CONNECR_TIME_OUT; //5s
    _dio!.options.receiveTimeout = RECIVE_TIME_OUT;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dir = appDocDir.path + "/.cookies/";
    var cookieJar = PersistCookieJar(storage: FileStorage(dir));
    _dio!.interceptors.add(CookieManager(cookieJar));

//代理设置
    if (BuildConfig.isDebug) {
//      _dio.interceptors
//          .add(WhLogInterceptor(requestBody: true, responseBody: true));
      //此处可以增加配置项，留一个设置代理的用户给测试人员配置，然后动态读取

      String proxy=SpUtils.getString(SpConstant.httpProxyHost);

//      print("--prox----${proxy}----${SpUtils.getBool(SpConstanst.httpProxyEnable)}=====-");
      if(proxy!=null&&proxy!=""&&SpUtils.getBool(SpConstant.httpProxyEnable)) {
        (_dio!.httpClientAdapter as DefaultHttpClientAdapter)
            .onHttpClientCreate =
            (client) {
          // config the http client
          client.findProxy = (uri) {
            //proxy all request to localhost:8888
            return "PROXY " + SpUtils.getString(SpConstant.httpProxyHost);
          };


          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          // you can also create a new HttpClient to dio
          // return new HttpClient();
        };
      }
    } else {
      //证书配置 ， 忽略证书
      String PEM = "XXXXX"; // certificate content
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true; //返回 true 表明 忽略 证书校验
        };
      };
    }
  }


  ///测试是否真的 可以清除 的方法,用途仅为验证
  static void ListCancelTokens() {
    _cancelTokens.forEach((key, value) {
      print("$key-----cancel---");
    });
  }

  //配置是否 显示 loading 和 是否能被取消
  void _setInterceptOrcancelAble(
      BaseIntercept baseIntercept, bool isCancelable) {
    if (baseIntercept != null) {
      baseIntercept.beforeRequest();
    }
  }

  ///过滤网络出错的情况
  void _doError(err, ResponseTransform transform) {
    try {
      if (err is DioError) {
        if (err.type == DioErrorType.cancel) {
          print("---请求取消---");
        } else if (err.type == DioErrorType.connectTimeout ||
            err.type == DioErrorType.receiveTimeout) {
          transform.callError(MyError(400, "连接超时"));
        } else if (err.response != null) {
          transform
              .callError(MyError(err.response!.statusCode, "${err.message}"));
        } else {
          transform.callError(MyError(400, "${err.message}"));
        }
      } else if (err is SocketException) {
        transform.callError(MyError(400, "网路异常"));
      } else {
        transform.callError(MyError(1, err.toString()));
      }
    } catch (err2) {
      transform.callError(MyError(400, "网络异常，请稍后重试"));
    }
  }

}

class MyError {
  int? code;
  String? message;

  MyError(this.code, this.message);
}
