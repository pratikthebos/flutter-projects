import '../models/report_model.dart';
import '../services/database_service.dart';

class ReportRepository {
  ReportRepository._();

  static final ReportRepository instance = ReportRepository._();

  final DatabaseService _databaseService = DatabaseService.instance;

  /// Save New Report
  Future<void> saveReport(ReportModel report) async {
    await _databaseService.insertReport(report);
  }

  /// Update Existing Report
  Future<void> updateReport(ReportModel report) async {
    await _databaseService.updateReport(report);
  }

  /// Delete Report
  Future<void> deleteReport(String id) async {
    await _databaseService.deleteReport(id);
  }

  /// Get All Reports
  Future<List<ReportModel>> getReports() async {
    return await _databaseService.getReports();
  }

  /// Get Single Report
  Future<ReportModel?> getReport(String id) async {
    return await _databaseService.getReport(id);
  }

  /// Dashboard Total Reports
  Future<int> totalReports() async {
    return await _databaseService.totalReports();
  }

  /// Dashboard Today's Reports
  Future<int> todayReports() async {
    final reports = await getReports();

    final now = DateTime.now();

    return reports.where((report) {
      final date = report.testingDate;

      return date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
    }).length;
  }

  /// Dashboard Total Passed
  Future<int> totalPassed() async {
    final reports = await getReports();

    int total = 0;

    for (final report in reports) {
      total += report.passedCount;
    }

    return total;
  }

  /// Dashboard Total Failed
  Future<int> totalFailed() async {
    final reports = await getReports();

    int total = 0;

    for (final report in reports) {
      total += report.failedCount;
    }

    return total;
  }

  /// Dashboard Total Not Tested
  Future<int> totalNotTested() async {
    final reports = await getReports();

    int total = 0;

    for (final report in reports) {
      total += report.notTestedCount;
    }

    return total;
  }

  /// Dashboard Total Bugs
  Future<int> totalBugs() async {
    final reports = await getReports();

    int total = 0;

    for (final report in reports) {
      total += report.totalBugs;
    }

    return total;
  }

  /// Latest Report
  Future<ReportModel?> latestReport() async {
    final reports = await getReports();

    if (reports.isEmpty) {
      return null;
    }

    return reports.first;
  }

  /// Clear Database
  Future<void> clearDatabase() async {
    await _databaseService.clearDatabase();
  }
}