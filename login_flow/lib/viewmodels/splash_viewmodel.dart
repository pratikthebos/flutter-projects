import 'dart:async';

import 'package:flutter/material.dart';

import '../views/login/login_screen.dart';

class SplashViewModel extends ChangeNotifier {
  void start(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
    );
  }
}