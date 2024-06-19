import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/constant/routes.dart';

abstract class VerfyCodeController extends GetxController{
  checkCode();
}
class VerfyCodeControllerImp extends VerfyCodeController{

  late String verfycode;
  @override
  checkCode() {

  }
  goToBack(){
    Get.toNamed(AppRoute.forgetPassword);
  }
  @override
  void onInit() {
    super.onInit();
  }


}