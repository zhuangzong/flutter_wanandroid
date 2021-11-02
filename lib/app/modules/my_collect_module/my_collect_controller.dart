import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/main_list_entity.dart';
import 'package:wan/app/data/repository/main_top_list_entity.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/network/bean/result_entity.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyCollectController extends GetxController{

  var collectList = [].obs;
  int pageIndex = 0;
  ScrollController scrollController = ScrollController();

  Future handleRefresh() async {
    pageIndex = 0;
    collectList.clear();
    getCollectList();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCollectList();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageIndex++;
        getCollectList();
      }
    });
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void getCollectList() async{
    ResultEntity resultEntity = await RequestUtils.collected(pageIndex);
    MainListEntity entity = MainListEntity().fromJson(resultEntity.data);
    collectList.addAll(entity.datas!.obs);
  }
  mainListTap(int index) {
    Map<String, String> map = {
      "url": collectList[index].link,
      "id": collectList[index].id.toString(),
      "author": collectList[index].author,
    };
    Get.toNamed(Routes.PAGE_DETAIL, parameters: map);
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }
}
