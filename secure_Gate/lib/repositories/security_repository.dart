import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_icons.dart';
import '../models/dashboard_model.dart';
import '../models/history_model.dart';
import '../models/staff_model.dart';
import '../models/visitor_model.dart';
import '../services/dummy_data_service.dart';

class SecurityRepository {
  List<DashboardModel> getDashboardStats() {
    return DummyDataService.dashboardStats;
  }

  List<VisitorModel> getRecentVisitors() {
    return DummyDataService.recentVisitors;
  }

  List<StaffModel> getStaff() {
    return [
      StaffModel(
        name: "Amit Patil",
        role: "Security Guard",
        checkIn: "08:00 AM",
        checkOut: "08:00 PM",
        isInside: true,
        icon: AppIcons.staff,
      ),
      StaffModel(
        name: "Ramesh Kumar",
        role: "Housekeeping",
        checkIn: "09:00 AM",
        checkOut: "06:00 PM",
        isInside: true,
        icon: AppIcons.worker,
      ),
      StaffModel(
        name: "Suresh Yadav",
        role: "Electrician",
        checkIn: "10:30 AM",
        checkOut: "03:00 PM",
        isInside: false,
        icon: AppIcons.worker,
      ),
    ];
  }

  List<HistoryModel> getHistory() {
    return [
      HistoryModel(
        title: "Rahul Sharma",
        subtitle: "Flat A-302",
        time: "09:45 AM",
        status: "Approved",
        statusColor: AppColors.success,
        icon: AppIcons.visitor,
      ),
      HistoryModel(
        title: "Uber Cab",
        subtitle: "Pickup",
        time: "10:15 AM",
        status: "Completed",
        statusColor: AppColors.primary,
        icon: AppIcons.cab,
      ),
      HistoryModel(
        title: "Amazon Delivery",
        subtitle: "Parcel",
        time: "11:20 AM",
        status: "Delivered",
        statusColor: AppColors.warning,
        icon: AppIcons.delivery,
      ),
      HistoryModel(
        title: "Electrician",
        subtitle: "Maintenance",
        time: "12:05 PM",
        status: "Approved",
        statusColor: AppColors.success,
        icon: AppIcons.worker,
      ),
      HistoryModel(
        title: "Housekeeping",
        subtitle: "Staff Entry",
        time: "01:00 PM",
        status: "Inside",
        statusColor: AppColors.secondary,
        icon: AppIcons.staff,
      ),
    ];
  }
}