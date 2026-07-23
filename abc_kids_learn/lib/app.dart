import 'package:abc_kids_learn/features/splash/view/%20splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abc_kids_learn/core/theme/%20app_theme.dart';

import 'features/alphabet/viewmodel/alphabet_viewmodel.dart';


class AbcKidsApp extends StatelessWidget {
  const AbcKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AlphabetViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ABC Kids Learn',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}