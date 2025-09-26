import 'package:eshop/presentation/onboarding/navigator_screen.dart';
import 'package:eshop/presentation/onboarding/onboarding_screen.dart';
import 'package:eshop/presentation/onboarding/sign_in_screen.dart';
import 'package:eshop/presentation/splash/splash_screen.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: RoutePaths.signIn,
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: RoutePaths.navigator,
        builder: (context, state) => NavigatorScreen(),
      ),
    ],

    initialLocation: "/splash",
  );
}
