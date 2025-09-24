import 'package:eshop/core/themes.dart';
import 'package:eshop/presentation/splash/splash_screen.dart';
import 'package:eshop/routes_file/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
