import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controller/auth/signup_controller.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';
import '../../core/shared/customTextFormField.dart';
import '../../core/shared/matButton.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
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
              child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => Form(
              key: controller.formstate,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .03),
                      /*Image(
                        image: AssetImage('assets/images/image.png'),
                      ),*/
                      //SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: width * .05,
                            height: height * .09,
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(0, 0, 90.3, 45.3),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: width * .93,
                                height: height *.098,
                                child: SvgPicture.asset(
                                  'assets/vectors/group_11_x2.svg',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          CustomTextFormField(
                            type: TextInputType.text,
                            mycontroller: controller.username,
                            labelText: 'UserName',
                            valid: (val) {
                              return validInput(val!, 5, 30, "username");
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormField(
                            type: TextInputType.emailAddress,
                            mycontroller: controller.email,
                            iconData: Icons.mode_edit_outline_outlined,
                            //hinttext: 'test@gmail.com',
                            labelText: 'email',
                            valid: (val) {
                              return validInput(val!, 10, 100, "email");
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormField(
                            type: TextInputType.phone,
                            mycontroller: controller.mobile,
                            labelText: 'Mobile Number',
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
                            obscureText: controller.isshowpasseord2.value,
                            iconData: controller.isshowpasseord2.value? Icons.visibility
                            :Icons.visibility_off,
                            onTapIcon: (){
                              controller.isshowpasseord2.value =! controller.isshowpasseord2.value;
                            },
                            valid: (val) {
                              return validInput(val!, 8, 20, "password");
                            },
                          ),),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Obx(() => CustomTextFormField(
                            type: TextInputType.text,
                            mycontroller: controller.confirm,
                            labelText: 'Confirm Password',
                            iconData: controller.isshowpasseord2.value? Icons.visibility
                                :Icons.visibility_off,
                            obscureText: controller.isshowpasseord.value,
                            onTapIcon: (){
                              controller.isshowpasseord.value =! controller.isshowpasseord.value;
                            },
                            valid: (val) {
                              return validInput(val!, 8, 20, "password");
                            },
                          ),),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFD7DDDB)),
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.textColor,
                            ),
                            child: SizedBox(
                              width: width * 0.46,
                              height: height * .045,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(15.4, 9, 13, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: controller.pickFile,
                                      child: Container(
                                        margin:
                                        EdgeInsets.fromLTRB(0, 0, 12.4, 1),
                                        child: Text(
                                          'Certificate PDF file ',
                                          style: GoogleFonts.getFont(
                                            'Cabin',
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * .04,
                                            color: AppColor.springRain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                      child: SizedBox(
                                        width: width * .05,
                                        height: height * .07,
                                        child: SvgPicture.asset(
                                          'assets/vectors/Group.svg',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomButtom(
                            text: 'Sign up',
                            color: AppColor.summerGreen,
                            onPressed: () {
                              controller.signUp();
                            },
                          ),
                          SizedBox(
                            height: height * .04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account ?   ',
                                  style: GoogleFonts.getFont(
                                    'Cabin',
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * .035,
                                    color: AppColor.camarone,
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    controller.goToLogin();
                                  },
                                  child: Text(
                                    'Log in ',
                                    style: GoogleFonts.getFont(
                                      'Cabin',
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * .035,
                                      height: 1.3,
                                      color: AppColor.textColor1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).animate().shimmer(duration: const Duration(seconds: 1)).slideX(delay: 100.ms,curve: Curves.easeOut).then(),
            ),
          )),
          Column(children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width *.018,
                  height: height *.019,
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
