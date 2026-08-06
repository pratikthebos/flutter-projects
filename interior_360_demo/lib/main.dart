import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/gallery_viewmodel.dart';
import 'viewmodels/designer_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => GalleryViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => DesignerViewModel(),
        ),

      ],

      child: const Interior360App(),

    ),

  );
}