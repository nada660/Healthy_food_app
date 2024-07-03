import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomButtom extends StatelessWidget {
  final String text;
  final  color;
  final void Function()? onPressed;
  const CustomButtom({super.key, required this.text, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF97BFA0)),
        borderRadius: BorderRadius.circular(50),
        color: Color(0xFFB6E5B9),
      ),
      child: Container(
        width: width * .9,
        child:  MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              'Montaga',
              fontWeight: FontWeight.w400,
              fontSize: width * .05,
              color: Color(0xFF035014),
            ),
          ),
        ),
      ),
    );
  }
}
