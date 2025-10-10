import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:eshop/routes_file/route_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer to navigate after splash animation duration
    Timer(const Duration(milliseconds: 3500), () {
      context.go(RoutePaths.authControllerScreen); // GoRouter navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset("assets/splash/ecommerce.json"),
      ),
      nextScreen: const SizedBox.shrink(), // No actual navigation here
      backgroundColor: Colors.white,
      splashIconSize: 160,
      duration: 3500, // Match timer
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(milliseconds: 1500),
    );
  }
}
