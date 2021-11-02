import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:wan/app/data/repository/comments_entity.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/network/bean/result_entity.dart';
import 'package:webview_flutter/webview_flutter.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PageDetailController extends GetxController{

  var url = "".obs;
  var id = "".obs;
  var author = "".obs;
  var progress = 0.obs;
  var commentsList = [].obs;
  late WebViewController webViewController;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    id.value = Get.parameters["id"]!;
    author.value = Get.parameters["author"]!;
    if(Get.parameters["url"]!.startsWith("https")){
      url.value = Get.parameters["url"]!;
    }else{
      url.value = Get.parameters["url"]!.replaceAll("http", "https");
    }
    getComments();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getComments() async{
    ResultEntity resultEntity = await RequestUtils.comments(id.value);
    CommentsEntity commentsEntity = CommentsEntity().fromJson(resultEntity.data);
    commentsList.value = commentsEntity.datas!;
  }
}
