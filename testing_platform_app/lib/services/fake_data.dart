import 'package:flutter/material.dart';

import '../models/bug_model.dart';
import '../models/sprint_model.dart';
import '../utils/app_colors.dart';

class FakeData {
  FakeData._();

  static final SprintModel sprint = SprintModel(
    sprintName: "Sprint 14",
    progress: 82,
    totalTasks: 145,
    completedTasks: 119,
    pendingTasks: 26,
    bugsFound: 42,
    testCases: 684,
  );

  static final List<BugModel> bugs = [
    BugModel(
      id: "#BUG-1024",
      title: "Login Authentication Failed",
      description:
      "User cannot login after OTP verification on Android devices.",
      module: "Authentication",
      priority: "Critical",
      status: "Open",
      assignedTo: "Rahul Sharma",
      environment: "Android 15",
      aiScore: 98,
      icon: Icons.security,
      color: AppColors.danger,
    ),

    BugModel(
      id: "#BUG-1025",
      title: "API Response Timeout",
      description:
      "Dashboard API takes more than 10 seconds to respond.",
      module: "API",
      priority: "High",
      status: "In Progress",
      assignedTo: "Priya Singh",
      environment: "QA Server",
      aiScore: 92,
      icon: Icons.cloud_off,
      color: AppColors.warning,
    ),

    BugModel(
      id: "#BUG-1026",
      title: "UI Overflow in Dashboard",
      description:
      "RenderFlex overflow on small screen devices.",
      module: "Flutter UI",
      priority: "Medium",
      status: "Resolved",
      assignedTo: "John Doe",
      environment: "Android",
      aiScore: 84,
      icon: Icons.phone_android,
      color: AppColors.success,
    ),

    BugModel(
      id: "#BUG-1027",
      title: "Payment Screen Crash",
      description:
      "App crashes while opening payment gateway.",
      module: "Payment",
      priority: "Critical",
      status: "Open",
      assignedTo: "Ankit",
      environment: "Android & iOS",
      aiScore: 97,
      icon: Icons.payment,
      color: AppColors.danger,
    ),

    BugModel(
      id: "#BUG-1028",
      title: "Dark Theme Issue",
      description:
      "Text is invisible in dark mode on profile screen.",
      module: "UI",
      priority: "Low",
      status: "Fixed",
      assignedTo: "Sneha",
      environment: "Flutter",
      aiScore: 76,
      icon: Icons.dark_mode,
      color: AppColors.secondary,
    ),
  ];

  static const List<String> aiSuggestions = [
    "Session token expired after OTP verification.",
    "Network latency detected in API gateway.",
    "Missing authentication header in API request.",
    "Widget overflow on small screen devices.",
    "Retry API call after timeout.",
    "Improve error handling in login module.",
  ];
}