import 'package:flutter/cupertino.dart';
import 'package:spotify_app/ul/intro/choose_podcast_page.dart';
import '../ul/create_account/create_account_page.dart';
import '../ul/deshbord/deshbord_screen.dart';
import '../ul/intro/choose_artist_page.dart';
import '../ul/intro/intro_page.dart';
import '../ul/splash/splash_page.dart';
import 'app_routes.dart';

class AppRoutes{
  static const String splash_page = '/splash';
  static const String intro_page = '/intro';
  static const String create_account_page = '/create_account';
  static const String choose_artist_page = '/choose_artist';
  static const String choose_podcast_page = '/choose_podcast';
  static const String dashboard_page = '/dashboard';




  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splash_page : (context) => const SplashPage(),
    intro_page : (context) => const IntroPage(),
    create_account_page : (context) => CreateAccountPage(),
    choose_artist_page : (context) => ChooseArtistPage(),
    choose_podcast_page : (context) => ChoosePodcastPage(),
    dashboard_page : (context) => DeshbordPage(),
  };
}