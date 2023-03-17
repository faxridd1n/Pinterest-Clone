
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AppInit{
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 1)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.0
      ..radius = 14.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.blue
      ..errorWidget
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.transparent
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}