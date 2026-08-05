import 'dart:ui';
import 'package:flutter/material.dart';

class GlassAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;

  const GlassAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      child: BackdropFilter(

        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),

        child: AppBar(

          elevation: 0,

          backgroundColor:
          Colors.white.withOpacity(.08),

          title: Text(title),

          centerTitle: true,

        ),

      ),

    );

  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

}