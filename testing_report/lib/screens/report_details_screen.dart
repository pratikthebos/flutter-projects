import 'package:flutter/material.dart';

import '../models/bug_model.dart';
import '../models/report_model.dart';
import '../models/testcase_model.dart';

class ReportDetailsScreen extends StatelessWidget {
final ReportModel report;

const ReportDetailsScreen({
super.key,
required this.report,
});

Color statusColor(String status) {
switch (status) {
case "Passed":
return Colors.green;

case "Failed":
return Colors.red;

default:
return Colors.orange;
}
}

IconData statusIcon(String status) {
switch (status) {
case "Passed":
return Icons.check_circle;

case "Failed":
return Icons.cancel;

default:
return Icons.pending_actions;
}
}

Widget buildSummaryCard({
required String title,
required String value,
required Color color,
required IconData icon,
}) {
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
size: 30,
),
const SizedBox(height: 10),
Text(
value,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 22,
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

Widget buildBugCard(BugModel bug) {
return Card(
color: Colors.red.shade50,
margin: const EdgeInsets.only(
top: 10,
),
child: Padding(
padding: const EdgeInsets.all(12),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Text(
bug.title,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16,
),
),

const SizedBox(height: 8),

Text(bug.description),

const SizedBox(height: 10),

Row(
children: [
Chip(
label: Text(
bug.severity,
),
),

const SizedBox(width: 10),

Chip(
label: Text(
bug.priority,
),
),
],
),
],
),
),
);
}

Widget buildTestcaseCard(
TestcaseModel testcase) {
return Card(
margin: const EdgeInsets.only(
bottom: 12,
),
child: ExpansionTile(
leading: Icon(
statusIcon(testcase.status),
color: statusColor(
testcase.status,
),
),
title: Text(
testcase.title,
style: const TextStyle(
fontWeight: FontWeight.w600,
),
),
subtitle: Text(
testcase.status,
style: TextStyle(
color: statusColor(
testcase.status,
),
fontWeight: FontWeight.bold,
),
),
children: [
Padding(
padding: const EdgeInsets.symmetric(
horizontal: 16,
vertical: 8,
),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Row(
children: [
const Text(
"Status : ",
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
Text(
testcase.status,
style: TextStyle(
color: statusColor(
testcase.status,
),
fontWeight: FontWeight.bold,
),
),
],
),

if (testcase.bug != null)
buildBugCard(testcase.bug!),
],
),
),
],
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Detailed Report"),
centerTitle: true,
),

body: Column(
children: [

Padding(
padding: const EdgeInsets.all(16),
child: Row(
children: [

buildSummaryCard(
title: "Passed",
value: report.passedCount.toString(),
color: Colors.green,
icon: Icons.check_circle,
),

const SizedBox(width: 10),

buildSummaryCard(
title: "Failed",
value: report.failedCount.toString(),
color: Colors.red,
icon: Icons.cancel,
),

const SizedBox(width: 10),

buildSummaryCard(
title: "Pending",
value:
report.notTestedCount.toString(),
color: Colors.orange,
icon: Icons.pending_actions,
),
],
),
),

Expanded(
child: ListView.builder(
padding: const EdgeInsets.symmetric(
horizontal: 16,
),
itemCount: report.testcases.length,
itemBuilder: (context, index) {
final testcase =
report.testcases[index];

return buildTestcaseCard(
testcase,
);
},
),
),
  ]
  ),
  );
}
}