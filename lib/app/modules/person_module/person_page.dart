import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/person_module/person_controller.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/utils/ui_utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PersonPage extends GetView<PersonController> {
  List<String> textList = [
    "我的积分",
    "我的分享",
    "我的收藏",
    "我的书签",
    "阅读历史",
    "开源项目",
    "关于作者",
    "系统设置",
  ];
  List<IconData> iconList = [
    Icons.score,
    Icons.share,
    Icons.favorite_outline,
    Icons.bookmark_border,
    Icons.history,
    Icons.margin,
    Icons.account_box_outlined,
    Icons.settings_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBar(
          pinned: true,
          stretch: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notification_important_outlined,
                ))
          ],
          bottom: PreferredSize(
              child: InkWell(
                onTap: () => controller.headTap(),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.userName.value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Obx(
                        () => Offstage(
                          offstage: !controller.isLogin,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "等级:${controller.level.value}  排名:${controller.rank.value}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const Padding(padding: EdgeInsets.all(2)),
                              const Text(
                                "写个签名鼓励一下自己吧",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              preferredSize: const Size(double.infinity, 180)),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: Icon(
                iconList[index],
                color: Colors.blueAccent,
              ),
              title: Text(textList[index]),
              trailing: const Icon(Icons.chevron_right),
              onTap: (){
                switch(index){
                  case 0:
                    Get.toNamed(Routes.MY_SCORE);
                    break;
                  case 2:
                    Get.toNamed(Routes.MY_COLLECT);
                    break;
                }
              },
            );
          },
          childCount: textList.length,
        ))
      ],
    );
  }
}
