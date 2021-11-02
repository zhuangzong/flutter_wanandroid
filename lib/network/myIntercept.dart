import 'package:dio/dio.dart';

class MyIntercept extends Interceptor {
  var model = "1.0";

  var versionName = "2.1.0";

  var userToken = "";


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers.addAll({
      "xloanDeviceID": "deviceID",
      "xloanPlatform": "ANDROID",
      "xloanServer": "1.0",
      "xloanDeviceVersion": model,
      "xloanVersion": versionName,
      "x-auth-token": userToken,
    });

    super.onRequest(options, handler);

  }

}

