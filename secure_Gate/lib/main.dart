import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

import 'viewmodels/dashboard_viewmodel.dart';
import 'viewmodels/history_viewmodel.dart';
import 'viewmodels/splash_viewmodel.dart';
import 'viewmodels/visitor_viewmodel.dart';

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
          create: (_) => VisitorViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => HistoryViewModel(),
        ),

      ],

      child: const SecureGateApp(),
    ),
  );
}