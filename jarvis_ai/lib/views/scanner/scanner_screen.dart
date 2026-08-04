import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/scanner_viewmodel.dart';

import '../../widgets/suit_view.dart';
import '../../widgets/module_button.dart';
import '../../widgets/scan_result_card.dart';
import '../../widgets/diagnostics_card.dart';
import '../../widgets/jarvis_hud_painter.dart';
import '../../core/widgets/scan_line.dart';

class ScannerScreen extends StatelessWidget {
const ScannerScreen({super.key});

@override
Widget build(BuildContext context) {
final vm = context.watch<ScannerViewModel>();

return Scaffold(
backgroundColor: Colors.black,

body: SafeArea(
child: Column(
children: [

//---------------------------------------
// HEADER
//---------------------------------------

Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 18,
),
child: Row(
children: [

IconButton(
onPressed: () {
Navigator.pop(context);
},
icon: const Icon(
Icons.arrow_back_ios,
color: Colors.white,
),
),

const SizedBox(width: 10),

const Expanded(
child: Text(
"JARVIS AI Scanner",
style: TextStyle(
color: Colors.white,
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
),

Container(
padding: const EdgeInsets.symmetric(
horizontal: 14,
vertical: 8,
),
decoration: BoxDecoration(
color: Colors.green.withOpacity(.15),
borderRadius: BorderRadius.circular(25),
),
child: const Row(
children: [

Icon(
Icons.circle,
size: 10,
color: Colors.greenAccent,
),

SizedBox(width: 8),

Text(
"ONLINE",
style: TextStyle(
color: Colors.greenAccent,
fontWeight: FontWeight.bold,
),
),

],
),
),

],
),
),

Expanded(
child: SingleChildScrollView(
padding: const EdgeInsets.symmetric(
horizontal: 20,
),
child: Column(
children: [                     //---------------------------------------
// SUIT SCANNER AREA
//---------------------------------------

SizedBox(
height: 560,
child: Stack(
alignment: Alignment.center,
children: [

  CustomPaint(
    size: const Size(360, 520),
    painter: JarvisHudPainter(),
  ),

  SuitView(
    selectedModule: vm.selectedModule,
    scanning: vm.scanning,
  ),

ScanLine(
scanning: vm.scanning,
),

//---------------------------------
// Helmet
//---------------------------------

Positioned(
top: 0,
child: ModuleButton(
title: "Helmet",
selected:
vm.selectedModule == "Helmet",
onTap: () {
vm.selectModule("Helmet");
},
),
),

//---------------------------------
// Left Shoulder
//---------------------------------

Positioned(
left: 0,
top: 70,
child: ModuleButton(
title: "Left\nShoulder",
selected:
vm.selectedModule ==
"Left Shoulder",
onTap: () {
vm.selectModule(
"Left Shoulder");
},
),
),

//---------------------------------
// Right Shoulder
//---------------------------------

Positioned(
right: 0,
top: 70,
child: ModuleButton(
title: "Right\nShoulder",
selected:
vm.selectedModule ==
"Right Shoulder",
onTap: () {
vm.selectModule(
"Right Shoulder");
},
),
),

//---------------------------------
// Left Arm
//---------------------------------

Positioned(
left: 0,
top: 170,
child: ModuleButton(
title: "Repulsor",
selected:
vm.selectedModule ==
"Repulsor",
onTap: () {
vm.selectModule(
"Repulsor");
},
),
),

//---------------------------------
// AI Core
//---------------------------------

Positioned(
right: 0,
top: 170,
child: ModuleButton(
title: "AI Core",
selected:
vm.selectedModule ==
"AI Core",
onTap: () {
vm.selectModule(
"AI Core");
},
),
),

//---------------------------------
// Arc Reactor
//---------------------------------

Positioned(
bottom: 115,
child: ModuleButton(
title: "Arc Reactor",
selected:
vm.selectedModule ==
"Arc Reactor",
onTap: () {
vm.selectModule(
"Arc Reactor");
},
),
),

//---------------------------------
// Left Leg
//---------------------------------

Positioned(
bottom: 35,
left: 10,
child: ModuleButton(
title: "Left Leg",
selected:
vm.selectedModule ==
"Left Leg",
onTap: () {
vm.selectModule(
"Left Leg");
},
),
),

//---------------------------------
// Right Leg
//---------------------------------

Positioned(
bottom: 35,
right: 10,
child: ModuleButton(
title: "Right Leg",
selected:
vm.selectedModule ==
"Right Leg",
onTap: () {
vm.selectModule(
"Right Leg");
},
),
),

//---------------------------------
// Flight
//---------------------------------

Positioned(
bottom: 0,
child: ModuleButton(
title: "Flight",
selected:
vm.selectedModule ==
"Flight",
onTap: () {
vm.selectModule(
"Flight");
},
),
),

],
),
),

const SizedBox(height: 30),
  //---------------------------------------
  // AI Scan Result
  //---------------------------------------

  const Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "AI Scan Result",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  const SizedBox(height: 15),

  ScanResultCard(
    module: vm.selectedModule,
    progress: vm.progress,
  ),

  const SizedBox(height: 30),

  //---------------------------------------
  // Diagnostics
  //---------------------------------------

  const Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Diagnostics",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  const SizedBox(height: 15),

  DiagnosticsCard(
    module: vm.selectedModule,
  ),

  const SizedBox(height: 30),

  //---------------------------------------
  // SYSTEM STATUS
  //---------------------------------------

  Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF101010),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(
        color: Colors.cyanAccent.withOpacity(.35),
      ),
    ),
    child: Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        const Text(
          "SYSTEM STATUS",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 20),

        _statusRow(
          Icons.shield,
          "Armor Integrity",
          "98%",
          Colors.greenAccent,
        ),

        const SizedBox(height: 12),

        _statusRow(
          Icons.bolt,
          "Power Output",
          "Stable",
          Colors.orangeAccent,
        ),

        const SizedBox(height: 12),

        _statusRow(
          Icons.flight,
          "Flight System",
          "Ready",
          Colors.cyanAccent,
        ),

        const SizedBox(height: 12),

        _statusRow(
          Icons.memory,
          "AI Core",
          "ONLINE",
          Colors.greenAccent,
        ),

        const SizedBox(height: 12),

        _statusRow(
          Icons.security,
          "Threat Detection",
          "ACTIVE",
          Colors.redAccent,
        ),

      ],
    ),
  ),

  const SizedBox(height: 40),

],
),
),
),

],
),
),
);
}

Widget _statusRow(
    IconData icon,
    String title,
    String value,
    Color color,
    ) {
  return Row(
    children: [

      Icon(
        icon,
        color: color,
      ),

      const SizedBox(width: 12),

      Expanded(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),

      Text(
        value,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),

    ],
  );
}
}