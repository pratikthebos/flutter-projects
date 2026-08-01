import 'package:flutter/material.dart';

class ApiStep {
  final String title;
  final String subtitle;
  final IconData icon;

  const ApiStep({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class ApiSteps {
  static const List<ApiStep> steps = [

    ApiStep(
      title: "Login",
      subtitle: "Enter Credentials",
      icon: Icons.login_rounded,
    ),

    ApiStep(
      title: "Validation",
      subtitle: "Validate Input",
      icon: Icons.verified_user_rounded,
    ),

    ApiStep(
      title: "HTTP",
      subtitle: "Create Request",
      icon: Icons.http_rounded,
    ),

    ApiStep(
      title: "Internet",
      subtitle: "Send Request",
      icon: Icons.public_rounded,
    ),

    ApiStep(
      title: "Backend",
      subtitle: "Receive Request",
      icon: Icons.dns_rounded,
    ),

    ApiStep(
      title: "Database",
      subtitle: "Verify User",
      icon: Icons.storage_rounded,
    ),

    ApiStep(
      title: "Password",
      subtitle: "Hash Compare",
      icon: Icons.password_rounded,
    ),

    ApiStep(
      title: "JWT",
      subtitle: "Generate Token",
      icon: Icons.vpn_key_rounded,
    ),

    ApiStep(
      title: "HTTP 200",
      subtitle: "Success",
      icon: Icons.done_all_rounded,
    ),

    ApiStep(
      title: "JSON",
      subtitle: "Parse Response",
      icon: Icons.data_object_rounded,
    ),

    ApiStep(
      title: "Storage",
      subtitle: "Save Token",
      icon: Icons.save_rounded,
    ),

    ApiStep(
      title: "Dashboard",
      subtitle: "Load Screen",
      icon: Icons.dashboard_rounded,
    ),

  ];
}