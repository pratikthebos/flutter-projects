import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class Interior360App extends StatelessWidget {

  const Interior360App({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Interior360",

      theme: AppTheme.darkTheme,

      initialRoute: Routes.splash,

      routes: Routes.routes,

    );

  }

}