import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic/routes/app_pages.dart';
import 'package:mobigic/routes/app_routes.dart';
import 'package:mobigic/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: "Mobigic Interview",
      theme: AppTheme.lightTheme,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}