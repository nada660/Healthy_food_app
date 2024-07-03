import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/auth/home_contrroler.dart';
import '../../core/class/logoutdialog.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

final LogoutDialog logoutDialog = LogoutDialog();

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.grey,
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Home",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty
                        .all(AppColor
                        .evBotton)),
                onPressed: () {
                  logoutDialog.ShowMyLogoutDialog();
                },
                child: Text(
                  'LogOut',
                  style: GoogleFonts.getFont(
                    'Montaga',
                    fontWeight:
                    FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF035014),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty
                        .all(AppColor
                        .evBotton)),
                onPressed: () {
                  Get.toNamed(AppRoute.deleteAccount);
                },
                child: Text(
                  'Delete my account',
                  style: GoogleFonts.getFont(
                    'Montaga',
                    fontWeight:
                    FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF035014),
                  ),
                ),
              ),
            ),
            /*
            InkWell(
                onTap: () {
                  logoutDialog.ShowMyLogoutDialog();
                  //Get.find<HomeControllerImp>().logout();
                },
                child: const Text(
                  "Log Out",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.deleteAccount);
                },
                child: const Text(
                  "Delete My\n Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black45,
                  ),
                )),

             */
          ],
        )
      ]),
    );
  }
}
