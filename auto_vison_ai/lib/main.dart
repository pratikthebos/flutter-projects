import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

import 'viewmodels/splash_viewmodel.dart';
import 'viewmodels/garage_viewmodel.dart';
import 'viewmodels/scanner_viewmodel.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => GarageViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => ScannerViewModel(),
        ),

      ],

      child: const AutoVisionApp(),

    ),

  );

}