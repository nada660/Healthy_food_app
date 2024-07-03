
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:healthy_food/view/screen/home.dart';
import 'core/constant/routes.dart';
import 'view/screen/authenticated.dart';
import 'view/screen/deleteaccount.dart';
import 'view/screen/login.dart';
import 'view/screen/signup.dart';
import 'view/screen/splachscreenview.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name:AppRoute.SplashScreenView, page: () =>  SplashScreenView()) ,
  GetPage(name:AppRoute.login, page: () =>  Login()) ,
  GetPage(name:AppRoute.signup, page: () =>  SignUp()) ,
  GetPage(name:AppRoute.authcode, page: () =>  Authenticated()) ,
  GetPage(name:AppRoute.deleteAccount, page: () =>  DeleteAccount()) ,
  GetPage(name:AppRoute.home, page: () =>  Home()) ,
];