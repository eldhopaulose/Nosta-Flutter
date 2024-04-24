import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String fontFamily;
  final FontWeight fontWeight;
  final double top,left,right,bottom;
  const TextView({Key?key,required this.text,required this.fontSize,required this.color,this.fontFamily='inter',this.fontWeight=FontWeight.w300,this.right=0,this.left=0,this.top=0,this.bottom=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: left,right: right,top: top,bottom: bottom),
      child: Text(text,style: TextStyle(color: color,fontSize: fontSize,fontWeight:fontWeight,fontFamily:fontFamily),),
    );
  }
}