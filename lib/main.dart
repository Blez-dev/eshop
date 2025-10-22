import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/core/themes.dart';
import 'package:eshop/firebase_options.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state.dart';
import 'package:eshop/presentation/splash/splash_screen.dart';
import 'package:eshop/routes_file/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',

      themeMode: ThemeMode.light,
      theme: BAppThemeData.lightTheme,
      routerConfig: AppRoutes.routes,
    );
  }
}
