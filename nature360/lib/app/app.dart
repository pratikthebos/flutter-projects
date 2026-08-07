import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class Nature360App extends StatelessWidget {

  const Nature360App({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Nature360",

      theme: AppTheme.light,

      initialRoute: Routes.splash,

      routes: Routes.routes,

    );

  }

}