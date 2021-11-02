import 'package:wan/app/modules/system_detail_module/system_detail_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SystemDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SystemDetailController());
  }
}