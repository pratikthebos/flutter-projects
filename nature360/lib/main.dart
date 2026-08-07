import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/splash_viewmodel.dart';
import 'viewmodels/viewer_viewmodel.dart';

void main() {
  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => ViewerViewModel(),
        ),

      ],

      child: const Nature360App(),

    ),

  );
}