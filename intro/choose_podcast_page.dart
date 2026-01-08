import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_app/domain/ui_helper.dart';
import 'package:spotify_app/ul/custom_btn/my_circular_img_bg.dart';
import 'package:spotify_app/ul/custom_btn/my_rounded_img_card.dart';

import '../../domain/app_colors.dart';
import '../../domain/app_routes.dart';
import '../custom_btn/my_custom_rounded_btn.dart';
import '../deshbord/deshbord_screen.dart';

class ChoosePodcastPage extends StatelessWidget {
  List<List<Map<String, dynamic>>> mPodcast = [
    [
      {
        "imgPath": "assets/images/image2.png",
        "name": "Members",
        "isBlackBg" : false,
        "isSpotifyOriginal" : true,
      },
      {
        "imgPath": "assets/images/image7.png",
        "name": "Members",
        "isBlackBg" : false,
        "isSpotifyOriginal" : false,
      },
      {
        "imgPath": "",
        "name": "More in true crime",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
    ],
    [
      {
        "imgPath": "assets/images/image4.png",
        "name": "Members",
        "isBlackBg" : true,
        "isSpotifyOriginal" : true,
      },
      {
        "imgPath": "assets/images/image5.png",
        "name": "Members",
        "isBlackBg" : false,
        "isSpotifyOriginal" : true,
      },
      {
        "imgPath": "",
        "name": "More in comedy",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
    ],
    [
      {
        "imgPath": "assets/images/image7.png",
        "name": "Members",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
      {
        "imgPath": "assets/images/image8.png",
        "name": "Members",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
      {
        "imgPath": "",
        "name": "More in Stories",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
    ],
    [
      {
        "imgPath": "assets/images/image9.png",
        "name": "Members",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
      {
        "imgPath": "assets/images/image10.png",
        "name": "Members",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
      {
        "imgPath": "",
        "name": "More in Relationship",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
    ],
    [
      {
        "imgPath": "assets/images/image2.png",
        "name": "Members",
        "isBlackBg" : false,
        "isSpotifyOriginal" : true,
      },
      {
        "imgPath": "assets/images/iamge3.png",
        "name": "Members",
        "isBlackBg" : true,
        "isSpotifyOriginal" : true,
      },
      {
        "imgPath": "",
        "name": "More in dark",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
    ],
    [
      {
        "imgPath": "assets/images/image4.png",
        "name": "Members",
        "isBlackBg" : true,
        "isSpotifyOriginal" : true,
      },
      {
        "imgPath": "assets/images/image5.png",
        "name": "Members",
        "isBlackBg" : false,
        "isSpotifyOriginal" : true,
      },
      {
        "imgPath": "",
        "name": "More in Song's",
        "isBlackBg" : true,
        "isSpotifyOriginal" : false,
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 300,
                  child: Text("Now Choose Some Podcast", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)),
              mSpacer(mHeight: 11),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: getSearchTextFieldDecoration(),
                ),
              ),
              mSpacer(mHeight: 21),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: mPodcast.length,
                      itemBuilder: (_, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 11),
                          height: 170,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mPodcast[index].length,
                            itemBuilder: (_,childIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Column(
                                  children: [
                                   childIndex == 2 ? Container(
                                     padding: EdgeInsets.symmetric(horizontal: 11),
                                         width: 120,
                                         height: 120,
                                     child: Center(
                                       child: Text(mPodcast[index][childIndex]['name'],style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                     ),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(11),
                                           color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                         ),
                                   ) :
                                   MyRoundedImgCard(
                                      mWidth: 120,
                                      mHeight: 120,
                                      imgPath: mPodcast[index][childIndex]["imgPath"], isBlackBg: mPodcast[index][childIndex]['isBlackBg'], isSpotifyOriginal: mPodcast[index][childIndex]['isSpotifyOriginal'],),

                                    mSpacer(),
                                    Text(
                                      childIndex == 2 ? "" :
                                      mPodcast[index][childIndex]["name"], style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 180,
                        child: Center(
                          child: MyCustomRoundedBtn(
                            mWidth: 100,
                            text:   "Done",
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DeshbordPage(),));
                            },
                          ),
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                stops: [0.05, 0.8],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ]
                            )
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
