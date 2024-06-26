import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/constant/color.dart';
import '../../controller/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              color: AppColor.backgroundcolor,
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              height: splashScreenController.animate.value ? 750 : 0,
              width: splashScreenController.animate.value ? 400 : 0,
              duration: const Duration(milliseconds: 1500),
              child: Center(
                  child: Container(
                decoration: const BoxDecoration(
                  image:  DecorationImage(
                    image: AssetImage('assets/images/image.png'),
                    scale: 2,
                  ),
                ),
              )),
            ),
          ),
          Column(children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 210,
                  height: 190,
                  child: Image.asset('assets/images/Ellipse 1.png'),
                )
              ],
            )),
          ]),
        ],
      ),
    );
  }
}
