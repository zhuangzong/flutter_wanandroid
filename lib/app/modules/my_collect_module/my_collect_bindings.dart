import 'package:wan/app/modules/my_collect_module/my_collect_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyCollectBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCollectController());
  }
}