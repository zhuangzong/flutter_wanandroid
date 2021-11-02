import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wan/app/theme/app_colors.dart';
import 'package:html/parser.dart' show parse;
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/app/utils/ui_utils.dart';
import 'package:wan/network/bean/result_entity.dart';

class HomeItemWidget extends StatefulWidget {
  int id;
  bool isTop;
  bool isMyCollect;
  bool collect;
  String tags;
  bool fresh;
  String author;
  String niceShareDate;
  String title;
  String content;
  String superChapterName;
  Function() onItemTap;
  Function(bool) onItemCollectTap;

  HomeItemWidget(this.id, this.isTop, this.collect, this.tags, this.fresh, this.author,
      this.niceShareDate, this.title, this.content, this.superChapterName,
      this.onItemTap,this.onItemCollectTap,
      {Key? key,this.isMyCollect = false})
      : super(key: key);

  @override
  State<HomeItemWidget> createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onItemTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      child: Container(
                        child: const Text(
                          "新",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 12,
                              height: 1.1),
                        ),
                        // decoration: BoxDecoration(
                        //     border: Border.all(
                        //         color: Colors.blueAccent,
                        //         width: 1)),
                        margin: const EdgeInsets.only(right: 5.0),
                      ),
                      visible: widget.fresh,
                    ),
                    Text(
                      widget.author,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 12, height: 1.1),
                    ),
                    Visibility(
                      visible: widget.tags.isNotEmpty,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        padding: const EdgeInsets.only(
                            left: 2.0, top: 2.0, bottom: 2.0, right: 2.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            border:
                                Border.all(color: Colors.blueAccent, width: 1)),
                        child: Text(
                          widget.tags,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 10,
                              height: 1.1),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.niceShareDate,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 12, height: 1.1),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                parse(widget.title).body!.text,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Visibility(
              visible: widget.content.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  parse(widget.content).body!.text.replaceAll("\n", ""),
                  maxLines: 3,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Visibility(
                        child: Container(
                          child: const Text(
                            "置顶",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 11,
                                height: 1.1),
                          ),
                          margin: const EdgeInsets.only(right: 8.0),
                        ),
                        visible: widget.isTop,
                      ),
                      Text(
                        widget.superChapterName,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 11, height: 1.1),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: ()=>_collect(widget.id,widget.collect),
                      child: Icon(
                        widget.collect?Icons.favorite:Icons.favorite_outline,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: gray_ea,
              height: 1,
              margin: const EdgeInsets.only(top: 8.0),
            ),
          ],
        ),
      ),
    );
  }

  _collect(int id, bool collect) async{
    if(UIUtils.isLoginToLogin()){
      if(collect){
        if(widget.isMyCollect){
          ResultEntity resultEntity = await RequestUtils.uncollect(id);
        }else{
          ResultEntity resultEntity = await RequestUtils.uncollect_originId(id);
        }

      }else{
        ResultEntity resultEntity = await RequestUtils.collect(id);
      }
      setState(() {
        widget.collect = !collect;
        widget.onItemCollectTap(widget.collect);
      });
    }
  }
}
