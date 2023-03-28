import 'dart:async';

import 'package:banhawy/core/app_storage/app_storage.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:banhawy/features/intro/on_boarding_screen/on_boarding_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
          GetPlatform.isAndroid ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
          GetPlatform.isAndroid ? Brightness.dark : Brightness.light,
    ));
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    Timer(const Duration(seconds: 3), () {
      if (AppStorage.isLogged) {
        MagicRouter.navigateAndPopAll(BottomNavigationBarPage());
      } else {
        MagicRouter.navigateAndPopAll(OnBoardingScreenViews());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        'assets/images/logo12.png',
        fit: BoxFit.fitWidth,
        height: MediaQuery.of(context).size.height * 0.1,
      )),
    );
  }
}
