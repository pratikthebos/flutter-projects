import 'package:flutter/material.dart';
import 'part_button.dart';

class CarView extends StatelessWidget {
  final Function(String part) onPartSelected;
  final String selectedPart;

  const CarView({
    super.key,
    required this.onPartSelected,
    required this.selectedPart,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 520,
      child: Stack(
        alignment: Alignment.center,
        children: [

          //--------------------------------------------------
          // Blue Glow
          //--------------------------------------------------

          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.cyanAccent.withOpacity(.08),
            ),
          ),

          //--------------------------------------------------
          // Car Image
          //--------------------------------------------------

          Hero(
            tag: "car",
            child: Image.asset(
              "assets/images/car_side.png",
              width: 340,
              fit: BoxFit.contain,
            ),
          ),

          //--------------------------------------------------
          // ENGINE
          //--------------------------------------------------

          Positioned(
            top: 15,
            child: PartButton(
              title: "Engine",
              icon: Icons.settings,
              selected: selectedPart == "Engine",
              onTap: () => onPartSelected("Engine"),
            ),
          ),

          //--------------------------------------------------
          // TAIL LIGHT
          //--------------------------------------------------

          Positioned(
            top: 80,
            left: 5,
            child: PartButton(
              title: "Tail Light",
              icon: Icons.highlight,
              selected: selectedPart == "Tail Light",
              onTap: () => onPartSelected("Tail Light"),
            ),
          ),

          //--------------------------------------------------
          // HEADLIGHT
          //--------------------------------------------------

          Positioned(
            top: 80,
            right: 5,
            child: PartButton(
              title: "Headlight",
              icon: Icons.lightbulb,
              selected: selectedPart == "Headlight",
              onTap: () => onPartSelected("Headlight"),
            ),
          ),

          //--------------------------------------------------
          // LEFT DOOR
          //--------------------------------------------------

          Positioned(
            top: 185,
            left: 25,
            child: PartButton(
              title: "Left Door",
              icon: Icons.sensor_door,
              selected: selectedPart == "Left Door",
              onTap: () => onPartSelected("Left Door"),
            ),
          ),

          //--------------------------------------------------
          // RIGHT DOOR
          //--------------------------------------------------

          Positioned(
            top: 185,
            right: 25,
            child: PartButton(
              title: "Right Door",
              icon: Icons.sensor_door,
              selected: selectedPart == "Right Door",
              onTap: () => onPartSelected("Right Door"),
            ),
          ),

          //--------------------------------------------------
          // FRONT WHEEL
          //--------------------------------------------------

          Positioned(
            bottom: 105,
            left: 55,
            child: PartButton(
              title: "Front Wheel",
              icon: Icons.tire_repair,
              selected: selectedPart == "Front Wheel",
              onTap: () => onPartSelected("Front Wheel"),
            ),
          ),

          //--------------------------------------------------
          // REAR WHEEL
          //--------------------------------------------------

          Positioned(
            bottom: 105,
            right: 55,
            child: PartButton(
              title: "Rear Wheel",
              icon: Icons.tire_repair,
              selected: selectedPart == "Rear Wheel",
              onTap: () => onPartSelected("Rear Wheel"),
            ),
          ),

          //--------------------------------------------------
          // BATTERY
          //--------------------------------------------------

          Positioned(
            bottom: 10,
            child: PartButton(
              title: "Battery",
              icon: Icons.battery_charging_full,
              selected: selectedPart == "Battery",
              onTap: () => onPartSelected("Battery"),
            ),
          ),
        ],
      ),
    );
  }
}