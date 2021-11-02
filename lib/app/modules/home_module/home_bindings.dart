import 'package:wan/app/modules/home_module/home_controller.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/main_module/main_controller.dart';
import 'package:wan/app/modules/person_module/person_controller.dart';
import 'package:wan/app/modules/question_module/question_controller.dart';
import 'package:wan/app/modules/system_module/system_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => QuestionController());
    Get.lazyPut(() => SystemController());
    Get.lazyPut(() => PersonController());
  }
}