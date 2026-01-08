import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/domain/app_colors.dart';
import 'package:spotify_app/domain/ui_helper.dart';

class SearchBottomNavePage extends StatelessWidget {

  List<Map<String, dynamic>> mRecentlyPlayedList= [
   {
    "imgPath" : "assets/images/image16.png",
    "name": "The Nights"
   },
    {
      "imgPath" : "assets/images/image17.png",
      "name": "The Nights"
    },
    {
      "imgPath" : "assets/images/image18.png",
      "name": "The Nights"
    },
    {
      "imgPath" : "assets/images/image19.png",
      "name": "The Nights"
    },


  ];

  List<Map<String, dynamic>> mReviewList= [
    {
      "imgPath" : "assets/images/image12.png",
      "name": "The Nights"
    },
    {
      "imgPath" : "assets/images/image13.png",
      "name": "The Nights"
    },
  ];

  List<Map<String, dynamic>> mEditorsPickList= [
    {
      "imgPath" : "assets/images/image14.png",
      "name": "The Nights. \n Class Animals. Check xcx"
    },
    {
      "imgPath" : "assets/images/image15.png",
      "name": "The Nights. \n Class Animals. Check xcx"
    },
    {
      "imgPath" : "assets/images/image20.png",
      "name": "The Nights. \n Class Animals. Check xcx"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              recentlyPlayedUI(),
              mSpacer(mHeight: 14),
              recentlyPlayedListUI(),
              mSpacer(),
              reviewUI(),
              mSpacer( mHeight: 22),
              reviewListUI(),
              mSpacer(),
              editorPicksUI(),
              mSpacer( mHeight: 14),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentlyPlayedUI(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            children: [
              Text("Recently played", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              Spacer(),
              SvgPicture.asset("assets/svg/bell_icon.svg", width: 22, height: 22,),
              mSpacer(mWidth: 20),
              SvgPicture.asset("assets/svg/orientation lock.svg", width: 22, height: 22,),
              mSpacer( mWidth: 20),
              SvgPicture.asset("assets/svg/Settings.svg", width: 24, height: 24,),
            ],
          ),
        )
      ],
    );
  }

  Widget recentlyPlayedListUI() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mRecentlyPlayedList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              children: [
                Image.asset(mRecentlyPlayedList[index]["imgPath"], width: 100, height: 100,),
                mSpacer(mHeight: 8),
                Text(mRecentlyPlayedList[index]["name"], style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget reviewUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        children: [
          Image.asset("assets/images/image11.png", width: 50, height: 50,),
          mSpacer(),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("#SPOTIFYWRAPPED", style: TextStyle(color: Colors.grey, fontSize: 11,),),
              Text("Your 2021 in review", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ))
        ],
      ),
    );
  }

  Widget reviewListUI() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mReviewList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(mReviewList[index]["imgPath"], width: 150, height: 150, fit: BoxFit.cover,),
                  mSpacer(mHeight: 8),
                  Text(mReviewList[index]["name"], style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                ],
              ),
            );
          }
      ),
    );
  }

  Widget editorPicksUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text("Editor's Picks", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        mSpacer( mHeight: 7),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mEditorsPickList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(mEditorsPickList[index]["imgPath"], width: 150, height: 150,),
                      mSpacer(mHeight: 8),
                      Text(mEditorsPickList[index]["name"], style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),),
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }

}