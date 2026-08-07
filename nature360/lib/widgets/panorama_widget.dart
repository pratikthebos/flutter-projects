import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart' as pano;

class PanoramaWidget extends StatelessWidget {
  final String image;

  const PanoramaWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return pano.PanoramaViewer(
      sensorControl: pano.SensorControl.none,

      // Disable auto rotation
      animSpeed: 0,

      // Initial view
      longitude: 0,
      latitude: 0,

      // Allow free movement
      minLatitude: -90,
      maxLatitude: 90,

      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}