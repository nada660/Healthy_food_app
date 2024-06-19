import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/constant/routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cross_file/cross_file.dart';
abstract class SignUpController extends GetxController {
  signUp();
  goToAuthenticated();
}

class SignUpControllerImp extends SignUpController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController mobile;
  late TextEditingController password;
  late TextEditingController confirm;

  var isshowpasseord = true.obs;
  var isshowpasseord2 = true.obs;
  Rx<XFile?> selectedFile = Rx<XFile?>(null);

  @override
  signUp() {
    var formdata = formstate.currentState;
    if (formdata!.validate()){
      print("valid");
    }
    else {
      print("Not Valid");
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
  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf']
      );
      if (result != null) {
        selectedFile.value = result.files.first as XFile?;
      }
    } catch (e) {
      // Handle any errors
      print('Error picking file: $e');
    }
  }
}
