
import 'package:flutter/material.dart';

import '../core/class/logoutdialog.dart';
import '../core/constant/routes.dart';
import 'screen/authenticated.dart';
import 'screen/forgetpassword.dart';
import 'screen/login.dart';
import 'screen/signup.dart';
import 'screen/splachscreenview.dart';
import 'widget/logoutdialog.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) =>  Login() ,
  AppRoute.signup: (context) =>  SignUp() ,
  AppRoute.authcode: (context) =>  Authenticated() ,
  AppRoute.SplashScreenView : (context) =>  SplashScreenView() ,
  AppRoute.forgetPassword : (context) =>  ForgetPassword() ,
};