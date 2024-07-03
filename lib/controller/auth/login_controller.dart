import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/class/statusrequest.dart';
import 'package:healthy_food/core/constant/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthy_food/data/datasource/auth/logindata.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
}
class LoginControllerImp extends LoginController{

  GlobalKey<FormState> loginFormstate = GlobalKey<FormState>();
  SharedPreferences? pref;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController mobile;

  final GetStorage storage = GetStorage();

  var iswpasswordHidden = true.obs;
  final RxBool rememberMe = false.obs;

  var accessToken;
  var refreshToken;

  LoginData loginData = LoginData();
  StatusRequest statusRequest = StatusRequest.none;

  @override

  login() async {
    pref = await SharedPreferences.getInstance();
    var formdata = loginFormstate.currentState;
    if (formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, mobile.text, password.text);
      print("=============================== Controller $response ");
      update();
    } else {
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
  goToHome() {
    Get.toNamed(AppRoute.home);
  }

  void RememberMe(bool value) {
    rememberMe.value = value;
    storage.write('rememberMe', value);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    mobile = TextEditingController();
    rememberMe.value = storage.read('rememberMe') ?? false;
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    mobile.dispose();
    super.dispose();
  }

}