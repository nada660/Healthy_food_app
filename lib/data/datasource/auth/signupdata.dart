import 'dart:io';
import 'package:get/get.dart';
import 'package:healthy_food/linkapi.dart';
import 'package:http/http.dart' as http;

class SignupData {
  postdata(String name, String password, String email, String mobile,
      String passwordConfirmation,File? fileImage,File? docFile) async {
    http. MultipartRequest request = http.MultipartRequest('POST', Uri.parse(AppLink.signUp));
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone_number'] = mobile;
    request.fields['password'] = password;
    request.fields['password_confirmation'] = passwordConfirmation;

    if (docFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'certificate', docFile.path));

      print("uploaded file successfuly");
    }else{
      print("uploaded file faild");
    }
    if(fileImage !=null) {
      request.files.add(await http.MultipartFile.fromPath(
          'profile_photo',fileImage.path));
      Get.snackbar("Success", "Image uploaded Successfully");
      print("uploaded image successfuly");
    }else{
      Get.snackbar("ُWarning", "Something went wrong image uploaded failed");
      print("uploaded image failed");
    }
    request.headers['enctype'] = 'multipart/form-data';
    request.headers['Accept'] = 'application/json';

    http.StreamedResponse response = await request.send();

    return response;




  }
}
