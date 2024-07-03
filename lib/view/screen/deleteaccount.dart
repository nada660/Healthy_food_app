import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_food/controller/auth/deleteaccountcontroller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';
import '../../core/shared/customTextFormField.dart';
import '../../core/shared/matButton.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DeleteAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DeleteAccountControllerImp());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          leading: IconButton(
            onPressed: () {
              Get.find<DeleteAccountControllerImp>().goToBack();
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.grey,
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppColor.backgroundcolor,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: Get.find<DeleteAccountControllerImp>().formstate,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .001),
                          Image(
                            image: AssetImage('assets/images/image.png'),
                          ),
                          SizedBox(height: height * .02),
                          const Text(
                            'We will premanently delete your account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            height: height * .07,
                          ),
                          CustomTextFormField(
                            type: TextInputType.emailAddress,
                            hinttext: 'test@gmail.com',
                            mycontroller:
                                Get.find<DeleteAccountControllerImp>().email,
                            labelText: 'email',
                            iconData: Icons.mode_edit_outline_outlined,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormField(
                            type: TextInputType.text,
                            labelText: 'Password',
                            mycontroller:
                                Get.find<DeleteAccountControllerImp>().password,
                            //obscureText: controller.iswpasswordHidden.value,
                            iconData: Icons.visibility,

                            valid: (val) {
                              return validInput(val!, 4, 20, "Password");
                            },
                          ),
                          SizedBox(
                            height: height * .07,
                          ),
                          Get.find<DeleteAccountControllerImp>().statusRequest == StatusRequest.loading
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              :
                          CustomButtom(
                            text: 'Delete',
                            color: AppColor.summerGreen,
                            onPressed: () {
                              Get.find<DeleteAccountControllerImp>().deleteAccount();
                            },
                          ),
                        ]),
                  ),
                )
                    .animate()
                    .shimmer(duration: const Duration(seconds: 1))
                    .fadeIn(delay: 40.ms, curve: Curves.easeOut),
              ),
            )
          ],
        ));
  }
}
