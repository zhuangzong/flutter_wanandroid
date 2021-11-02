import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/question_module/question_controller.dart';
import 'package:wan/widget/home_item_widget.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class QuestionPage extends GetView<QuestionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('问答'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.handleRefresh,
        child: Obx(() => ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.questionList.length,
            itemBuilder: (context, index) {
              return HomeItemWidget(
                  controller.questionList[index].id,
                  false,
                  controller.questionList[index].collect,
                  controller.questionList[index].tags == null ||
                          controller.questionList[index].tags.length == 0
                      ? ""
                      : controller.questionList[index].tags[0].name,
                  controller.questionList[index].fresh!,
                  controller.questionList[index].author!.toString().isEmpty
                      ? controller.questionList[index].shareUser!
                      : controller.questionList[index].author!,
                  controller.questionList[index].niceShareDate!,
                  controller.questionList[index].title!,
                  controller.questionList[index].desc!,
                  "${controller.questionList[index].superChapterName} · "
                  "${controller.questionList[index].chapterName}", () {
                controller.questionListTap(index);
              }, (collect) => controller.questionList[index].collect = collect);
            })),
      ),
    );
  }
}
