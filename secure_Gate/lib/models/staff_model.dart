import 'package:flutter/material.dart';

class StaffModel {
  final String name;
  final String role;
  final String checkIn;
  final String checkOut;
  final bool isInside;
  final IconData icon;

  StaffModel({
    required this.name,
    required this.role,
    required this.checkIn,
    required this.checkOut,
    required this.isInside,
    required this.icon,
  });
}