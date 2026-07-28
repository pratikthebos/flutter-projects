import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_icons.dart';
import '../models/dashboard_model.dart';
import '../models/visitor_model.dart';

class DummyDataService {
  DummyDataService._();

  static List<DashboardModel> dashboardStats = [

    DashboardModel(
      title: "Visitors",
      value: "24",
      icon: AppIcons.visitor,
      color: AppColors.primary,
    ),

    DashboardModel(
      title: "Staff",
      value: "18",
      icon: AppIcons.staff,
      color: AppColors.success,
    ),

    DashboardModel(
      title: "Cab",
      value: "12",
      icon: AppIcons.cab,
      color: AppColors.warning,
    ),

    DashboardModel(
      title: "Delivery",
      value: "31",
      icon: AppIcons.delivery,
      color: AppColors.secondary,
    ),
  ];

  static List<VisitorModel> recentVisitors = [

    VisitorModel(
      name: "Rahul Sharma",
      mobile: "9876543210",
      flat: "A-302",
      purpose: "Family Visit",
      time: "09:45 AM",
      status: "Approved",
      statusColor: AppColors.success,
      icon: AppIcons.visitor,
    ),

    VisitorModel(
      name: "Swiggy Delivery",
      mobile: "9123456789",
      flat: "B-204",
      purpose: "Food Delivery",
      time: "10:12 AM",
      status: "Completed",
      statusColor: AppColors.primary,
      icon: AppIcons.delivery,
    ),

    VisitorModel(
      name: "Uber Cab",
      mobile: "9988776655",
      flat: "C-110",
      purpose: "Cab Pickup",
      time: "11:30 AM",
      status: "Waiting",
      statusColor: AppColors.warning,
      icon: AppIcons.cab,
    ),

    VisitorModel(
      name: "Electrician",
      mobile: "9765432101",
      flat: "D-501",
      purpose: "Maintenance",
      time: "12:20 PM",
      status: "Approved",
      statusColor: AppColors.success,
      icon: AppIcons.worker,
    ),

    VisitorModel(
      name: "Amazon",
      mobile: "9001122334",
      flat: "A-402",
      purpose: "Parcel Delivery",
      time: "01:40 PM",
      status: "Completed",
      statusColor: AppColors.primary,
      icon: AppIcons.delivery,
    ),
  ];
}