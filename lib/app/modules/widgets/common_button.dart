import 'package:e_commerse/app/modules/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  final double btnButtonWidth;
  final String btnText;
  final double btnHeight;
  final Function btnOnPressed;
  const CommonButton(
      {super.key,
      required this.btnButtonWidth,
      required this.btnText,
      required this.btnHeight,
      required this.btnOnPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => btnOnPressed(),
      child: Container(
        width: btnButtonWidth,
        height: btnHeight,
        decoration: BoxDecoration(
          color: AppColor.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(btnText,
              style: GoogleFonts.grenze(
                color: AppColor.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              )),
        ),
      ),
    );
  }
}
