import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart' as pano;

class RoomPanorama extends StatelessWidget {
  const RoomPanorama({super.key});

  @override
  Widget build(BuildContext context) {

    const path = "assets/images/rooms/white_chapel.jpg";

    debugPrint("Loading: $path");

    return pano.PanoramaViewer(
      animSpeed: 0,
      sensorControl: pano.SensorControl.none,
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    );
  }
}