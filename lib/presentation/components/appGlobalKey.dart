import 'package:flutter/material.dart';

class AppGlobalKey {
  static final GlobalKey<NavigatorState> globalKey= GlobalKey<NavigatorState>();

  static BuildContext  get context => globalKey.currentContext!;
}