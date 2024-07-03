import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:healthy_food/linkapi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/class/incorrectdialog.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';

SharedPreferences? pref;

StatusRequest statusRequest = StatusRequest.none;
IncorrectDialog incorrectDialog = IncorrectDialog();
class LoginData {
  LoginData();

  postdata(String email, String mobile, String password) async {
    StatusRequest statusRequest;
    var request = http.MultipartRequest('POST', Uri.parse(AppLink.login));
    request.fields['email'] = email;
    request.fields['phone_number'] = mobile;
    request.fields['password'] = password;

    request.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    request.headers['Accept'] = 'application/json';
    var response = await request.send();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response.statusCode == 200) {
        pref = await SharedPreferences.getInstance();
        print("=============================== Controller $response ");
        var data = jsonDecode(await response.stream.bytesToString());

        print("=============================== Controller $data");

        String accessTokenValue = data['data']['access_token'];
        String refreshTokenValue = data['data']['refresh_token'];
        await pref!.setString('access_token', json.encode(accessTokenValue));
        await pref!.setString('refresh_token', json.encode(refreshTokenValue));

        String accessToken = json.decode(pref!.getString('access_token') ?? '');
        String refreshToken = json.decode(pref!.getString('refresh_token') ?? '');

        print("Access Token is : $accessToken");
        print("Refresh Token is : $refreshToken");
        Get.snackbar("Log In", "User Logged In Successfully");
        Get.offNamed(AppRoute.home);
      } else if (response.statusCode == 422) {
        Get.snackbar("ُWarning", "All fields are required");
        incorrectDialog.ShowMyIncorrectDialog();
        statusRequest = StatusRequest.failure;
      } else if (response.statusCode == 404) {
        Get.snackbar("ُWarning", "Email Does not Exists");
        statusRequest = StatusRequest.failure;
      } else {
        Get.snackbar("Log In", "Error logging in");
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
