import 'package:get/get.dart';
import '../controller/splash_screen_controller.dart';
import '../core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
          () => SplashScreenController(),
    );
    Get.put(Crud());
  }
}