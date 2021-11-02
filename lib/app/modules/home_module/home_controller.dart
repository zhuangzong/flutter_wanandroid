import 'package:flutter/material.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController{

  var currentIndex = 0.obs;
  late final PageController pageController;

  void onTap(int index){
    currentIndex.value=index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 3), curve: Curves.ease);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}
