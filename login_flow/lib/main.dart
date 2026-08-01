import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

import 'viewmodels/splash_viewmodel.dart';
import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/flow_viewmodel.dart';
import 'viewmodels/dashboard_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => FlowViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => DashboardViewModel(),
        ),

      ],
      child: const LoginFlowApp(),
    ),
  );
}