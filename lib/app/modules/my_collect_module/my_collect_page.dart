import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/my_collect_module/my_collect_controller.dart';
import 'package:wan/widget/home_item_widget.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyCollectPage extends GetView<MyCollectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我收藏的文章')),
      body: Obx(() =>RefreshIndicator(
        onRefresh: controller.handleRefresh,
        child:  ListView.builder(
            physics:
            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: controller.collectList.length,
            controller: controller.scrollController,
            itemBuilder: (context, index) {
              return HomeItemWidget(
                  controller.collectList[index].id,
                  false,
                  true,
                  "",
                  false,
                  controller.collectList[index].author == null ||
                          controller.collectList[index].author
                              .toString()
                              .isEmpty
                      ? controller.collectList[index].shareUser
                      : controller.collectList[index].author,
                  controller.collectList[index].niceDate,
                  controller.collectList[index].title,
                  controller.collectList[index].desc,
                  controller.collectList[index].chapterName,
                  () => controller.mainListTap(index),
                  (collect) => controller.handleRefresh()
                ,isMyCollect: true,);
            })),
      ),
    );
  }
}
