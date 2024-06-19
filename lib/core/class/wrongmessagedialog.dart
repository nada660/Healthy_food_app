import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_food/core/constant/color.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WrongMessageDialog extends GetxController{

  Future<bool> ShowMyWrongDialog(){
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.backgroundcolor,
              ),
              //color: AppColor.backgroundcolor,
              margin: EdgeInsets.only(top: 20),
              width: 342,
              height: 274,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Oh no!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColor.black,
                    ),
                  ),
                  Text(
                    'Something went wrong.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColor.black,
                    ),
                  ),
                  Text(
                    'Please try again',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty
                              .all(AppColor
                              .palmLeaf)),
                      onPressed: () {},
                      child: Text(
                        'Try again',
                        style: GoogleFonts.getFont(
                          'Montaga',
                          fontWeight:
                          FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFFFFDFD),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              width: 69,
              height: 69,
              top: -2,
              left: 130,
              child: Image.asset(
                  'assets/images/ellipse_3.png'),
            )
          ],
        ).animate().scaleXY(delay: 100.ms),
      ),
    );
    return Future.value(true);
  }
}