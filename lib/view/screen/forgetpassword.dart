import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_food/controller/auth/forgetpasswordcontroller.dart';

import '../../controller/auth/login_controller.dart';
import '../../core/constant/color.dart';
import '../../core/shared/customTextFormField.dart';
import '../../core/shared/matButton.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgotPasswordControllerImp());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            child: GetBuilder<ForgotPasswordControllerImp>(
          builder: (controller) => Form(
            key: controller.formstate,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .01),
                      Image(
                        image: AssetImage('assets/images/image.png'),
                      ),
                      SizedBox(height: height * .07),
                      const Text(
                        'We will send verification code to this email account',
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
                        mycontroller: controller.email,
                        labelText: 'email',
                        iconData: Icons.mode_edit_outline_outlined,
                      ),
                      SizedBox(
                        height: height * .07,
                      ),
                      CustomButtom(
                        text: 'Send',
                        color: AppColor.summerGreen,
                        onPressed: () {
                          controller.goToAuthCode();
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ))
      ],
    ));
  }
}
