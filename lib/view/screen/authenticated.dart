import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../controller/auth/verfycode_controller.dart';
import '../../core/class/logoutdialog.dart';
import '../../core/constant/color.dart';
import '../../core/shared/matButton.dart';

class Authenticated extends StatelessWidget {
  const Authenticated({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutDialog logoutDialog = LogoutDialog();

    Get.lazyPut(() => VerfyCodeControllerImp());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<VerfyCodeControllerImp>(builder: (controller) =>Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        leading: IconButton(onPressed: (){
          controller.goToBack();
        }, icon: Icon(Icons.arrow_back),
          color: Colors.grey,),
      ),
      body: SingleChildScrollView(
        child:  Stack(children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: AppColor.backgroundcolor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(86, 0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/image.png',
                      ),
                    ),
                  ),
                  child: Container(
                    width: width* .6,
                    height: height * .1,
                  ),
                ),
              ),
              SizedBox(
                height: height *  .03,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: height * .03, vertical: width * .06),
                child: Text(
                  "Verification Code",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.getFont(
                    'Montaga',
                    fontWeight: FontWeight.w400,
                    fontSize: width* .07,
                    color: AppColor.camarone,
                  ),
                ),
              ),
              Container(
                margin:
                EdgeInsets.symmetric(horizontal: height * .03, vertical: width * .02),
                child: Text(
                  "We have sent the verification code to",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.getFont(
                    'Montaga',
                    fontWeight: FontWeight.w400,
                    fontSize: width* .05,
                    color: AppColor.black,
                  ),
                ),
              ),
              Container(
                margin:
                EdgeInsets.symmetric(horizontal: height * .03),
                child: Text(
                  "your email address",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.getFont(
                    'Montaga',
                    fontWeight: FontWeight.w400,
                    fontSize: width* .05,
                    color: AppColor.black,
                  ),
                ),
              ),
              SizedBox(
                height: height *  0.1,
              ),
              Container(
                margin:
                EdgeInsets.symmetric(horizontal: height * .05),
                width: width,
                child: Center(
                  child: OTPTextField(
                    //controller: otpController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceEvenly,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 25,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        print("Changed: " + pin);
                      },
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      }),
                ),
              ),
              SizedBox(
                height: height *  .03,
              ),
              Container(
                child: Center(
                  child: Text(
                    "03:00",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Montaga',
                      fontWeight: FontWeight.w400,
                      fontSize: width* .04,
                      color: AppColor.camarone,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 229.6, 62),
                child: Text(
                  'Send again',
                  style: GoogleFonts.getFont(
                    'Montaga',
                    fontWeight: FontWeight.w400,
                    fontSize: width* .04,
                    color: AppColor.camarone,
                  ),
                ),
              ),
              SizedBox(
                height: height *  .05,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 30, 0),
                child: CustomButtom(
                  text: 'Confirm',
                  color: AppColor.summerGreen,
                  onPressed: (){
                    logoutDialog.ShowMyLogoutDialog();
                  },
                ),
              ),
            ],
          )
        ]),
      ),
    ),);

  }
}
