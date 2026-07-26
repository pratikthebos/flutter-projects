import 'package:flutter/material.dart';

import '../models/report_model.dart';
import '../services/pdf_service.dart';
import 'report_details_screen.dart';

class ReportSummaryScreen extends StatelessWidget {
final ReportModel report;

const ReportSummaryScreen({
super.key,
required this.report,
});

Widget buildInfoTile(
String title,
String value,
IconData icon,
) {
return Card(
elevation: 2,
margin: const EdgeInsets.only(bottom: 10),
child: ListTile(
leading: Icon(icon),
title: Text(title),
subtitle: Text(value),
),
);
}

Widget buildSummaryCard(
String title,
String value,
Color color,
IconData icon,
) {
return Expanded(
child: Card(
color: color.withOpacity(.08),
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
children: [
Icon(
icon,
color: color,
size: 32,
),
const SizedBox(height: 10),
Text(
value,
style: const TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 5),
Text(title),
],
),
),
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Report Summary"),
centerTitle: true,
),

body: SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Column(
children: [

buildInfoTile(
"Tester",
report.testerName,
Icons.person,
),

buildInfoTile(
"Platform",
report.platform,
Icons.phone_android,
),

buildInfoTile(
"Device",
report.deviceName,
Icons.smartphone,
),

buildInfoTile(
"OS Version",
report.osVersion,
Icons.android,
),

buildInfoTile(
"App Version",
report.appVersion,
Icons.apps,
),

buildInfoTile(
"Build Number",
report.buildNumber,
Icons.tag,
),

const SizedBox(height: 20),

Row(
children: [

buildSummaryCard(
"Passed",
report.passedCount.toString(),
Colors.green,
Icons.check_circle,
),

const SizedBox(width: 10),

buildSummaryCard(
"Failed",
report.failedCount.toString(),
Colors.red,
Icons.cancel,
),
const SizedBox(width: 10),

buildSummaryCard(
"Pending",
report.notTestedCount.toString(),
Colors.orange,
Icons.pending_actions,
),
],
),

const SizedBox(height: 12),

Row(
children: [

buildSummaryCard(
"Total",
report.totalTestcases.toString(),
Colors.blue,
Icons.assignment,
),

const SizedBox(width: 10),

buildSummaryCard(
"Bugs",
report.totalBugs.toString(),
Colors.deepPurple,
Icons.bug_report,
),
],
),

const SizedBox(height: 25),

Card(
child: ListTile(
leading: const Icon(Icons.calendar_today),
title: const Text("Testing Date"),
subtitle: Text(
"${report.testingDate.day}/${report.testingDate.month}/${report.testingDate.year}",
),
),
),

const SizedBox(height: 30),

SizedBox(
width: double.infinity,
height: 52,
child: ElevatedButton.icon(
icon: const Icon(Icons.list_alt),
label: const Text(
"View Detailed Report",
),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
ReportDetailsScreen(
report: report,
),
),
);
},
),
),

const SizedBox(height: 12),

SizedBox(
width: double.infinity,
height: 52,
child: ElevatedButton.icon(
icon: const Icon(Icons.picture_as_pdf),
label: const Text(
"Export PDF Report",
),
onPressed: () async {
await PdfService.generateReport(
report,
);
},
),
),

const SizedBox(height: 12),

SizedBox(
width: double.infinity,
height: 52,
child: OutlinedButton.icon(
icon: const Icon(Icons.share),
label: const Text(
"Share Report",
),
onPressed: () async {
final file =
await PdfService.generateReport(
report,
);

if (file != null) {
await PdfService.shareReport(
file,
);
}
},
),
),
  const SizedBox(height: 30),
],
),
),
);
}
}