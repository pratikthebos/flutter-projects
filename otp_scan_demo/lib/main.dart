import 'package:flutter/material.dart';

import 'screens/otp_scan_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const OTPScanApp(),
  );
}

class OTPScanApp extends StatelessWidget {
  const OTPScanApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTP Scan',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor:
        const Color(0xff050816),
      ),
      home: const OTPScanScreen(),
    );
  }
}