import 'dart:async';

import 'package:flutter/material.dart';

import '../app/routes.dart';

class SplashViewModel extends ChangeNotifier {

  void start(BuildContext context){

    Timer(

      const Duration(seconds: 3),

          (){

        Navigator.pushReplacementNamed(

          context,

          AppRoutes.home,

        );

      },

    );

  }

}