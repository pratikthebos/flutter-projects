import 'package:api_tester_pro/views/dashboard/%20dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/api_viewmodel.dart';
import '../viewmodels/response_viewmodel.dart';
import '../viewmodels/splash_viewmodel.dart';


import '../views/response/response_screen.dart';
import '../views/splash/splash_screen.dart';

import 'app_theme.dart';

class ApiTesterApp extends StatelessWidget {
  const ApiTesterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ApiViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ResponseViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'API Tester Pro',
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/dashboard': (_) => const DashboardScreen(),
          '/response': (_) => const ResponseScreen(),
        },
      ),
    );
  }
}