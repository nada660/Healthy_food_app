import 'package:http/http.dart' as http;

import '../../../linkapi.dart';


class LogoutData {
  logout(String accessToken) async {
    var request = http.Request('GET', Uri.parse(AppLink.logOut));
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json';
    request.headers['_method'] = 'GET';
    request.headers['Authorization'] = 'Bearer $accessToken';

    http.StreamedResponse response = await request.send();

    return response;
  }
}
