import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wan/app/data/repository/hotkey_entity.dart';
import 'package:wan/app/data/repository/main_list_entity.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/theme/app_colors.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/network/bean/result_entity.dart';

import 'CRAnimation.dart';
import 'dart:math' as math;

import 'home_item_widget.dart';

class SearchPage extends StatefulWidget {
  final Offset centerPosition;

  const SearchPage(this.centerPosition, {Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<SearchPage> {
  late AnimationController controller;
  Animation? animation;
  bool endAnima = false;
  List<HotkeyEntity> hotKeyList = [];
  List<MianListDatas> list = [];
  int pageIndex = 0;
  TextEditingController? textEditingController = TextEditingController();
  FocusNode textFieldFocusNode = FocusNode();
  ScrollController scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  bool get needHeader => false;

  bool get isRefreshFirst => false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _getHotkey();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInCubic,
    )..addListener(() {
        setState(() {});
      });

    Future.delayed(const Duration(seconds: 0), () {
      controller.forward().then((_) {
        setState(() {
          endAnima = true;
        });
      });
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageIndex++;
        _query();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getHotkey() async {
    ResultEntity resultEntityNavi = await RequestUtils.hotkey();
    List<dynamic> hotkeys = resultEntityNavi.data;
    hotKeyList = hotkeys
        .map((e) => HotkeyEntity().fromJson(e as Map<String, dynamic>))
        .toList();
  }

  _query() async {
    textFieldFocusNode.unfocus();
    if (textEditingController!.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入内容！");
      return;
    }
    ResultEntity resultEntity =
        await RequestUtils.query(pageIndex, textEditingController!.text);
    MainListEntity entity = MainListEntity().fromJson(resultEntity.data);
    list.addAll(entity.datas!);
    setState(() {});
    if (list.isEmpty) {
      Fluttertoast.showToast(msg: "没有搜索到任何内容！");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          endAnima = false;
        });
        controller.reverse().then((_) {
          Navigator.maybePop(context);
        });
        return true;
      },
      child: Container(
          color: endAnima ? Theme.of(context).primaryColor : Colors.transparent,
          child: CRAnimation(
              minR: math.sqrt(width * width + height * height),
              maxR: 0,
              offset: widget.centerPosition,
              animation: animation as Animation<double>?,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                    leading: IconButton(
                      highlightColor: Colors.transparent,
                      icon: const BackButtonIcon(),
                      onPressed: () {
                        setState(() {
                          endAnima = false;
                        });
                        controller.reverse().then((_) {
                          Navigator.maybePop(context);
                        });
                      },
                    ),
                    title: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Color(0xff1a7fd1),
                      ),
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        autofocus: false,
                        focusNode: textFieldFocusNode,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: "请输入搜索内容",
                          contentPadding: const EdgeInsets.all(0),
                          hintStyle: const TextStyle(
                              color: Colors.white54, fontSize: 16, height: 1.3),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: textEditingController!.text.isEmpty
                              ? Container(
                                  width: 10,
                                )
                              : IconButton(
                                  onPressed: () {
                                    textEditingController!.clear();
                                    setState(() {
                                      list.clear();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  )),
                        ),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16, height: 1.3),
                      ),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () => _query(),
                          icon: const Icon(Icons.search))
                    ]),
                body: Container(
                  child: list.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "搜索热词",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                            Wrap(
                              children: _getHotKetWidget(),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: list.length,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            return HomeItemWidget(
                                list[index].id!,
                                false,
                                list[index].collect!,
                                "",
                                list[index].fresh!,
                                list[index].author!.toString().isEmpty
                                    ? list[index].shareUser!
                                    : list[index].author!,
                                list[index].niceShareDate!,
                                list[index].title!,
                                "",
                                "${list[index].superChapterName} · "
                                    "${list[index].chapterName}",
                                () => _ListTap(index),
                                (collect) => list[index].collect = collect);
                          }),
                ),
              ))),
    );
  }

  _ListTap(int index) {
    Map<String, String> map = {
      "url": list[index].link!,
      "id": list[index].id.toString(),
      "author": list[index].author!,
    };
    Get.toNamed(Routes.PAGE_DETAIL, parameters: map);
  }

  List<Widget> _getHotKetWidget() {
    List<Widget> widgets = [];
    hotKeyList
        .asMap()
        .keys
        .map((e) => widgets.add(InkWell(
              onTap: () {
                textEditingController!.text = hotKeyList[e].name!;
                textFieldFocusNode.unfocus();
                _query();
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 8, bottom: 8),
                margin: const EdgeInsets.all(5.0),
                child: Text(
                  hotKeyList[e].name!,
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
