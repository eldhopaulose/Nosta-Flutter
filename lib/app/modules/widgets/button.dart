import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onClick;
  final double top, left, right, bottom, radius;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  const Button(
      {Key? key,
      required this.text,
      required this.onClick,
      this.top = 30,
      this.left = 22.0,
      this.right = 22.0,
      this.bottom = 0.0,
      this.radius = 15.0,
      this.color = Colors.white,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 19.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left, right: right),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 54,
        child: ElevatedButton(
          onPressed: () {
            onClick();
            // Perform login logic here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: color, fontWeight: fontWeight, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
