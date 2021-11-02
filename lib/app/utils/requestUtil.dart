

// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:wan/base/api_url.dart';
import 'package:wan/network/intercept/showloading_intercept.dart';
import 'package:wan/network/response/ApiFullTransform.dart';

import '../../network/api.dart';
import '../../network/bean/result_entity.dart';
import '../../network/intercept/base_intercept.dart';

class RequestUtils {
  static Future<ResultEntity> banner() {
    String url = Url.banner;
    return HttpManager().get(url, ApiFullTransform(),
        baseIntercept: ShowLoadingIntercept(Get.context!),
        isCancelable: false
    );
  }
  static Future<ResultEntity> mainList(int pageIndex) {
    String url = Url.mainList+"$pageIndex"+"/json?page_size=5";
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false
    );
  }
  static Future<ResultEntity> question(int pageIndex) {
    String url = Url.question+"$pageIndex"+"/json?page_size=10";
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false
    );
  }
  static Future<ResultEntity> mainTopList() {
    String url = Url.top;
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false
    );
  }
  static Future<ResultEntity> tree() {
    String url = Url.tree;
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false
    );
  }
  static Future<ResultEntity> navi() {
    String url = Url.navi;
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false
    );
  }
  static Future<ResultEntity> hotkey() {
    String url = Url.hotkey;
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false
    );
  }
  static Future<ResultEntity> userinfo() {
    String url = Url.userinfo;
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false
    );
  }
  static Future<ResultEntity> login(Map<String,dynamic> map) {
    String url = Url.login;
    return HttpManager().post(url, ApiFullTransform(),
        isCancelable: false,
        baseIntercept: ShowLoadingIntercept(Get.context!),
      queryParameters: map
    );
  }
  static Future<ResultEntity> register(Map<String,dynamic> map) {
    String url = Url.register;
    return HttpManager().post(url, ApiFullTransform(),
        isCancelable: false,
        baseIntercept: ShowLoadingIntercept(Get.context!),
      queryParameters: map
    );
  }
  static Future<ResultEntity> comments(String id) {
    String url = Url.comments+id+"/json";
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false,
    );
  }
  static Future<ResultEntity> article(int pageIndex,int cid) {
    String url = Url.article+pageIndex.toString()+"/json";
    Map<String,dynamic> map = {"cid":cid,"page_size":10};
    return HttpManager().get(url, ApiFullTransform(),
        queryParameters: map,
        isCancelable: false,
    );
  }
  static Future<ResultEntity> collected(int pageIndex) {
    String url = Url.collected+pageIndex.toString()+"/json";
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false,
    );
  }
  static Future<ResultEntity> query(int pageIndex,String key) {
    String url = Url.query+pageIndex.toString()+"/json";
    Map<String,dynamic> map = {"k":key,"page_size":10};
    return HttpManager().post(url, ApiFullTransform(),
        queryParameters: map,
        isCancelable: false,
      baseIntercept: ShowLoadingIntercept(Get.context!),
    );
  }
  static Future<ResultEntity> collect(int id) {
    String url = Url.collect+id.toString()+"/json";
    return HttpManager().post(url, ApiFullTransform(),
        isCancelable: false,
    );
  }
  static Future<ResultEntity> uncollect_originId(int id) {
    String url = Url.uncollect_originId+id.toString()+"/json";
    return HttpManager().post(url, ApiFullTransform(),
        isCancelable: false,
    );
  }
  static Future<ResultEntity> uncollect(int id) {
    String url = Url.uncollect+id.toString()+"/json";
    Map<String,dynamic> map = {"originId":-1};
    return HttpManager().post(url, ApiFullTransform(),
        queryParameters: map,
        isCancelable: false,
    );
  }
  static Future<ResultEntity> coin() {
    String url = Url.coin;
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false,
      baseIntercept: ShowLoadingIntercept(Get.context!),
    );
  }
  static Future<ResultEntity> coinList() {
    String url = Url.coinList;
    return HttpManager().get(url, ApiFullTransform(),
        isCancelable: false,
    );
  }
  static Future<ResultEntity> coinRank(int pageIndex) {
    String url = Url.coinRank+pageIndex.toString()+"/json";
    return HttpManager().get(url, ApiFullTransform(),
      isCancelable: false,
      baseIntercept: ShowLoadingIntercept(Get.context!),
    );
  }
}
