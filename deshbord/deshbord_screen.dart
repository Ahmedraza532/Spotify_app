import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify_app/domain/app_colors.dart';
import 'package:spotify_app/ul/custom_btn/my_compact_music_player_widgit.dart';
import 'package:spotify_app/ul/deshbord/navigation/librery_bottom_nave_page.dart';

import '../../domain/ui_helper.dart';
import 'navigation/home_bottom_nave_page.dart';
import 'navigation/search_bottom_nave_page.dart';

class DeshbordPage extends StatefulWidget {
  const DeshbordPage({super.key});

  @override
  State<DeshbordPage> createState() => _DeshbordScreenState();
}

class _DeshbordScreenState extends State<DeshbordPage> {
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    initializePaletteGenerator();
  }
  initializePaletteGenerator() async {
    paletteGenerator = await getColorPalette("assets/images/image18.png");
    print(paletteGenerator!.dominantColor!.color);
    setState(() {});
  }

  int selectedBottomIndex = 0;
  List<Widget> mBottomNavPages = [
    SearchBottomNavePage(),
    LibreryBottomNavePage(),
    HomeBottomNavePage(),
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [Padding(
            padding: const EdgeInsets.only(bottom: 68.0),
            child: mBottomNavPages[selectedBottomIndex],
          ),
            Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      isScrollControlled: true,
                        context: context, builder: (_){
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.16,0.1],
                              colors:[
                                paletteGenerator!.dominantColor!.color.computeLuminance() <0.179 ? paletteGenerator!.colors.toList()[2] : paletteGenerator!.dominantColor!.color,
                                Colors.black
                              ]
                          )
                        ),
                      );
                    });
                  },
                    child: MyCompactMusicPlayerWidgit(songTitle: "From me to you", albumTitle: "THE BEAT LESS ", bgColor: Color(0xff550A1C), thumbnailPath: "assets/images/image18.png", isBluetooth: true, bluetoothName: "BEATSPELL+",))
                )
          ],
      ),
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomIndex,
        iconSize: 16,
        selectedLabelStyle: TextStyle(color:  AppColors.whiteColor),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.secondaryBlackColor,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
          selectedBottomIndex = value;
          setState(() {

          });
          },
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/svg/Home_outline.svg", color: Colors.grey,), label: "Home",
            activeIcon: SvgPicture.asset("assets/svg/Home_Solid.svg", color: AppColors.whiteColor,),
            ),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/svg/Search_outline.svg", color: Colors.grey,), label: "Search",
              activeIcon: SvgPicture.asset("assets/svg/Search_Solid.svg", color: AppColors.whiteColor,),
            ),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/svg/Library_outline.svg", color: Colors.grey,), label: "Library",
              activeIcon: SvgPicture.asset("assets/svg/Library_Solid.svg", color: AppColors.whiteColor,),
            ),
          ],
      ),
    );
  }
}

