import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/home_module/home_page.dart';

import 'app/modules/home_module/home_bindings.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'base/dependency_injection.dart';
import 'base/gloab_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GloabConfig.init();
  await DenpendencyInjection.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: appThemeData,
    defaultTransition: Transition.rightToLeft,
    getPages: AppPages.pages,
    initialBinding: HomeBinding(),
    home: HomePage(),
  ));
}
