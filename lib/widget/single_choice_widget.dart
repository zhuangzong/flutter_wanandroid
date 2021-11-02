import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/animal.dart';

class SingleChoiceWidget extends StatefulWidget {
  List<EnumsType> choiceList;
  String? title;
  int id;
  Function(int) onItemChoice;

  SingleChoiceWidget(
      {Key? key,
      required this.choiceList,
      this.title,
      this.id = 0,
      required this.onItemChoice})
      : super(key: key);

  @override
  State<SingleChoiceWidget> createState() => _SingleChoiceWidgetState();
}

class _SingleChoiceWidgetState extends State<SingleChoiceWidget> {
  late int choicePosition = 0;

  @override
  Widget build(BuildContext context) {
    if(widget.id>0){
      choicePosition = widget.choiceList
          .indexOf(widget.choiceList.where((e) => e.id == widget.id).single);
    }

    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "取消",
                    style: TextStyle(fontSize: 14, color: Colors.redAccent),
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                widget.title == null ? "请选择" : widget.title!,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ))),
              GestureDetector(
                onTap: () {
                  widget.onItemChoice(widget.id);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "确定",
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
        Container(
            height: Get.size.height * 9 / 16 - 60,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    color: Colors.grey[300],
                  ),
                ),
                ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      choicePosition = index;
                      widget.id = widget.choiceList[index].id;
                    });
                  },
                  controller: FixedExtentScrollController(
                      initialItem: choicePosition),
                  squeeze: 1,
                  physics: FixedExtentScrollPhysics(
                      parent: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics())),
                  childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            widget.choiceList[index].name,
                            style: TextStyle(
                                fontSize: 22,
                                color: choicePosition == index
                                    ? Colors.black
                                    : Colors.black54),
                          ),
                        );
                      },
                      childCount: widget.choiceList.length),
                ),
              ],
            )),
      ],
    );
  }
}
