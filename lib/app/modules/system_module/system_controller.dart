import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/navi_bean_entity.dart';
import 'package:wan/app/data/repository/system_bean_entity.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/utils/PageViewScrollUtils.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/network/bean/result_entity.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SystemController extends GetxController with SingleGetTickerProviderMixin{
  late TabController tabController= TabController(length: 2, vsync: this);
  var systemList = [].obs;
  var naviList = [].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getTreeList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    tabController.dispose();
  }

  void getTreeList() async{
    ResultEntity resultEntity = await RequestUtils.tree();
    List<dynamic> data = resultEntity.data;
    systemList.value = data
        .map((e) => SystemBeanEntity().fromJson(e as Map<String, dynamic>))
        .toList();

    ResultEntity resultEntityNavi = await RequestUtils.navi();
    List<dynamic> navis = resultEntityNavi.data;
    naviList.value = navis
        .map((e) => NaviBeanEntity().fromJson(e as Map<String, dynamic>))
        .toList();
  }

  void onItemClick(int index){
    SystemBeanEntity entity = systemList[index];
    Get.toNamed(Routes.SYSTEM_DETAIL,arguments: json.encode(entity));
  }

  naviListTap(int index,int e) {
    Map<String, String> map = {
      "url": naviList[index].articles[e].link,
      "id": naviList[index].articles[e].id.toString(),
      "author": naviList[index].articles[e].author,
    };
    Get.toNamed(Routes.PAGE_DETAIL, parameters: map);
  }
}
