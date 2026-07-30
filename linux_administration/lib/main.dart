import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

import 'viewmodels/splash_viewmodel.dart';
import 'viewmodels/dashboard_viewmodel.dart';
import 'viewmodels/terminal_viewmodel.dart';
import 'viewmodels/result_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => DashboardViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => TerminalViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => ResultViewModel(),
        ),

      ],

      child: const SysOpsApp(),
    ),
  );
}