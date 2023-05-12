import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:electronix_power/Color/color.dart';
import 'package:electronix_power/landing_page/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Container(
              height: 190,
              width: 190,
              margin: EdgeInsets.only(top: 250),
              child: Image(
                image: AssetImage("assets/logo.png"),
              ),
            ),
          ],
        ),
        splashIconSize: 700,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: background,
        nextScreen: landing_page());
  }
}
