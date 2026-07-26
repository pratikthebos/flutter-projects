import '../models/testcase_model.dart';

/// Master Test Case List
/// This file is the single source of truth for all PE test cases.
/// Add or remove test cases here only.

class PeTestcaseData {
  PeTestcaseData._();

  static List<TestcaseModel> getDefaultTestcases() {
    return [
      TestcaseModel(id: 1, title: "Register User"),
      TestcaseModel(id: 2, title: "Captcha Validation"),
      TestcaseModel(id: 3, title: "OTP Verification"),
      TestcaseModel(id: 4, title: "Password Validation"),
      TestcaseModel(id: 5, title: "User Login"),
      TestcaseModel(id: 6, title: "Forgot Password"),
      TestcaseModel(id: 7, title: "Change Password"),
      TestcaseModel(id: 8, title: "Create New Household"),
      TestcaseModel(id: 9, title: "Edit Household"),
      TestcaseModel(id: 10, title: "Delete Household"),
      TestcaseModel(id: 11, title: "View Household Details"),
      TestcaseModel(id: 12, title: "Sync Data"),
      TestcaseModel(id: 13, title: "Resync Edited Data"),
      TestcaseModel(id: 14, title: "Delete Synced Data"),
      TestcaseModel(id: 15, title: "Offline Data Entry"),
      TestcaseModel(id: 16, title: "Online Data Entry"),
      TestcaseModel(id: 17, title: "Dashboard Loading"),
      TestcaseModel(id: 18, title: "Search Household"),
      TestcaseModel(id: 19, title: "Filter Records"),
      TestcaseModel(id: 20, title: "Location Permission"),
      TestcaseModel(id: 21, title: "GPS Capture"),
      TestcaseModel(id: 22, title: "Camera Permission"),
      TestcaseModel(id: 23, title: "Image Capture"),
      TestcaseModel(id: 24, title: "Image Upload"),
      TestcaseModel(id: 25, title: "Building Number Validation"),
      TestcaseModel(id: 26, title: "House Number Validation"),
      TestcaseModel(id: 27, title: "Family Member Entry"),
      TestcaseModel(id: 28, title: "Enumerator Profile"),
      TestcaseModel(id: 29, title: "Supervisor Validation"),
      TestcaseModel(id: 30, title: "Report Summary"),
      TestcaseModel(id: 31, title: "Export Report"),
      TestcaseModel(id: 32, title: "Logout"),
    ];
  }

  static int get totalTestcases => getDefaultTestcases().length;
}