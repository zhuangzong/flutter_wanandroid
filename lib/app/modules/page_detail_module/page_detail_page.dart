import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wan/app/modules/page_detail_module/page_detail_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PageDetailPage extends GetView<PageDetailController> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          minHeight: 80,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          maxHeight: Get.height - 50,
          panel: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    child: Row(
                      children: [
                        Obx(() => Text(
                              controller.author.value,
                              style: TextStyle(color: Colors.grey[500]),
                            )),
                        const Expanded(
                            child: Icon(
                          Icons.menu_rounded,
                          color: Colors.grey,
                        )),
                        Obx(() => Text(
                              "评论(${controller.commentsList.length})",
                              style: TextStyle(color: Colors.grey[500]),
                            )),
                      ],
                    )),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
                SizedBox(
                  height: 800,
                  child: Obx(() => ListView.builder(
                      itemCount: controller.commentsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Color(0xffefefef)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controller.commentsList[index]
                                                    .userName!,
                                                style: const TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                controller.commentsList[index]
                                                    .niceDate!,
                                                style: const TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, bottom: 8.0),
                                          child: Text(
                                            parse(controller.commentsList[index]
                                                    .content!)
                                                .body!
                                                .text
                                                .replaceAll("\n", ""),
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[200],
                            )
                          ],
                        );
                      })),
                )
              ]))
            ],
          ),
          body: Scaffold(
            body: CustomScrollView(slivers: [
              SliverPadding(
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Obx(() => WebView(
                        key: _key,
                        initialUrl: controller.url.value,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          controller.webViewController = webViewController;
                          webViewController.loadUrl(controller.url.value);
                        },
                        gestureNavigationEnabled: true,
                        onProgress: (int progress) {
                          controller.progress.value = progress;
                        })),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 250),
              )
            ]),
            floatingActionButton: Container(
              margin: const EdgeInsets.only(left: 40, bottom: 120),
              alignment: Alignment.bottomLeft,
              child: Stack(alignment: Alignment.center, children: [
                Obx(() => Visibility(
                      visible: controller.progress.value != 100,
                      child: CircularProgressIndicator(
                        strokeWidth: 30.0,
                        backgroundColor: Colors.white54,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.blueAccent),
                        value: controller.progress.value.toDouble() / 100,
                      ),
                    )),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () async {
                    try{
                      String? url =
                      await controller.webViewController.currentUrl();
                      bool cangoback =
                      await controller.webViewController.canGoBack();
                      if (cangoback && url!.trim()!=controller.url.value.trim()) {
                        controller.webViewController.goBack();
                      } else {
                        Get.back();
                      }
                    }catch(e){
                      Get.back();
                    }
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.blueAccent,
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
