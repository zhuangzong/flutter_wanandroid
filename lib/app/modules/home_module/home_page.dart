import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/home_module/home_controller.dart';
import 'package:wan/app/modules/main_module/main_page.dart';
import 'package:wan/app/modules/person_module/person_page.dart';
import 'package:wan/app/modules/question_module/question_page.dart';
import 'package:wan/app/modules/system_module/system_page.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          MainPage(),
          QuestionPage(),
          SystemPage(pageController:controller.pageController),
          PersonPage(),
        ],
        onPageChanged: (index)=>controller.currentIndex.value=index,
        controller: controller.pageController,
      ),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        fixedColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (index)=>controller.onTap(index),
        items: _bottomItems,
      )),
    );
  }

  final List<BottomNavigationBarItem> _bottomItems = [
    const BottomNavigationBarItem(
      label: "首页",
      icon: Icon(
        Icons.home,
      ),
    ),
    const BottomNavigationBarItem(
      label: "问答",
      icon: Icon(
        Icons.message,
      ),
    ),
    const BottomNavigationBarItem(
      label: "体系",
      icon: Icon(
        Icons.menu_book,
      ),
    ),
    const BottomNavigationBarItem(
      label: "我的",
      icon: Icon(
        Icons.person,
      ),
    ),
  ];
}
