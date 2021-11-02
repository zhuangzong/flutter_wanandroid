import 'package:wan/app/modules/question_module/question_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class QuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController());
  }
}