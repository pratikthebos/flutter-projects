import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'viewmodels/splash_viewmodel.dart';
import 'viewmodels/loader_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoaderViewModel(),
        ),
      ],
      child: const LoaderLabApp(),
    ),
  );
}