import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToAuthenticated();
}

class SignUpControllerImp extends SignUpController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController mobile;
  late TextEditingController password;
  late TextEditingController confirm;

  var isshowpasseord2 = true.obs;

  @override
  signUp() {
    var formdata = formstate.currentState;
    if (formdata!.validate()){
      print("valid");
    }
    else {
      print("Not Valid");
    }
  }

  @override
  goToAuthenticated() {
    Get.offNamed(AppRoute.authcode);
  }

  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    mobile = TextEditingController();
    password = TextEditingController();
    confirm = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    mobile.dispose();
    password.dispose();
    confirm.dispose();
    super.dispose();
  }
}
