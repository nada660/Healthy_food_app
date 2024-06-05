import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ForgotPasswordController extends GetxController{
  forgotPassword();
}
class ForgotPasswordControllerImp extends ForgotPasswordController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  forgotPassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()){
      print("valid");
    }
    else {
      print("Not Valid");
    }
  }
  goToAuthCode() {
    Get.offNamed(AppRoute.authcode);
  }

}

