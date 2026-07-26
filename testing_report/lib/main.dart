import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PETestReportApp());
}

class PETestReportApp extends StatelessWidget {
  const PETestReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PE Test Report',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const DashboardScreen(),
    );
  }
}