
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../core/class/logoutdialog.dart';
import '../core/constant/routes.dart';
import 'screen/authenticated.dart';
import 'screen/forgetpassword.dart';
import 'screen/login.dart';
import 'screen/signup.dart';
import 'screen/splachscreenview.dart';
import 'widget/logoutdialog.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name:AppRoute.SplashScreenView, page: () =>  SplashScreenView()) ,
  GetPage(name:AppRoute.login, page: () =>  Login()) ,
  GetPage(name:AppRoute.signup, page: () =>  SignUp()) ,
  GetPage(name:AppRoute.authcode, page: () =>  Authenticated()) ,
  GetPage(name:AppRoute.forgetPassword, page: () =>  ForgetPassword()) ,
];