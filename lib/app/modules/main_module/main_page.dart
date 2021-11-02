import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/main_module/main_controller.dart';
import 'package:wan/app/theme/app_colors.dart';
import 'package:wan/widget/home_item_widget.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        centerTitle: true,
        actions: [
          IconButton(
              key: controller.rightKey,
              onPressed: () => controller.gotoSearch(),
              icon: const Icon(Icons.search))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.handleRefresh,
        child: CustomScrollView(
          // physics: const BouncingScrollPhysics(
          //     parent: AlwaysScrollableScrollPhysics()),
          controller: controller.scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: Obx(() => Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return controller.bannerBean.isNotEmpty
                              ? Image.network(
                                  controller.bannerBean[index].imagePath,
                                  fit: BoxFit.fill,
                                )
                              : Container();
                        },
                        autoplay: true,
                        // pagination: const SwiperPagination(),
                        onTap: (index) => controller.bannerTap(index),
                        itemCount: controller.bannerBean.isNotEmpty
                            ? controller.bannerBean.length
                            : 1,
                      )),
                ),
              ),
            ),
            Obx(
              () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return controller.mainTopList.isEmpty
                      ? Container()
                      : HomeItemWidget(
                          controller.mainTopList[index].id,
                          true,
                          controller.mainTopList[index].collect,
                          controller.mainTopList[index].tags == null ||
                                  controller.mainTopList[index].tags.length == 0
                              ? ""
                              : controller.mainTopList[index].tags[0].name,
                          controller.mainTopList[index].fresh!,
                          controller.mainTopList[index].author!
                                  .toString()
                                  .isEmpty
                              ? controller.mainTopList[index].shareUser!
                              : controller.mainTopList[index].author!,
                          controller.mainTopList[index].niceShareDate!,
                          controller.mainTopList[index].title!,
                          controller.mainTopList[index].desc!,
                          "${controller.mainTopList[index].superChapterName} · "
                          "${controller.mainTopList[index].chapterName}",
                          () => controller.mainTopListTap(index),
                          (collect) =>
                              controller.mainTopList[index].collect = collect);
                },
                childCount: controller.mainTopList.length,
              )),
            ),
            Obx(
              () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return controller.mainList.isEmpty
                      ? Container()
                      : HomeItemWidget(
                          controller.mainList[index].id,
                          false,
                          controller.mainList[index].collect,
                          "",
                          controller.mainList[index].fresh,
                          controller.mainList[index].author == null ||
                                  controller.mainList[index].author
                                      .toString()
                                      .isEmpty
                              ? controller.mainList[index].shareUser
                              : controller.mainList[index].author,
                          controller.mainList[index].niceShareDate,
                          controller.mainList[index].title,
                          "",
                          "${controller.mainList[index].superChapterName} · "
                              "${controller.mainList[index].chapterName}",
                          () => controller.mainListTap(index),
                          (collect) =>
                              controller.mainList[index].collect = collect);
                },
                childCount: controller.mainList.length,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
