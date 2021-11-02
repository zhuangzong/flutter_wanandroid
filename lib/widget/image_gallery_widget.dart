import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wan/app/theme/app_colors.dart';
import 'package:wan/app/utils/ui_utils.dart';

import 'drag_sort_view.dart';
import 'photo_view.dart';

class ImageBean extends DragBean {
  File file;

  ImageBean(this.file);
}

class ImageGallery extends StatefulWidget {
  @override
  ImageGalleryState createState() => new ImageGalleryState();
}

class ImageGalleryState<T> extends State<ImageGallery> {
  List<ImageBean> list = [
    // ColorBean(Colors.redAccent),
    // ColorBean(Colors.blueAccent),
    // ColorBean(Colors.yellowAccent),
    // ColorBean(Colors.purpleAccent),
    // ColorBean(Colors.greenAccent),
    // ColorBean(Colors.lightBlueAccent),
    // ColorBean(Colors.deepOrangeAccent),
  ];
  int moveAction = MotionEvent.actionUp;
  bool _canDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray_ea,
      appBar: AppBar(
        title: const Text('照片列表'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _canDelete = !_canDelete;
                });
              },
              icon: Icon(_canDelete ? Icons.menu_open_outlined : Icons.menu))
        ],
      ),
      body: CustomScrollView(
        physics:
            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            DragSortView(
              list,
              aspectRatio: 1.5,
              space: 5,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Future.delayed(
                            Duration.zero,
                            () => {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) => PhotoViewPage(
                                                list
                                                    .map((e) => e.file.path)
                                                    .toList(),
                                                currentIndex: index,
                                              )))
                                });
                      },
                      child: Container(
                        margin: EdgeInsets.all(_canDelete ? 8.0 : 0),
                        child: Image.file(
                          list[index].file,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Visibility(
                        visible: _canDelete,
                        child: Align(
                          child: IconButton(
                            icon: Icon(Icons.delete_forever_rounded),
                            iconSize: 30,
                            color: Colors.white,
                            onPressed: () {
                              UIUtils.showMessageDialog(
                                  context, "确定要删除这张照片吗？", callBack: () {
                                setState(() {
                                  list.removeAt(index);
                                });
                              });
                            },
                          ),
                          alignment: Alignment.center,
                        )),
                  ],
                );
              },
              initBuilder: (BuildContext context) {
                return InkWell(
                  onTap: () async {
                    _choiceFile();
                    setState(() {
                      _canDelete = false;
                    });
                  },
                  child: Container(
                    color: Color(0XFFCCCCCC),
                    margin: EdgeInsets.all(_canDelete ? 8.0 : 0),
                    child: Center(
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                );
              },
              onDragListener: (MotionEvent event, double itemWidth) {
                switch (event.action) {
                  case MotionEvent.actionDown:
                    moveAction = event.action!;
                    setState(() {});
                    break;
                  case MotionEvent.actionMove:
                    break;
                  case MotionEvent.actionUp:
                    moveAction = event.action!;
                    break;
                }
                return false;
              },
            ),
          ]))
        ],
      ),
    );
  }

  void _choiceFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (result != null) {
      result.paths.forEach((element) {
        list.add(ImageBean(File(element!)));
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(ImageGallery oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
