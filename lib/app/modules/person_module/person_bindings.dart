import 'package:wan/app/modules/person_module/person_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PersonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonController());
  }
}