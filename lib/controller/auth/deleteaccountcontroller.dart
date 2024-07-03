import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/auth/deleteaccountdata.dart';

abstract class DeleteAccountController extends GetxController{
  deleteAccount();
}
class DeleteAccountControllerImp extends DeleteAccountController {

  final DeleteAccountData deleteAccountData = DeleteAccountData();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  SharedPreferences? pref;


  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  deleteAccount() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      pref = await SharedPreferences.getInstance();
      String accessToken = json.decode(pref!.getString('access_token') ?? '');

      var response = await deleteAccountData.deleteUser(
          accessToken, email.text, password.text);

      if (response.statusCode == 200 || response.statusCode == 201) {
        await pref!.remove('access_token');
        Get.snackbar(
            "Account deleted", "Your account has been deleted successfully.");
        Get.offNamed(AppRoute.login);  // Navigate to login page
      } else {
        Get.snackbar("Error", "Failed to delete account.");
      }
        } else {
      print("Not Valid");
    }
}
  goToBack(){
    Get.toNamed(AppRoute.home);
  }
  /*goToAuthCode() {
    Get.toNamed(AppRoute.authcode);
  }
   */

}

