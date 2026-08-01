import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/dashboard_card_model.dart';

class DashboardViewModel extends ChangeNotifier {

  final List<DashboardCardModel> cards = [

    const DashboardCardModel(
      title: "HTTP",
      value: "200 OK",
      icon: Icons.http,
      color: AppColors.success,
    ),

    const DashboardCardModel(
      title: "API",
      value: "Connected",
      icon: Icons.cloud_done_rounded,
      color: Colors.blue,
    ),

    const DashboardCardModel(
      title: "Backend",
      value: "Running",
      icon: Icons.dns_rounded,
      color: Colors.deepPurple,
    ),

    const DashboardCardModel(
      title: "Database",
      value: "Verified",
      icon: Icons.storage_rounded,
      color: Colors.teal,
    ),

    const DashboardCardModel(
      title: "JWT",
      value: "Generated",
      icon: Icons.vpn_key_rounded,
      color: Colors.orange,
    ),

    const DashboardCardModel(
      title: "JSON",
      value: "Parsed",
      icon: Icons.data_object_rounded,
      color: Colors.indigo,
    ),

    const DashboardCardModel(
      title: "Storage",
      value: "Saved",
      icon: Icons.save_rounded,
      color: Colors.pink,
    ),

    const DashboardCardModel(
      title: "Dashboard",
      value: "Loaded",
      icon: Icons.dashboard_rounded,
      color: Colors.green,
    ),

  ];

}