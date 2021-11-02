import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/article_entity.dart';
import 'package:wan/app/data/repository/main_list_entity.dart';
import 'package:wan/app/data/repository/system_bean_entity.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/network/bean/result_entity.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SystemDetailController extends GetxController
    with SingleGetTickerProviderMixin {
  var name = "".obs;
  var tabList = [].obs;
  var articleList = [].obs;
  late TabController tabController;
  int pageIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SystemBeanEntity entity =
        SystemBeanEntity().fromJson(json.decode(Get.arguments));
    tabList.value = entity.children!;
    tabController = TabController(length: tabList.length, vsync: this);
    name.value = entity.name!;
    tabController.addListener(() {
      articleList.clear();
      pageIndex = 0;
      getArticleListData();
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageIndex++;
        getArticleListData();
      }
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getArticleListData();
  }

  Future handleRefresh() async {
    // 模拟数据的延迟加载
    pageIndex = 0;
    articleList.clear();
    getArticleListData();
  }

  void getArticleListData() async {
    ResultEntity resultEntity =
        await RequestUtils.article(pageIndex, tabList[tabController.index].id);
    ArticleEntity entity = ArticleEntity().fromJson(resultEntity.data);
    articleList.addAll(entity.datas!.obs);
  }

  articleListTap(int index) {
    Map<String, String> map = {
      "url": articleList[index].link,
      "id": articleList[index].id.toString(),
      "author": articleList[index].author,
    };
    Get.toNamed(Routes.PAGE_DETAIL, parameters: map);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    tabController.dispose();
    scrollController.dispose();
  }


}
