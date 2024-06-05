import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/constant/routes.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
}
class LoginControllerImp extends LoginController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController mobilenumber;

  var isshowpasseord = true.obs;

  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()){
      print("valid");
    }
    else {
      print("Not Valid");
    }
  }

  @override
  goToSignUp() {
  Get.offNamed(AppRoute.signup);
  }
  goToLogIn() {
    Get.offNamed(AppRoute.login);
  }
  /*goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }*/

  @override


  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    mobilenumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    mobilenumber.dispose();
    super.dispose();
  }

}