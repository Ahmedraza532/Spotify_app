import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomRoundedBtn extends StatelessWidget {
  VoidCallback onTap;
  double mWidth;
  double mHeight;
  Color bgColor;
  String text;
  Color textColor;
  String? mIconPath;
  bool isOutline;
  
  
  MyCustomRoundedBtn({
    required this.onTap,
    required this.text,
    this.textColor = Colors.black,
    this.mIconPath,
    this.mWidth=300,
    this.mHeight=50,
    this.bgColor = Colors.white,
    this.isOutline = false
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: mWidth,
        height: mHeight,
        child: mIconPath != null ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Row(
            children: [
              SvgPicture.asset(mIconPath!, width: 20, height: 20,),
              Expanded(child:  Center(child: Text(text, style: TextStyle(color: textColor,fontWeight: FontWeight.bold, fontSize: 16),)),)
            ],
          ),
        ): Center(
          child: Text(text,style:  TextStyle(fontWeight: FontWeight.bold,color: textColor, fontSize: 16),),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isOutline ? Colors.transparent : bgColor,
          border: isOutline ? Border.all(
            width: 1,
            color: isOutline ? Colors.white : Colors.transparent
          ) : null
        ),
      ),
    );
  }
}
