import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/network/bean/result_entity.dart';
import 'package:wan/app/data/repository/question_entity.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class QuestionController extends GetxController{

  var questionList = [].obs;
  int pageIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getQuestionList();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageIndex++;
        getQuestionList();
      }
    });
  }


  Future handleRefresh() async {
    // 模拟数据的延迟加载
    pageIndex = 0;
    questionList.clear();
    getQuestionList();
  }

  void getQuestionList() async{
    ResultEntity resultEntity = await RequestUtils.question(pageIndex);
    QuestionEntity entity = QuestionEntity().fromJson(resultEntity.data);
    questionList.addAll(entity.datas!.obs);
  }
  questionListTap(int index) {
    Map<String, String> map = {
      "url": questionList[index].link,
      "id": questionList[index].id.toString(),
      "author": questionList[index].author,
    };
    Get.toNamed(Routes.PAGE_DETAIL,parameters: map);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }
}

