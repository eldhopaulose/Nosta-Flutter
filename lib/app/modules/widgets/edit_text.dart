import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditText extends StatelessWidget {
  final double top, left, right, bottom;
  final String text;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;

  const EditText({
    Key? key,
    this.top = 30.0,
    this.left = 22.0,
    this.right = 22.0,
    this.bottom = 0.0,
    required this.text,
    required this.textEditingController,
    this.textInputType, // No 'required' keyword here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left, right: right),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          focusColor: Colors.green,
          label: Text(text),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
