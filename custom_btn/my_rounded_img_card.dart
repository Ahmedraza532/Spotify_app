import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/ul/custom_btn/my_custom_rounded_btn.dart';

class MyRoundedImgCard extends StatelessWidget {
  double mWidth;
  double mHeight;
  String imgPath;
  bool isSpotifyOriginal;
  bool isBlackBg;

  MyRoundedImgCard({ this.mWidth = 90, this.mHeight = 90, required this.imgPath,  this.isSpotifyOriginal = true, this.isBlackBg = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mHeight,
      child: isSpotifyOriginal ? Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(11)),
            color: isBlackBg ? Colors.white : Colors.black,
          ),
          child: Center(
            child: SvgPicture.asset("assets/logo/Logo.svg", width: 14, height: 14, color: isBlackBg ? Colors.black : Colors.white,),
          ),
        ),
      ): Container(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
          image: DecorationImage(
            image: AssetImage(imgPath),
          )
      ),
    );
  }
}
