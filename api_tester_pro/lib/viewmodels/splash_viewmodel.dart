import 'dart:async';

import 'package:flutter/material.dart';

import '../app/routes.dart';

class SplashViewModel extends ChangeNotifier {
  void initialize(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.dashboard,
      );
    });
  }
}