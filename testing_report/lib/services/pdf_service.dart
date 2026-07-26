import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models/bug_model.dart';
import '../models/report_model.dart';
import '../models/testcase_model.dart';

class PdfService {
  static Future<File?> generateReport(
      ReportModel report,
      ) async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(24),
          build: (context) => [
            pw.Center(
              child: pw.Text(
                "PE Test Report",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),

            pw.SizedBox(height: 20),

            pw.Text(
              "Tester : ${report.testerName}",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.Text("Platform : ${report.platform}"),
            pw.Text("Device : ${report.deviceName}"),
            pw.Text("OS Version : ${report.osVersion}"),
            pw.Text("App Version : ${report.appVersion}"),
            pw.Text("Build Number : ${report.buildNumber}"),

            pw.Text(
              "Testing Date : "
                  "${report.testingDate.day}/"
                  "${report.testingDate.month}/"
                  "${report.testingDate.year}",
            ),

            pw.SizedBox(height: 20),

            pw.Text(
              "Summary",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.Divider(),

            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Passed : ${report.passedCount}"),
                pw.Text("Failed : ${report.failedCount}"),
                pw.Text("Pending : ${report.notTestedCount}"),
                pw.Text("Bugs : ${report.totalBugs}"),
              ],
            ),

            pw.SizedBox(height: 25),

            pw.Text(
              "Test Cases",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.Divider(),

            ...report.testcases.map(
                  (TestcaseModel testcase) {
                return pw.Container(
                  margin: const pw.EdgeInsets.only(bottom: 12),
                  padding: const pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.grey400,
                    ),
                    borderRadius: pw.BorderRadius.circular(4),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        testcase.title,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),

                      pw.SizedBox(height: 4),

                      pw.Text(
                        "Status : ${testcase.status}",
                      ),

                      if (testcase.bug != null)
                        _buildBugSection(testcase.bug!),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );

      final directory = await getApplicationDocumentsDirectory();

      final file = File(
        "${directory.path}/PE_Test_Report_${report.id}.pdf",
      );

      await file.writeAsBytes(
        await pdf.save(),
      );

      return file;
    } catch (e) {
      return null;
    }
  }

  static pw.Widget _buildBugSection(
      BugModel bug,
      ) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 8),
      padding: const pw.EdgeInsets.all(8),
      decoration: pw.BoxDecoration(
        color: PdfColors.red50,
        border: pw.Border.all(
          color: PdfColors.red300,
        ),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "Bug Title: ${bug.title}",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),

          pw.SizedBox(height: 4),

          pw.Text(
            "Description: ${bug.description}",
          ),

          pw.SizedBox(height: 4),

          pw.Text(
            "Severity: ${bug.severity}",
          ),

          pw.Text(
            "Priority: ${bug.priority}",
          ),
        ],
      ),
    );
  }

  /// Returns the generated PDF file.
  /// Sharing has been removed.
  static Future<File?> shareReport(File file) async {
    return file;
  }
}