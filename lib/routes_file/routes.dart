import 'package:eshop/presentation/components/appGlobalKey.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state_screen.dart';
import 'package:eshop/presentation/onboarding/forgot_password.dart';
import 'package:eshop/presentation/onboarding/navigator_screen.dart';
import 'package:eshop/presentation/onboarding/onboarding_screen.dart';
import 'package:eshop/presentation/onboarding/sign_in_screen.dart';
import 'package:eshop/presentation/onboarding/sign_up_screen.dart';
import 'package:eshop/presentation/splash/splash_screen.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:eshop/vendor_directory/views/add_items_page.dart';
import 'package:eshop/vendor_directory/views/sub_views/brand_Page.dart';
import 'package:eshop/vendor_directory/views/sub_views/location_page.dart';
import 'package:eshop/vendor_directory/views/sub_views/model_page.dart';
import 'package:eshop/vendor_directory/views/vendor_items_page.dart';
import 'package:eshop/vendor_directory/views/upload_successful_page.dart';
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
      GoRoute(
        path: RoutePaths.addItemsPage,
        builder: (context, state) => AddItemsPage(),
      ),
      GoRoute(
        path: RoutePaths.uploadSuccessfulPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const UploadSuccessfulPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Fade transition
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1), // 👈 slow fade
          );
        },
      ),


      GoRoute(
        path: RoutePaths.vendorItemsPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const VendorItemsPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Fade transition
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1), // 👈 slow fade
          );
        },
      ),

      GoRoute(
        path: RoutePaths.brandPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  BrandPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Fade transition
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1), // 👈 slow fade
          );
        },
      ),

      GoRoute(
        path: RoutePaths.modelPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ModelPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Fade transition
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1), // 👈 slow fade
          );
        },
      ),
      GoRoute(
        path: RoutePaths.locationPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  LocationPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Fade transition
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1), // 👈 slow fade
          );
        },
      ),

    ],

    initialLocation: "/splash",
  );
}
