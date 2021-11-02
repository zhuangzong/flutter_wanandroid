import '../../app/modules/my_score_module/my_score_page.dart';
import '../../app/modules/my_score_module/my_score_bindings.dart';
import '../../app/modules/my_collect_module/my_collect_page.dart';
import '../../app/modules/my_collect_module/my_collect_bindings.dart';
import '../../app/modules/system_detail_module/system_detail_page.dart';
import '../../app/modules/system_detail_module/system_detail_bindings.dart';
import '../../app/modules/page_detail_module/page_detail_page.dart';
import '../../app/modules/page_detail_module/page_detail_bindings.dart';
import '../../app/modules/login_module/login_page.dart';
import '../../app/modules/login_module/login_bindings.dart';
import '../../app/modules/person_module/person_page.dart';
import '../../app/modules/person_module/person_bindings.dart';
import '../../app/modules/system_module/system_page.dart';
import '../../app/modules/system_module/system_bindings.dart';
import '../../app/modules/question_module/question_page.dart';
import '../../app/modules/question_module/question_bindings.dart';
import '../../app/modules/main_module/main_page.dart';
import '../../app/modules/main_module/main_bindings.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/home_module/home_bindings.dart';
import 'package:wan/app/modules/home_module/home_page.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.QUESTION,
      page: () => QuestionPage(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: Routes.SYSTEM,
      page: () => SystemPage(),
      binding: SystemBinding(),
    ),
    GetPage(
      name: Routes.PERSON,
      page: () => PersonPage(),
      binding: PersonBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.PAGE_DETAIL,
      page: () => PageDetailPage(),
      binding: PageDetailBinding(),
    ),
    GetPage(
      name: Routes.SYSTEM_DETAIL,
      page: () => SystemDetailPage(),
      binding: SystemDetailBinding(),
    ),
    GetPage(
      name: Routes.MY_COLLECT,
      page: () => MyCollectPage(),
      binding: MyCollectBinding(),
    ),
    GetPage(
      name: Routes.MY_SCORE,
      page: () => MyScorePage(),
      binding: MyScoreBinding(),
    ),
  ];
}
