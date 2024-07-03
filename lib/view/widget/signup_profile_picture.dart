import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/constant/color.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/auth/signup_controller.dart';

class SignUpProfilePicture extends StatefulWidget {

  const SignUpProfilePicture({
    super.key,
  });

  @override
  State<SignUpProfilePicture> createState() => _SignUpProfilePictureState();
}

class _SignUpProfilePictureState extends State<SignUpProfilePicture> {
  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  SignUpControllerImp signUpControllerImp =Get.put(SignUpControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
        init: SignUpControllerImp(),
        builder: (controller)=> Stack(
      alignment: Alignment.center,
      children: [
        signUpControllerImp.pickedFile!= null
            ? CircleAvatar(
          radius: 65,
          backgroundImage: Image.file(File(signUpControllerImp.pickedFile!.path)).image,
        )
            :const CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage:  AssetImage(
            'assets/images/OIP.jpg',
          ),
          radius: 65,
        ),
        Positioned(
          right: 1,
          bottom: 15,
          child: InkWell(
            child: Icon(Icons.camera_alt),
            onTap: () {
              print("Camera clicked");
              showModalBottomSheet(
                context: context,
                builder: (context) => bottomSheet(context),
              );
            },
          ),
        ),
      ],
    ));
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color:AppColor.limeade,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.limeade),
                    ),
                  ],
                ),
                onTap: () {
                  signUpControllerImp.takePhoto(ImageSource.gallery);
                  Get.back();
                },
              ),
              const SizedBox(
                width: 80,
              ),
              InkWell(
                child:  Column(
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: AppColor.camarone,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.camarone,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  signUpControllerImp.takePhoto(ImageSource.camera);
                  Get.back();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
