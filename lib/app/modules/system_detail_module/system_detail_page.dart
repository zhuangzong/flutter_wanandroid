import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/system_detail_module/system_detail_controller.dart';
import 'package:wan/widget/home_item_widget.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SystemDetailPage extends GetView<SystemDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.name.value)),
        bottom: TabBar(
          controller: controller.tabController,
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          labelColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 14),
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: getTaps(),
        ),
      ),
      body: TabBarView(controller: controller.tabController,
          children: getItemWidget()),
    );
  }

  List<Widget> getTaps() {
    List<Tab> tabs = [];
    controller.tabList.forEach((element) {
      tabs.add(Tab(
        text: element.name,
      ));
    });

    return tabs;
  }

  List<Widget> getItemWidget() {
    List<Widget> widgets = [];
    controller.tabList.asMap().keys.map((e) =>
        widgets.add(RefreshIndicator(
          onRefresh: controller.handleRefresh,
          child: Obx(() => ListView.builder(
              itemCount: controller.articleList.length,
              controller: controller.scrollController,
              itemBuilder: (context, index) {
                return controller.articleList.isEmpty
                    ? Container()
                    : HomeItemWidget(
                    controller.articleList[index].id,
                    false,controller.articleList[index].collect,
                    controller.articleList[index].tags == null ||
                        controller.articleList[index].tags.length == 0
                        ? ""
                        : controller.articleList[index].tags[0].name,
                    controller.articleList[index].fresh!,
                    controller.articleList[index].author!.toString().isEmpty
                        ? controller.articleList[index].shareUser!
                        : controller.articleList[index].author!,
                    controller.articleList[index].niceShareDate!,
                    controller.articleList[index].title!,
                    controller.articleList[index].desc!,
                    "${controller.articleList[index].superChapterName} · "
                        "${controller.articleList[index].chapterName}",
                        () => controller.articleListTap(index),
                        (collect)=>controller.articleList[index].collect = collect);
              })),
        ))
    ).toList();
    return widgets;
  }
}
