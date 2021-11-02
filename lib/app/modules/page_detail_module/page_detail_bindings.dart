import 'package:wan/app/modules/page_detail_module/page_detail_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PageDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageDetailController());
  }
}