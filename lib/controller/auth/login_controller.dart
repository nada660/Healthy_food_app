import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/constant/routes.dart';
import 'package:get_storage/get_storage.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
}
class LoginControllerImp extends LoginController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController mobilenumber;

  final GetStorage storage = GetStorage();

  var iswpasswordHidden = true.obs;
  final RxBool rememberMe = false.obs;

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
    Get.toNamed(AppRoute.signup);
  }
  goToLogIn() {
    Get.toNamed(AppRoute.login);
  }

  void RememberMe(bool value) {
    rememberMe.value = value;
    storage.write('rememberMe', value);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    mobilenumber = TextEditingController();
    rememberMe.value = storage.read('rememberMe') ?? false;
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