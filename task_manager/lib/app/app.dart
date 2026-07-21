import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/home_view_model.dart';
import '../viewmodels/splash_view_model.dart';
import '../viewmodels/task_details_view_model.dart';
import 'app_theme.dart';
import 'routes.dart';

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => TaskDetailsViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TaskFlow',
        theme: AppTheme.lightTheme,
        initialRoute: Routes.splash,
        routes: Routes.routes,
      ),
    );
  }
}