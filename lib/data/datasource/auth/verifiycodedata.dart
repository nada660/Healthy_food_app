import 'package:healthy_food/core/class/crud.dart';
import 'package:healthy_food/linkapi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/class/successdialog.dart';
import 'dart:convert';

final SuccessDialog successDialog = SuccessDialog();

StatusRequest statusRequest = StatusRequest.none;
SharedPreferences? pref;

class VerifycodeData {
  late Crud crud;

  VerifycodeData(this.crud);

  postdata(String email, String verfycode) async {
    pref = await SharedPreferences.getInstance();
    String accessToken = json.decode(pref!.getString('access_token') ?? '');
    var response = await http.post(
      Uri.parse(AppLink.verifyEmailCode),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      body: {'email': email, "code": verfycode},
    );
    return response;
  }

  resendCode(String email) async {
    var response = await crud.postData(AppLink.resendCode, {"email": email},
        {"Authorization": "Bearer token"});

    return response.fold((l) => l, (r) => r);
  }
}
