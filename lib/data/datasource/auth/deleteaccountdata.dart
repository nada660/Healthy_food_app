import 'package:healthy_food/linkapi.dart';
import 'package:http/http.dart' as http;

class DeleteAccountData {
  deleteUser(String accessToken, String email, String password) async {
    var request = http.Request('POST', Uri.parse(AppLink.deleteUser));
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $accessToken';

    var formData = {
      'email': email,
      'password': password,
    };

    request.bodyFields = formData;

    http.StreamedResponse response = await request.send();

    return response;
  }
}