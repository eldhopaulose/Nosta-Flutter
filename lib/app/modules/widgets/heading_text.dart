import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final Color color;
  final double marginTop,margingLeft,marginRight,marginBottom;

  const HeadingText({Key? key,required this.text,this.fontWeight=FontWeight.w600,this.fontSize=20,this.fontFamily='inter',this.color=Colors.black,this.marginTop=10.0,this.margingLeft=0,this.marginRight=0,this.marginBottom=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:marginTop,),
      child: Text(text,style: TextStyle(fontWeight:fontWeight,fontSize: fontSize,fontFamily:fontFamily,color:color),),
    );
  }
}
