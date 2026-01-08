import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/domain/app_colors.dart';
import 'package:spotify_app/domain/ui_helper.dart';
import 'package:spotify_app/ul/custom_btn/album_row_widget.dart';

class LibreryBottomNavePage extends StatelessWidget {
  List<Map<String, dynamic>> mTopGenreList = [
      {
      "imgPath" : "assets/images/image16.png",
      "name": "Pop"
    },
    {
    "imgPath" : "assets/images/image17.png",
    "name": "Indie"
    },
    {
    "imgPath" : "assets/images/image18.png",
    "name": "The Nights"
    },

    {
    "imgPath" : "assets/images/image16.png",
    "name": "The Nights"
    },
];
  List<Map<String, dynamic>> mPodcastList = [
    {
      "imgPath" : "assets/images/image11.png",
      "name": "News & Politics"
    },
    {
      "imgPath" : "assets/images/image12.png",
      "name": "Comedy"
    },
    {
      "imgPath" : "assets/images/image13.png",
      "name": "The Nights"
    },

    {
      "imgPath" : "assets/images/image14.png",
      "name": "The Nights"
    },
  ];
  List<Map<String, dynamic>> mBrowsList = [
    {
      "imgPath" : "assets/images/image16.png",
      "name": "2021 Wraped"
    },
    {
      "imgPath" : "assets/images/image17.png",
      "name": "Podcast"
    },
    {
      "imgPath" : "assets/images/image18.png",
      "name": "Made For You"
    },

    {
      "imgPath" : "assets/images/image16.png",
      "name": "The Nights"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              mSpacer(),
              titleUi(),
              mSpacer(mHeight: 14),
              SearchBarUI(),
              mSpacer(mHeight: 14),
              topGenresUI(),
              mSpacer(mHeight: 14),
              popularPodcast(),
              mSpacer(mHeight: 14),
              browsAll(),
              mSpacer(),
            ],
          ),
        ),
      ),
    );
  }
  Widget titleUi(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Search", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
          Spacer(),
          Icon(Icons.camera_alt_outlined, size: 30, color: Colors.white,),
          mSpacer(mWidth: 20),
        ],
      ),
    );
  }

  Widget SearchBarUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.0),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11)
        ),
        child: TextField(
          cursorColor: AppColors.primaryColor,
          autofocus: false,
          decoration: InputDecoration(
            hintText: "Artist, songs, or prodcast",
            hintStyle: TextStyle(color: Colors.black,),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset("assets/svg/Search_Solid.svg",width: 25, height: 25,),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget topGenresUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Genres", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mTopGenreList.length,
              shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
              return Padding(
                padding: const EdgeInsets.only(right: 11.0),
                child: AlbumRowWidget(thumbnailPath: mTopGenreList[index]["imgPath"], albumName: mTopGenreList[index]["name"],),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget popularPodcast() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Podcast Categories", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mPodcastList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
                  return Padding(
                    padding: const EdgeInsets.only( right: 11.0),
                    child: AlbumRowWidget(thumbnailPath: mPodcastList[index]["imgPath"], albumName: mPodcastList[index]["name"],),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget browsAll(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Brows Row", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
          mSpacer(),
          GridView.builder(
            itemCount: mBrowsList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 16/9,
            mainAxisSpacing: 11, crossAxisSpacing: 11,),
              itemBuilder: (_, index){
                return AlbumRowWidget(thumbnailPath: mBrowsList[index]["imgPath"], albumName: mBrowsList[index]["name"],);
              }, ),
        ],
      ),
    );
  }
}
