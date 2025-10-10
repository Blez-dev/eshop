import 'package:eshop/presentation/components/appGlobalKey.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state_screen.dart';
import 'package:eshop/presentation/onboarding/forgot_password.dart';
import 'package:eshop/presentation/onboarding/navigator_screen.dart';
import 'package:eshop/presentation/onboarding/onboarding_screen.dart';
import 'package:eshop/presentation/onboarding/sign_in_screen.dart';
import 'package:eshop/presentation/onboarding/sign_up_screen.dart';
import 'package:eshop/presentation/splash/splash_screen.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
   // navigatorKey: AppGlobalKey.globalKey,
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
      GoRoute(
        path: RoutePaths.signUp,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: RoutePaths.forgotPassword,
        builder: (context, state) => ForgotPassword(),
      ),
      GoRoute(
        path: RoutePaths.authControllerScreen,
        builder: (context, state) => AuthControllerStateScreen(),
      ),
    ],

    initialLocation: "/splash",
  );
}
