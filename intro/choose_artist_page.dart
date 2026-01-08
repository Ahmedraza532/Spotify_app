import 'package:flutter/material.dart';
import 'package:spotify_app/domain/ui_helper.dart';
import 'package:spotify_app/ul/custom_btn/my_circular_img_bg.dart';

import '../../domain/app_colors.dart';
import '../../domain/app_routes.dart';
import '../custom_btn/my_custom_rounded_btn.dart';

class ChooseArtistPage extends StatefulWidget {
  @override
  State<ChooseArtistPage> createState() => _ChooseArtistPageState();
}

class _ChooseArtistPageState extends State<ChooseArtistPage> {
  List<int> mSelectedArtists = [];

  List<Map<String, dynamic>> mArtists = [
    {
      "imgPath": "assets/images/image2.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/iamge3.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image4.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image5.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image7.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image8.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image9.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image10.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image2.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/iamge3.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image4.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image5.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image7.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image8.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image9.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image10.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image2.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/iamge3.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image4.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image5.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image7.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image8.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image9.png",
      "name": "Members",
    },
    {
      "imgPath": "assets/images/image10.png",
      "name": "Members",
    },
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
                  child: Text("Choose 3 or more artist you like.", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GridView.builder(
                        itemCount: mArtists.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 11,
                          childAspectRatio: 8/10,
                        ),
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              if(!mSelectedArtists.contains(index)){
                                mSelectedArtists.add(index);
                                setState(() {

                                });
                              } else {
                                mSelectedArtists.remove(index);
                                setState(() {

                                });
                              }
                            },
                            child: Column(
                              children: [
                                MyCircularImgBg(imgPath: mArtists[index]["imgPath"],isSelected: mSelectedArtists.contains(index),),
                                mSpacer(),
                                Text(mArtists[index]["name"], style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 180,
                        child: mSelectedArtists.length>=3 ?  Center(
                          child: MyCustomRoundedBtn(
                            mWidth: 100,
                            text:   "Next",
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.choose_podcast_page);
                            },
                          ),
                        ) : Container(),
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
