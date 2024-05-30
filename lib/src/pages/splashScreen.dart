import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maria/src/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
     Column(
      children: [
        Center(
          child: LottieBuilder.asset("assets/Animation - 1713573543536.json"),
        )
      ],
     ), nextScreen: const LoginPage(),
     splashIconSize: 384,
     backgroundColor: Color.fromARGB(125, 89, 156, 93),);
  }
}