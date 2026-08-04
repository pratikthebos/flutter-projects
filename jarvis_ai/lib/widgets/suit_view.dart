import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';

class SuitView extends StatelessWidget {
  final String selectedModule;
  final bool scanning;

  const SuitView({
    super.key,
    required this.selectedModule,
    required this.scanning,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      height: 500,

      child: Center(
        child: Hero(
          tag: "ironman",
          child: scanning
              ? Image.asset(
            "assets/images/ironman.jpg",
            height: 430,
            fit: BoxFit.contain,
          )
              : Image.asset(
            AppAssets.ironman,
            height: 430,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}