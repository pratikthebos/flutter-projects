import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/report_model.dart';

class StorageService {
StorageService._();

static const String reportsKey = "pe_reports";

/// Save complete report list
static Future<void> saveReports(
List<ReportModel> reports) async {
final prefs = await SharedPreferences.getInstance();

final jsonList = reports
.map((report) => report.toMap())
.toList();

await prefs.setString(
reportsKey,
jsonEncode(jsonList),
);
}

/// Load all reports
static Future<List<ReportModel>> getReports() async {
final prefs = await SharedPreferences.getInstance();

final jsonString = prefs.getString(reportsKey);

if (jsonString == null || jsonString.isEmpty) {
return [];
}

final List<dynamic> decoded =
jsonDecode(jsonString);

return decoded
.map(
(e) => ReportModel.fromMap(
Map<String, dynamic>.from(e),
),
)
.toList();
}

/// Add a new report
static Future<void> addReport(
ReportModel report) async {
final reports = await getReports();

reports.add(report);

await saveReports(reports);
}
/// Update an existing report
static Future<void> updateReport(
ReportModel updatedReport,
) async {
final reports = await getReports();

final index = reports.indexWhere(
(report) => report.id == updatedReport.id,
);

if (index != -1) {
reports[index] = updatedReport;
await saveReports(reports);
}
}

/// Delete a report
static Future<void> deleteReport(
String reportId,
) async {
final reports = await getReports();

reports.removeWhere(
(report) => report.id == reportId,
);

await saveReports(reports);
}

/// Delete multiple reports
static Future<void> deleteReports(
List<String> reportIds,
) async {
final reports = await getReports();

reports.removeWhere(
(report) => reportIds.contains(report.id),
);

await saveReports(reports);
}
/// Clear all saved reports
static Future<void> clearReports() async {
final prefs = await SharedPreferences.getInstance();

await prefs.remove(reportsKey);
}

/// Check whether any reports are stored
static Future<bool> hasReports() async {
final reports = await getReports();
return reports.isNotEmpty;
}

/// Get total number of reports
static Future<int> getReportCount() async {
final reports = await getReports();
return reports.length;
}

/// Get the latest report
static Future<ReportModel?> getLatestReport() async {
final reports = await getReports();

if (reports.isEmpty) {
return null;
}

return reports.last;
}

/// Replace all reports with a new list
static Future<void> replaceReports(
List<ReportModel> reports,
) async {
await saveReports(reports);
}
/// Find a report by ID
static Future<ReportModel?> getReportById(
dynamic reportId,
) async {
final reports = await getReports();

try {
return reports.firstWhere(
(report) => report.id == reportId,
);
} catch (_) {
return null;
}
}

/// Search reports by tester name
static Future<List<ReportModel>> searchReports(
String keyword,
) async {
final reports = await getReports();

if (keyword.trim().isEmpty) {
return reports;
}

final query = keyword.toLowerCase();

return reports.where((report) {
return report.testerName
.toLowerCase()
.contains(query);
}).toList();
}

/// Get reports for a specific platform
static Future<List<ReportModel>> getReportsByPlatform(
String platform,
) async {
final reports = await getReports();

return reports.where((report) {
return report.platform == platform;
}).toList();
}

/// Get reports that contain failed test cases
static Future<List<ReportModel>> getFailedReports() async {
final reports = await getReports();

return reports.where((report) {
return report.failedCount > 0;
}).toList();
}
/// Get reports created by a tester
static Future<List<ReportModel>> getReportsByTester(
    String testerName,
    ) async {
  final reports = await getReports();

  return reports.where((report) {
    return report.testerName
        .toLowerCase()
        .trim() ==
        testerName.toLowerCase().trim();
  }).toList();
}

/// Get reports created on a specific date
static Future<List<ReportModel>> getReportsByDate(
    DateTime date,
    ) async {
  final reports = await getReports();

  return reports.where((report) {
    final d = report.testingDate;

    return d.year == date.year &&
        d.month == date.month &&
        d.day == date.day;
  }).toList();
}

/// Delete every stored report
static Future<void> deleteAllReports() async {
  await clearReports();
}
}