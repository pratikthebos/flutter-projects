import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {

  Future<void> initialize() async {

    await Future.delayed(

      const Duration(seconds: 3),

    );

  }

}