import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/domain/app_colors.dart';
import 'package:spotify_app/domain/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, AppRoutes.intro_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackTextColor,
      body: Center(
            child:  SvgPicture.asset("assets/logo/Logo.svg",
              width:  80, height: 80,
              color: AppColors.primaryColor,
            ),
        )
    );
  }
}
