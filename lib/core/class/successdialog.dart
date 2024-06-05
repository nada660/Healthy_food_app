import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_food/core/constant/color.dart';

class SuccessDialog extends GetxController{
  final gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.centerLeft,
    colors: [
      AppColor.evBotton2,
      AppColor.evBotton,
    ],
  );
  Future<bool> ShowMySuccessDialog(){
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(20),
                color: AppColor.backgroundcolor,
              ),
              //color: AppColor.backgroundcolor,
              margin: EdgeInsets.only(top: 20),
              width: 393,
              height: 375,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                      'assets/images/Group 11.png'),
                  SizedBox(
                    height: 20,
                  ),
                  ShaderMask(
                    shaderCallback: (bounds){
                      return gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                    },
                    child: Text(
                      'Success!',
                      style: GoogleFonts.getFont(
                        'Cabin',
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Color(0xFFB6E5B9),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    'Congratulations! You have been',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFFB6B6B6),
                    ),
                  ),
                  Text(
                    'successfully authenticated',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFFB6B6B6),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty
                            .all(AppColor
                            .evBotton)),
                    onPressed: () {},
                    child: Text(
                      'Continue',
                      style: GoogleFonts.getFont(
                        'Montaga',
                        fontWeight:
                        FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.camarone,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return Future.value(true);
  }
}