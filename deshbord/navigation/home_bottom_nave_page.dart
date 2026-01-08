import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/domain/app_colors.dart';
import 'package:spotify_app/domain/ui_helper.dart';
import 'package:spotify_app/ul/custom_btn/my_library_liked_widget.dart';
import 'package:spotify_app/ul/custom_btn/type_chip_widget.dart';

class HomeBottomNavePage extends StatelessWidget {
  List<String> mTypes = ["Playlist", "Artist", "Albums","Podcast & Chose"];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
           mSpacer(),
            titleUi(),
            mSpacer(),
            typeChipUi(),
            mSpacer( mHeight: 16),
            recentlyPlayedUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    mSpacer( mHeight: 16),
                    MyLibraryLikedWidget(isLeadingGradient: true, mGradientColors: [  Color(0xff4A39EA),
                      Color(0xff868AE1),
                      Color(0xff89D4DB),], mTitle: 'Liked Songs', mSubtitle: 'Playlist | 58 songs',),
                mSpacer( mHeight: 5),
                MyLibraryLikedWidget(mSolidColor: Colors.purple, mLeadingIcon: Icons.notifications_active, mLeadingIconColor: Colors.blue, mTitle: 'Liked Songs', mSubtitle: 'Playlist | 58 songs',),
                mSpacer( mHeight: 14),
                ListView.builder(
                  itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index){
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset("assets/images/image18.png", width: 60, height: 60,),
                          title: Text("Lolo Zeval"),
                          subtitle: Text("Artist"),
                          titleTextStyle: TextStyle(color : Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 12) ,
                        ),
                        mSpacer(),
                      ],
                    );
                    })
                          ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget titleUi(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            // radius: 22,
            backgroundImage: AssetImage("assets/images/image6.png"),
          ),
          mSpacer(),
          Text("Your Library", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          Spacer(),
          Icon(Icons.add, size: 35,color: Colors.grey,),
        ],
      ),
    );
  }
  Widget typeChipUi(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child:SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: mTypes.length,
          scrollDirection: Axis.horizontal,
            itemBuilder: (_, index){
          return TypeChipWidget(typeName: mTypes[index]);
        }),
      )
    );
  }
  Widget recentlyPlayedUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
              child: Icon(Icons.compare_arrows_rounded, size:20, color: Colors.white,)),
          mSpacer(mWidth: 2),
          Text("Recently played", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
          Spacer(),
          SvgPicture.asset("assets/svg/Component 19.svg", color: Colors.white,),
        ],
      ),
    );
  }
}
