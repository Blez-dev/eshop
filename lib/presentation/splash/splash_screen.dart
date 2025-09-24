import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eshop/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(child: LottieBuilder.asset("assets/splash/ecommerce.json"),),
        nextScreen: OnboardingScreen(),
        backgroundColor: Colors.black,
      splashIconSize: 160,
      //splashTransition: SplashTransition.fadeTransition,
    );
  }
}
