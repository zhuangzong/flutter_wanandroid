import 'package:wan/app/modules/system_module/system_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SystemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SystemController());
  }
}