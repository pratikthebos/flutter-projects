import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class CardVerseApp extends StatelessWidget {
  const CardVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CardVerse',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.dashboard,
      routes: AppRoutes.routes,
    );
  }
}