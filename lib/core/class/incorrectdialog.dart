import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_food/core/constant/color.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IncorrectDialog extends GetxController{

  Future<bool> ShowMyIncorrectDialog(){
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
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x80000000),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
                color: Color(0xE5FFFDFD),
              ),
              //color: AppColor.backgroundcolor,
              margin: EdgeInsets.only(top: 20),
              width: 342,
              height: 274,
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
                      'assets/images/Group.png'),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Sorry!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      height: 1.3,
                      color: AppColor.camarone,
                    ),
                  ),
                  Text(
                    'Incorrect password or email',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 1.3,
                      color: AppColor.camarone,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).animate().scaleXY(delay: 100.ms),
      ),
    );
    return Future.value(true);
  }
}