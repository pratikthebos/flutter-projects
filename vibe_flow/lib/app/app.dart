import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class VibeFlowApp extends StatelessWidget {
  const VibeFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VibeFlow',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.darkTheme,

      initialRoute: AppRoutes.home,

      routes: AppRoutes.routes,

      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}