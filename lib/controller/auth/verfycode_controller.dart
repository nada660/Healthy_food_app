import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/class/successdialog.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/auth/verifiycodedata.dart';

abstract class VerfyCodeController extends GetxController{
  checkCode(String verfycode);
}
class VerfyCodeControllerImp extends VerfyCodeController{

  VerifycodeData verifycodeData = VerifycodeData(Get.find());

  final SuccessDialog successDialog = SuccessDialog();
  String? email;

  StatusRequest? statusRequest ;

  @override
  checkCode(verfycode) async {
    statusRequest = StatusRequest.loading;
      update();
      var response = await verifycodeData.postdata(email!, verfycode);
      print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
        print("success**2");
        successDialog.ShowMySuccessDialog();
      } else {
        Get.snackbar(
            " error", "The vcode field must not be greater than 6 characters.");
        print("hi 2");
      }
      update();
  }

  resendCode() async {

      statusRequest = StatusRequest.loading;
      update();
      var response = await verifycodeData.resendCode(email!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.snackbar("Success", "Verification code sent successfully");
      } else {
        Get.snackbar("Error", "Failed to send verification code");
      }
      update();
  }
  /*
  goToBack(){
    Get.toNamed(AppRoute.forgetPassword);
  }
  */

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

}