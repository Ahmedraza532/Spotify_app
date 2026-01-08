import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/ul/custom_btn/my_custom_rounded_btn.dart';

import '../../domain/app_colors.dart';
import '../../domain/app_routes.dart';
import '../../domain/ui_helper.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int selectedIndex = 0;
  List<Widget> allPages = [];
  bool isPP1Selected = false;
  bool isPP2Selected = false;

  @override
  void initState() {
    super.initState();
    allPages= [
      stepOneUI(context),
      stepTwoUI(context),
      stepThreeUI(context),
      stepFourUI(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        title: Text("Create Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        leading: InkWell(
          onTap: () {
           if(selectedIndex>0){
             selectedIndex--;
             setState(() {

             });
           } else {
             Navigator.pop(context);
           }
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset("assets/svg/Left.svg", color: Colors.white,),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            allPages[selectedIndex],
            mSpacer(
              mHeight: 21,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: selectedIndex<3 ? 10 : 38),
              child: MyCustomRoundedBtn(
                mWidth: selectedIndex<3 ?  100 : 180,
                text: selectedIndex<3 ?  "Next" : " Create an Account",
                onTap: () {
                  if(selectedIndex<3){
                    selectedIndex++;
                    setState(() {

                    });
                  } else {
                    Navigator.pushNamed(context, AppRoutes.choose_artist_page);
                  }
                },
              ),
            ),
          ]
        )
      ),
    );
  }

  Widget stepOneUI(BuildContext context) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(' What\' s your email?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(
        mHeight: 7,
      ),
      Text(' You will need to confirm this letter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center,),
    ],
  );

  Widget stepTwoUI(BuildContext context) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(' Create a Password', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(
        mHeight: 7,
      ),
      Text(' Use atleast 8 characters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center,),
    ],
  );

  Widget stepThreeUI(BuildContext context) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(' What\' s your gender?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
      mSpacer(),
      Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        runSpacing: 11,
        spacing: 11,
        children: [
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutline: true,
            textColor: Colors.white,
            text: 'Male',
            bgColor: AppColors.primaryColor,
          onTap: (){

          },
          ),
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutline: true,
            textColor: Colors.white,
            text: 'Female',
            bgColor: AppColors.primaryColor,
            onTap: (){

            },
          ),
          MyCustomRoundedBtn(
            mWidth: 140,
            mHeight: 34,
            isOutline: true,
            textColor: Colors.white,
            text: 'Not prefer to say',
            bgColor: AppColors.primaryColor,
            onTap: (){

            },
          ),
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutline: true,
            textColor: Colors.white,
            text: 'Other',
            bgColor: AppColors.primaryColor,
            onTap: (){

            },
          )
        ],
      )
    ],
  );

  Widget stepFourUI(BuildContext context) =>  Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' What\' s your name?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: getCreateAccTextFieldDecoration(),
        ),
        mSpacer(
          mHeight: 7,
        ),
        Text(' This appears on your spotify profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center,),
        mSpacer( mHeight: 11),
        Divider(
          color: AppColors.greyColor,
          height: 1,
          thickness: 1,
        ),
        mSpacer( mHeight: 11),
        Text('By Tapping on "Create account" , you agree to our Spotify\'s Terms of Use', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
        mSpacer( mHeight: 21),
        Text('Terms of Use', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),),
        mSpacer(mHeight: 21),
        Text('To learn more about how spotify collect uses, shares and protects your personal data. Please see the Spotify Privacy Policy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
        mSpacer(mHeight: 21),
        Text('Privacy Policy', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
            title: Text('Please send me news and offer by Spotify', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
            value: isPP1Selected, groupValue: false, onChanged: (value){
            isPP1Selected = value!;
            setState(() {

            });
        } ),
        RadioListTile.adaptive(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text('Share my registration data with Spotify context providers for marketing process', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
            value: isPP2Selected, groupValue: false, onChanged: (value){
          isPP2Selected = value!;
          setState(() {

          });
        } )
      ],
    ),
  );
}
