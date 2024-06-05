import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_food/core/constant/color.dart';

class LogoutDialog extends GetxController{

  Future<bool> ShowMyLogoutDialog(){
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
                margin: EdgeInsets.only(top:  20),
                width: 342,
                height: 274,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Oh no! You’re leaving...',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Cabin',
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Color(0xFF035014),
                      ),
                    ),
                    Text(
                      'Are you sure?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Cabin',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF035014),
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
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'No',
                        style: GoogleFonts.getFont(
                          'Montaga',
                          fontWeight:
                          FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF035014),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty
                              .all(AppColor
                              .evBotton)),
                      onPressed: () {},
                      child: Text(
                        'Yes,Log Me out',
                        style: GoogleFonts.getFont(
                          'Montaga',
                          fontWeight:
                          FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF035014),
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
                    'assets/images/log_out_12.png'),
              )
            ],
          ),
        ),

    );
    return Future.value(true);
  }
}