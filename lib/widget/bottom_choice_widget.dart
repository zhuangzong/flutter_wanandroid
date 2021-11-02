import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomChoiceWidget extends StatelessWidget {
  List<String> choiceList;
  String title;
  Function(int) onItemChoice;

  BottomChoiceWidget(
      {Key? key,
      required this.choiceList,
      this.title = "请选择",
      required this.onItemChoice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          Divider(),
          SafeArea(
            child: CustomScrollView(
              shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                        children: [
                          ListTile(
                              title: Text(choiceList[index]),
                              onTap: () {
                                onItemChoice(index);
                                Navigator.pop(context);
                              }),
                          Divider(),
                        ],
                      );
                    }, childCount: choiceList.length,),
                  )
                ]),
          ),
          // SafeArea(
          //   child: ListView.builder(
          //       shrinkWrap: true,
          //       itemCount: choiceList.length,
          //       itemBuilder: (context, index) {
          //         return Column(
          //           children: [
          //             ListTile(
          //                 title: Text(choiceList[index]),
          //                 onTap: () {
          //                   onItemChoice(index);
          //                   Navigator.pop(context);
          //                 }),
          //             Divider(),
          //           ],
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
