import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class PeTestReportApp extends StatelessWidget {
  const PeTestReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PE Test Report',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}