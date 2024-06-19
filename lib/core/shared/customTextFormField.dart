import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../constant/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hinttext;
  final String? Function(String?)? valid;
  final String labelText;
  final bool? obscureText;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final type;
  final void Function()? onTapIcon;

  const CustomTextFormField({
    super.key,
    this.hinttext,
    this.valid,
    required this.labelText,
    this.obscureText,
    this.iconData,
    this.mycontroller,
    this.type,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: TextFormField(
        keyboardType: type,
        //onChanged: (value) => password = value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 25, bottom: 5, left: 10),
            constraints:
                BoxConstraints(maxHeight: height * 0.068, maxWidth: width),
            suffixIcon: InkWell(
              child: Icon(
                iconData,
                color: Colors.grey,
                size: 20,
              ),
              onTap: onTapIcon,
            ),
            labelText: labelText,
            hintText: hinttext,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, fontFamily: 'Cabin'),
            filled: true,
            fillColor: AppColor.textColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xffD7DDDB)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xffD7DDDB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xffD7DDDB)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        validator: valid,
      ),
    );
  }
}
