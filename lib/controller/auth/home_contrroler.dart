import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/auth/logoutData.dart';

abstract class HomeController extends GetxController {
  logout();
}

class HomeControllerImp extends HomeController {
  final LogoutData logoutData = LogoutData();

  SharedPreferences? pref;

  @override
  logout() async {
    pref = await SharedPreferences.getInstance();
    String accessToken = json.decode(pref!.getString('access_token') ?? '');

    var response = await logoutData.logout(accessToken);

    if (response.statusCode == 200 || response.statusCode == 201) {
      await pref!.remove('access_token');
      Get.delete<HomeControllerImp>();
      Get.snackbar("Logged out", "You have been logged out successfully.");
      Get.offNamed(AppRoute.login); // Navigate to login page
    } else {
      Get.snackbar("Error", "Failed to log out.");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
