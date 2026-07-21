import 'dart:async';

import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> initialize(VoidCallback onFinish) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    onFinish();
  }
}