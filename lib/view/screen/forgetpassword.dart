import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_food/controller/auth/forgetpasswordcontroller.dart';
import '../../core/constant/color.dart';
import '../../core/shared/customTextFormField.dart';
import '../../core/shared/matButton.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgotPasswordControllerImp());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ForgotPasswordControllerImp>(builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.backgroundcolor,
            leading: IconButton(onPressed: (){
              controller.goToBack();
            }, icon: Icon(Icons.arrow_back),
              color: Colors.grey,),
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
              child:  Form(
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
              ).animate().shimmer(duration: const Duration(seconds: 1)).fadeIn(delay: 100.ms,curve: Curves.easeOut),
            ),
          )
        ],
      )),
    );
  }
}
