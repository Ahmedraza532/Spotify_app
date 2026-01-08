import 'package:flutter/material.dart';
import 'package:spotify_app/domain/ui_helper.dart';

class MyLibraryLikedWidget extends StatelessWidget {

  bool isLeadingGradient;
  List<Color>? mGradientColors;
  Color? mSolidColor;
  IconData mLeadingIcon;
  Color mLeadingIconColor;
  String mTitle;
  String mSubtitle;

  MyLibraryLikedWidget({this.isLeadingGradient = false, this.mGradientColors, this.mSolidColor, this.mLeadingIcon = Icons.favorite, this.mLeadingIconColor = Colors.white, required this.mTitle, required this.mSubtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        child: Icon(mLeadingIcon,color: mLeadingIconColor,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
            color: mSolidColor ?? Color(0xff5E387A),
          gradient: isLeadingGradient ? LinearGradient(
              colors: mGradientColors ?? [
                Color(0xff4A39EA),
                Color(0xff868AE1),
                Color(0xff89D4DB),
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ) : null
        ),
      ),
      title: Text(mTitle),
      titleTextStyle: TextStyle(color : Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 12) ,
      subtitle: Row(
        children: [
          Icon(Icons.local_pizza_rounded),
          mSpacer(mWidth: 4),
          Text(mSubtitle),
        ],
      ),
    );
  }
}
