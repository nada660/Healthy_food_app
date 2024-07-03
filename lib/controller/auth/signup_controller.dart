import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:healthy_food/core/class/incorrectdialog.dart';
import 'package:healthy_food/core/constant/routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:healthy_food/data/datasource/auth/signupdata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../core/class/statusrequest.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToAuthenticated();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> signupFormstate = GlobalKey<FormState>();
  SharedPreferences? pref;

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController mobile;
  late TextEditingController password;
  late TextEditingController confirm;

  var isShowPassword = true.obs;
  var isShowPassword2 = true.obs;
  File? selectedFile;

  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  // var profileImageBase64;

  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;
  SignupData signupData = SignupData();
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  final IncorrectDialog incorrectDialog = IncorrectDialog();

  @override
  signUp() async {
    pref = await SharedPreferences.getInstance();
    var formdata = signupFormstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(username.text, password.text,
          email.text, mobile.text, confirm.text, pickedFile, selectedFile);

        if (response.statusCode == 200 || response.statusCode == 201) {
          var data =  jsonDecode(await response.stream.bytesToString());

          print("=============================== Controller $data");

          String accessTokenValue = data['data']['access_token'];
          String refreshTokenValue = data['data']['refresh_token'];
          await pref!.setString('access_token', json.encode(accessTokenValue));
          await pref!
              .setString('refresh_token', json.encode(refreshTokenValue));

          String accessToken =
              json.decode(pref!.getString('access_token') ?? '');
          String refreshToken =
              json.decode(pref!.getString('refresh_token') ?? '');

          print("Access Token is : $accessToken");
          print("Refresh Token is : $refreshToken");

          Get.snackbar("Sign Up",
              "you signed up successfully ,we send a email verification to your email so please verify your email");
          print("=============================== Controller22 $response ");
          print("success");
          print("hi 1");
          Get.offNamed(AppRoute.authcode, arguments: {"email": email.text});
        } else if (response.statusCode == 422) {
          Get.snackbar(
              "ُWarning", "The name or phone number has already been taken.");
          // statusRequest = StatusRequest.failure;
          print("hi 2");
        } else if (response.statusCode == 404) {
          Get.snackbar(
              "Not Found", "The route api/auth/signupff could not be found.");
          // statusRequest = StatusRequest.failure;
          print("hi 3");
        } else if (response.statusCode == 409) {
          Get.snackbar("ُWarning", "Email address already exists.");
          // statusRequest = StatusRequest.failure;
          print("hi 4");
        } else {
          incorrectDialog.ShowMyIncorrectDialog();
          // statusRequest = StatusRequest.failure;
          print("hi 5");
        }

      update();
    } else {
      print("------Not valid");
    }
  }

  @override
  goToAuthenticated() {
    Get.toNamed(AppRoute.authcode);
  }

  goToLogin() {
    Get.toNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    mobile = TextEditingController();
    password = TextEditingController();
    confirm = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    mobile.dispose();
    password.dispose();
    confirm.dispose();
    super.dispose();
  }

  // file PDF Picker
  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (result != null) {
        selectedFile = File(result.files.single.path!);
        print(selectedFile!.path);
        update();
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    if (pickedImage != null) {
      pickedFile = File(pickedImage.path);
      print(pickedFile);
      update();
    }

  }

// Image profile Picker
   Future<void> setProfileImagePath(String path) async {
     profilePicPath.value = path;
     isProfilePicPathSet.value = true;
  }
}
