import 'package:wan/app/modules/my_score_module/my_score_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyScoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyScoreController());
  }
}