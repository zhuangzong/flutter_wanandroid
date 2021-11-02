import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/navi_bean_entity.dart';
import 'package:wan/app/data/repository/system_bean_entity.dart';
import 'package:wan/app/modules/system_module/system_controller.dart';
import 'package:wan/app/theme/app_colors.dart';
import 'package:wan/app/utils/PageViewScrollUtils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SystemPage extends GetView<SystemController> {
  PageController? pageController;

  SystemPage({this.pageController});

  late PageViewScrollUtils _pageViewScrollUtils;

  @override
  Widget build(BuildContext context) {
    _pageViewScrollUtils = PageViewScrollUtils(pageController: pageController!, tabController: controller.tabController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TabBar(
          controller: controller.tabController,
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          labelColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 14),
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(
              text: "体系",
            ),
            Tab(
              text: "导航",
            ),
          ],
        ),
      ),
      body: NotificationListener(
        onNotification: _pageViewScrollUtils.handleNotification,
        child: TabBarView(
          controller: controller.tabController,
          children: [
            Obx(() => ListView.builder(
                itemCount: controller.systemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.systemList[index].name,
                          style: const TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 10,),
                        Wrap(
                          children: getItemWidgets(
                              controller.systemList[index].children,index),
                        ),
                      ],
                    ),
                  );
                })),
            Obx(() => ListView.builder(
                itemCount: controller.naviList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.naviList[index].name,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10,),
                        Wrap(
                          children: getItemNaviWidgets(
                              controller.naviList[index].articles,index),
                        ),
                      ],
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }

  List<Widget> getItemWidgets(List<SystemBeanChildren> list, int index) {
    List<Widget> widgets = [];
    list
        .map((e) => widgets.add(InkWell(
              onTap: () => controller.onItemClick(index),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 8, bottom: 8),
                margin: const EdgeInsets.all(5.0),
                child: Text(
                  e.name!,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 12, height: 1),
                ),
                decoration: BoxDecoration(
                    color: gray_ea,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
              ),
            )))
        .toList();
    return widgets;
  }

  List<Widget> getItemNaviWidgets(List<NaviBeanArticles> list,int index) {
    List<Widget> widgets = [];
    list
        .asMap()
        .keys
        .map((e) => widgets.add(InkWell(
              onTap: ()=>controller.naviListTap(index,e),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 8, bottom: 8),
                margin: const EdgeInsets.all(5.0),
                child: Text(
                  list[e].title!,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 12, height: 1),
                ),
                decoration: BoxDecoration(
                    color: gray_ea,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
              ),
            )))
        .toList();
    return widgets;
  }
}
