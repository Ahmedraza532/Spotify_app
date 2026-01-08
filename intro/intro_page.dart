import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/domain/app_colors.dart';
import 'package:spotify_app/domain/app_routes.dart';
import 'package:spotify_app/domain/ui_helper.dart';
import 'package:spotify_app/ul/custom_btn/my_custom_rounded_btn.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
            children: [
              Image.asset("assets/images/IMG_2756 1.png",),
            Container(
               width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.blackColor.withOpacity(0.3),
                    AppColors.blackColor
                  ]
                )
              ),
           ),
              bottomLoginUI(context),
         ],
        ),
      ),
    );
  }
  Widget bottomLoginUI(BuildContext context) =>  Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 50),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/logo/Logo.svg", width: 50, height: 50,),
          mSpacer(),
          Text('Millions of Songs.\n Free on Spotify', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25), textAlign: TextAlign.center,),
          mSpacer(),
          MyCustomRoundedBtn(
            text: "Sign Up free",
            bgColor: AppColors.primaryColor,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.create_account_page);
            },),
          mSpacer(),
          MyCustomRoundedBtn(
            isOutline: true,
            mIconPath: "assets/logo/google.svg" ,
            text: "Continue with Google",
            bgColor: AppColors.primaryColor,
            textColor: Colors.white,
            onTap: () {

            },),
          mSpacer(),
          MyCustomRoundedBtn(
            isOutline: true,
            mIconPath: "assets/logo/facebook.svg" ,
            text: "Continue with Facebook",
            bgColor: AppColors.primaryColor,
            textColor: Colors.white,
            onTap: () {

            },),
          mSpacer(),
          MyCustomRoundedBtn(
            isOutline: true,
            mIconPath: "assets/logo/Vector.svg" ,
            text: "Continue with iPhon",
            bgColor: AppColors.primaryColor,
            textColor: Colors.white,
            onTap: () {

            },),
          mSpacer(),
          SizedBox(height: 10,),
          TextButton(onPressed: (){}, child: Text('Login', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
        ],
    ),
  );
}
