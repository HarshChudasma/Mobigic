import 'package:get/get.dart';
import 'package:mobigic/module/gridview_scr/direct_search_step6/direction_search_step6.dart';
import 'package:mobigic/module/gridview_scr/duplicate_step7/step7_scr.dart';
import 'package:mobigic/module/gridview_scr/gridview_scr.dart';
import 'package:mobigic/module/gridview_scr/search_ingrid_step5/step5_scr.dart';
import 'package:mobigic/module/number_scr/number_scr.dart';
import 'package:mobigic/module/splash_scr/splash_scr.dart';
import 'package:mobigic/routes/app_routes.dart';

class AppPages {

  static List<GetPage> pages = [
    GetPage(name: Routes.SPLASH_SCREEN, page: () => const SplashScreen(),),
    GetPage(name: Routes.NUMBER_SCREEN, page: () => NumberScreen(),),
    GetPage(name: Routes.GRID_SCREEN, page: () => GridViewScreen(),),
    GetPage(name: Routes.STEP5_SCREEN, page: () => SearchInGridView(),),
    GetPage(name: Routes.STEP7_SCREEN, page: () => SearchDuplicateInGridView(),),
    GetPage(name: Routes.STEP6_SCREEN, page: () => DireactionSearchStep6(),),
  ];

}