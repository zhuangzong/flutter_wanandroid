import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/banner_bean_entity.dart';
import 'package:wan/app/data/repository/main_list_entity.dart';
import 'package:wan/app/data/repository/main_top_list_entity.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/network/bean/result_entity.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/widget/search_page.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MainController extends GetxController {
  final GlobalKey rightKey = GlobalKey();
  var bannerBean = [].obs;
  var mainList = [].obs;
  var mainTopList = [].obs;
  var pageIndex = 0;
  ScrollController scrollController = ScrollController();

  Future handleRefresh() async {
    // 模拟数据的延迟加载
    pageIndex = 0;
    mainList.clear();
    getMainListData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageIndex++;
        getMainListData();
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getBannerData();
    getMainTopListData();
    getMainListData();
  }

  void getBannerData() async {
    ResultEntity resultEntity = await RequestUtils.banner();
    List<dynamic> data = resultEntity.data;
    bannerBean.value = data
        .map((e) => BannerBeanEntity().fromJson(e as Map<String, dynamic>))
        .toList();
  }

  void getMainTopListData() async {
    ResultEntity resultEntityTop = await RequestUtils.mainTopList();
    List<dynamic> data = resultEntityTop.data;
    mainTopList.value = data
        .map((e) => MainTopListEntity().fromJson(e as Map<String, dynamic>))
        .toList();
  }

  void getMainListData() async {
    ResultEntity resultEntity = await RequestUtils.mainList(pageIndex);
    MainListEntity entity = MainListEntity().fromJson(resultEntity.data);
    mainList.addAll(entity.datas!.obs);
  }

  bannerTap(int index) {
    Map<String, String> map = {
      "url": bannerBean[index].url,
      "id": bannerBean[index].id.toString(),
    };
    Get.toNamed(Routes.PAGE_DETAIL, parameters: map);
  }

  mainTopListTap(int index) {
    Map<String, String> map = {
      "url": mainTopList[index].link,
      "id": mainTopList[index].id.toString(),
      "author": mainTopList[index].author,
    };
    Get.toNamed(Routes.PAGE_DETAIL, parameters: map);
  }

  mainListTap(int index) {
    Map<String, String> map = {
      "url": mainList[index].link,
      "id": mainList[index].id.toString(),
      "author": mainList[index].author,
    };
    Get.toNamed(Routes.PAGE_DETAIL, parameters: map);
  }

  Future gotoSearch() {
    RenderBox renderBox2 =
    rightKey.currentContext?.findRenderObject() as RenderBox;
    var position = renderBox2.localToGlobal(Offset.zero);
    var size = renderBox2.size;
    var centerPosition = Offset(
      position.dx + size.width / 2,
      position.dy + size.height / 2,
    );
    return showGeneralDialog(
      context: Get.context!,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (BuildContext context) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: SearchPage(centerPosition));
        });
      },
      barrierDismissible: false,
      barrierLabel:
      MaterialLocalizations
          .of(Get.context!)
          .modalBarrierDismissLabel,
      barrierColor: const Color(0x30000000),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }

}
