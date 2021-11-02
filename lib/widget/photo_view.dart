
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewPage extends StatefulWidget {

  List<String> photos;
  int currentIndex ;

  PhotoViewPage(this.photos,{this.currentIndex = 0});

  @override
  PhotoViewPageState createState() => new PhotoViewPageState();
}

class PhotoViewPageState extends State<PhotoViewPage> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text('图片预览'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: FileImage(File(widget.photos[index])),
                      initialScale: PhotoViewComputedScale.contained * 1,
                      heroAttributes: PhotoViewHeroAttributes(tag: widget.photos[index]),
                    );
                  },
                  itemCount: widget.photos.length,
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        value: event == null
                            ? 0
                            : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                      ),
                    ),
                  ),
                  pageController: PageController(initialPage: widget.currentIndex),
                  onPageChanged: (index){
                    print(index);
                    setState(() {
                      widget.currentIndex = index;
                    });
                  },
                )
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text('${widget.currentIndex+1}/${widget.photos.length}',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
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
  void didUpdateWidget(PhotoViewPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}