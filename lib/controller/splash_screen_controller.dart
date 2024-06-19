import 'package:get/get.dart';

import '../core/constant/routes.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;
  final count = 0.obs;

  Future startAnimation() async{
   await Future.delayed(const Duration(seconds: 1));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 2), (() {
      Get.offNamed(AppRoute.login);
    }));
  }
  @override
  void onInit() {
    startAnimation();
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




