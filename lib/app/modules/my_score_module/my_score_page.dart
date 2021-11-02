import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/my_score_module/my_score_controller.dart';
import 'package:wan/widget/anim_text.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyScorePage extends GetView<MyScoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的积分'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Obx(() => ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.coinRank.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                    title: Text(
                                      "${controller.coinRank[index].username}",
                                      style: const TextStyle(height: 1),
                                    ),
                                    leading: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            color: Colors.redAccent
                                        ),
                                        child: Text(
                                          "${controller.coinRank[index].rank}",
                                          style: TextStyle(height: 1,color: Colors.white),
                                        )),
                                    trailing: Text(
                                      "${controller.coinRank[index].coinCount}",
                                      style: TextStyle(height: 1,color: Colors.blueAccent),
                                    )),
                                Container(
                                  color: Colors.grey[200],
                                  height: 1,
                                ),
                              ],
                            );
                          }));
                    });
              },
              icon: const Icon(Icons.list_alt)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Obx(() => Container(
                padding: const EdgeInsets.only(bottom: 80),
                child: controller.coin.value > 0
                    ? AnimText(
                        number: controller.coin.value,
                        duration: 2000,
                        fontColor: Colors.white,
                        fontSize: 60,
                      )
                    : const Text(
                        "0",
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
              )),
        ),
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.coinList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.coinList[index].desc),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "+${controller.coinList[index].coinCount.toString()}",
                      style: const TextStyle(
                          color: Colors.blueAccent, fontSize: 15),
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
