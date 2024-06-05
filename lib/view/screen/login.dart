import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_food/core/constant/color.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:healthy_food/core/functions/validinput.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/constant/routes.dart';
import '../../core/shared/customTextFormField.dart';
import '../../core/shared/matButton.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
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
              child: GetBuilder<LoginControllerImp>(
            builder: (controller) => Form(
              key: controller.formstate,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: height * .042),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .05),
                      Image(
                        image: AssetImage('assets/images/image.png'),
                      ),
                      //SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          CustomTextFormField(
                            type: TextInputType.emailAddress,
                            //hinttext: 'test@gmail.com',
                            mycontroller: controller.email,
                            labelText: 'email',
                            iconData: Icons.mode_edit_outline_outlined,
                            valid: (val) {
                              return validInput(val!, 10, 100, "email");
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormField(
                            type: TextInputType.phone,
                            labelText: 'Mobile Number',
                            mycontroller: controller.mobilenumber,
                            iconData: Icons.phone_android_outlined,
                            valid: (val) {
                              return validInput(val!, 10, 20, "Mobile Number");
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Obx(() => CustomTextFormField(
                            type: TextInputType.text,
                            labelText: 'Password',
                            mycontroller: controller.password,
                            iconData: Icons.lock_outline,
                            obscureText: controller.isshowpasseord.value,
                            onTapIcon: (){
                              controller.isshowpasseord.value =! controller.isshowpasseord.value;
                            },
                            valid: (val) {
                              return validInput(val!, 8, 20, "Password");
                            },
                          ),),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomButtom(
                            text: 'Login',
                            color: AppColor.summerGreen,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16.5, 0, 0, 135),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                width: width * 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //margin: EdgeInsets.fromLTRB(0, 0.5, 8, 0.5),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: height * 0.03,
                                            child: Image(
                                              image: AssetImage('assets/images/checkcircle.png'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * .3,
                                            child: Text(
                                              'Remember me',
                                              style: GoogleFonts.getFont(
                                                'Montaga',
                                                fontWeight: FontWeight.w400,
                                                fontSize: width * .04,
                                                color: AppColor.camarone,
                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Get.offNamed(AppRoute.forgetPassword);
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: GoogleFonts.getFont(
                                          'Cabin',
                                          fontWeight: FontWeight.w400,
                                          fontSize: width * .04,
                                          color: AppColor.camarone,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFA3C5B0)),
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0x4DB6E5B9),
                            ),
                            child: Container(
                              width: width * .9,
                              padding: EdgeInsets.fromLTRB(5, 9, 0, 9),
                              child: InkWell(
                                onTap: () {
                                  controller.goToSignUp();
                                },
                                child: Text(
                                  'Create new account',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Montaga',
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * .05,
                                    color: AppColor.camarone,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
          Column(children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width * 0.3,
                  height: height * 0.2,
                  child: Image.asset('assets/images/Ellipse 2.png'),
                )
              ],
            )),
          ]),
        ],
      ),
    );
  }
}
