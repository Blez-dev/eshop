import 'package:eshop/buyer%22s_section/homepage.dart';
import 'package:eshop/buyer%22s_section/models/savedAdClass.dart';
import 'package:eshop/buyer%22s_section/views/phone_details_page.dart';
import 'package:eshop/buyer%22s_section/views/profile_page.dart';
import 'package:eshop/buyer%22s_section/views/saved_ad_details.dart';
import 'package:eshop/buyer%22s_section/views/sub_views/account_details_page.dart';
import 'package:eshop/buyer%22s_section/views/sub_views/compose_message_screen.dart';
import 'package:eshop/buyer%22s_section/views/sub_views/confirm_delete_account.dart';
import 'package:eshop/buyer%22s_section/views/sub_views/contact_us_options_page.dart';
import 'package:eshop/buyer%22s_section/views/sub_views/report_ad_page.dart';
import 'package:eshop/buyer%22s_section/views/sub_views/report_dispute_page.dart';
import 'package:eshop/buyer%22s_section/views/sub_views/report_option_page.dart';
import 'package:eshop/presentation/components/appGlobalKey.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state_screen.dart';
import 'package:eshop/presentation/onboarding/forgot_password.dart';
import 'package:eshop/presentation/onboarding/navigator_screen.dart';
import 'package:eshop/presentation/onboarding/onboarding_screen.dart';
import 'package:eshop/presentation/onboarding/sign_in_screen.dart';
import 'package:eshop/presentation/onboarding/sign_up_screen.dart';
import 'package:eshop/presentation/splash/splash_screen.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:eshop/vendor_directory/model/image_class.dart';
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
        path: RoutePaths.splash,
        builder: (context, state) => SplashScreen(),
      ),


      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),



      GoRoute(
        path: RoutePaths.signIn,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  SigninScreen(),
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
        path: RoutePaths.profilePage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ProfilePage(),
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
        path: RoutePaths.signUp,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  SignUpScreen(),
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
        path: RoutePaths.navigator,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  NavigatorScreen(),
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


      //
      // GoRoute(
      //   path: RoutePaths.homePage,
      //   builder: (context, state) => Homepage(),
      // ),



      GoRoute(
        path: RoutePaths.homePage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  Homepage(),
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
        path: RoutePaths.addItemsPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  AddItemsPage(),
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

      //
      GoRoute(
        path: RoutePaths.accountDetailsPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  AccountDetailsPage(),
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

  // GoRoute(
  // path: RoutePaths.accountDetailsPage,
  // builder: (context, state) => const AccountDetailsPage(),
  // ),



  GoRoute(
        path: RoutePaths.contactUsOptionPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ContactUsOptionsPage(),
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
        path: RoutePaths.composeMessagePage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ComposeMessageScreen(),
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
        path: RoutePaths.reportOptionsPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ReportOptionsPage(),
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
        path: RoutePaths.reportDisputePage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ReportDisputePage(),
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
        path: RoutePaths.reportVendorAd,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ReportAdPage(),
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
        path: RoutePaths.confirmDeleteAccount,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ConfirmDeleteAccount(),
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
        path: RoutePaths.authControllerScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  AuthControllerStateScreen(),
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
        path: RoutePaths.forgotPassword,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child:  ForgotPassword(),
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

      GoRoute(
        path: RoutePaths.phoneDetailsPage,
        pageBuilder: (context, state) {
          // ✅ Retrieve the passed data
          final useMe = state.extra as ImageClass;
          return CustomTransitionPage(
            key: state.pageKey,
            child: PhoneDetailsPage(imageData: useMe), // 👈 Pass it into the screen
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1),
          );
        },
      ),

      // GoRoute(
      //   path: RoutePaths.phoneDetailsPage,
      //   builder: (context, state) {
      //     final useMe = state.extra as ImageClass;
      //     return PhoneDetailsPage(imageData: useMe);
      //   },
      // ),


      GoRoute(
        path: RoutePaths.savedAdDetails,
        pageBuilder: (context, state) {
          // ✅ Retrieve the passed data
          final adData = state.extra as SavedAd;
          return CustomTransitionPage(
            key: state.pageKey,
            child:SavedAdDetails(adData: adData), // 👈 Pass it into the screen
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1),
          );
        },
      ),


    ],

    initialLocation: "/splash",
  );
}
