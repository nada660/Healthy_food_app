import 'package:get/get.dart';

import '../core/constant/routes.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
  //static SplashScreenController get find => Get.find();

  //RxBool animate = false.obs;
  final count = 0.obs;

  /*Future startAnimation() async{
   // await Future.delayed(const Duration(seconds: 500));
    //animate.value = true;
    await Future.delayed(const Duration(seconds: 10));
    Get.offNamed(AppRoute.login);
  }*/
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}




