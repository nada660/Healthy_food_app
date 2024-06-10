import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/model/splash_screen_binding.dart';
import 'view/routes.dart';
import 'view/screen/login.dart';
import 'view/screen/splachscreenview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  SplashScreenView(),
      routes: routes,
    );
  }
}
