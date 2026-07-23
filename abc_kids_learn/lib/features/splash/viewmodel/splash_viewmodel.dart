import 'dart:async';

import 'package:abc_kids_learn/features/alphabet/view/%20alphabet_screen.dart';
import 'package:flutter/material.dart';



class SplashViewModel extends ChangeNotifier {
  Future<void> start() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}