import 'package:e_commerse/app/modules/data/colors.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String offer;
  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: Text(
        '$offer OFF',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 15,
          color: AppColor.black,
        ),
      )),
    );
  }
}
