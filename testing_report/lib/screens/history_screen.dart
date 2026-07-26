import 'package:flutter/material.dart';

import '../models/report_model.dart';
import '../services/storage_service.dart';
import 'report_summary_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
List<ReportModel> reports = [];
List<ReportModel> filteredReports = [];

final TextEditingController searchController =
TextEditingController();

bool isLoading = true;

@override
void initState() {
super.initState();
loadReports();
searchController.addListener(filterReports);
}

@override
void dispose() {
searchController.dispose();
super.dispose();
}

Future<void> loadReports() async {
setState(() {
isLoading = true;
});

reports = await StorageService.getReports();
filteredReports = List.from(reports);

if (mounted) {
setState(() {
isLoading = false;
});
}
}

void filterReports() {
final query = searchController.text
.trim()
.toLowerCase();

if (query.isEmpty) {
setState(() {
filteredReports = List.from(reports);
});
return;
}

setState(() {
filteredReports = reports.where((report) {
return report.testerName
.toLowerCase()
.contains(query) ||
report.deviceName
.toLowerCase()
.contains(query) ||
report.platform
.toLowerCase()
.contains(query) ||
report.appVersion
.toLowerCase()
.contains(query);
}).toList();
});
}

Future<void> deleteReport(
ReportModel report) async {
await StorageService.deleteReport(report.id);

await loadReports();

if (!mounted) return;

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Report deleted"),
),
);
}

Color statusColor(ReportModel report) {
if (report.failedCount > 0) {
return Colors.red;
}

if (report.notTestedCount > 0) {
return Colors.orange;
}

return Colors.green;
}

String statusText(ReportModel report) {
if (report.failedCount > 0) {
return "Failed";
}

if (report.notTestedCount > 0) {
return "Pending";
}

return "Passed";
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Report History"),
centerTitle: true,
),

body: Column(
children: [

Padding(
padding: const EdgeInsets.all(16),
child: TextField(
controller: searchController,
decoration: InputDecoration(
hintText: "Search reports",
prefixIcon:
const Icon(Icons.search),
suffixIcon:
searchController.text.isEmpty
? null
: IconButton(
icon: const Icon(
Icons.clear),
onPressed: () {
searchController
.clear();
},
),
border: OutlineInputBorder(
borderRadius:
BorderRadius.circular(12),
),
),
),
),

Expanded(
child: RefreshIndicator(
onRefresh: loadReports,
child: isLoading
? const Center(
child:
CircularProgressIndicator(),
)
: filteredReports.isEmpty
? ListView(
children: const [
SizedBox(height: 120),
Icon(
Icons.history,
size: 80,
color: Colors.grey,
),
SizedBox(height: 20),
Center(
child: Text(
"No Reports Found",
style: TextStyle(
fontSize: 20,
fontWeight:
FontWeight.bold,
),
),
),
],
)
: ListView.builder(
padding:
const EdgeInsets.all(
12),
itemCount:
filteredReports.length,
itemBuilder:
(context, index) {
final report =
filteredReports[
index];

return Card(
margin:
const EdgeInsets
.only(
bottom:
12),
child: ListTile(
leading:
CircleAvatar(
backgroundColor:
statusColor(
report),
child: Text(
report
.testerName
.isEmpty
? "T"
: report
.testerName[
0]
.toUpperCase(),
style:
const TextStyle(
color: Colors
.white,
),
),
),
  title: Text(
    report.testerName,
    style: const TextStyle(
      fontWeight:
      FontWeight.bold,
    ),
  ),

  subtitle: Column(
    crossAxisAlignment:
    CrossAxisAlignment
        .start,
    children: [
      const SizedBox(
          height: 4),

      Text(
        "${report.platform} • ${report.deviceName}",
      ),

      const SizedBox(
          height: 2),

      Text(
        "App Version : ${report.appVersion}",
      ),

      const SizedBox(
          height: 2),

      Text(
        "Passed : ${report.passedCount}"
            "   Failed : ${report.failedCount}"
            "   Pending : ${report.notTestedCount}",
      ),

      const SizedBox(
          height: 2),

      Text(
        "${report.testingDate.day}/${report.testingDate.month}/${report.testingDate.year}",
        style:
        const TextStyle(
          color:
          Colors.grey,
          fontSize: 12,
        ),
      ),
    ],
  ),

  trailing:
  PopupMenuButton<
      String>(
    onSelected:
        (value) async {
      if (value ==
          "view") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                ReportSummaryScreen(
                  report:
                  report,
                ),
          ),
        );
      }

      if (value ==
          "delete") {
        final confirm =
            await showDialog<
                bool>(
              context:
              context,
              builder:
                  (_) =>
                  AlertDialog(
                    title:
                    const Text(
                      "Delete Report",
                    ),
                    content:
                    const Text(
                      "Are you sure you want to delete this report?",
                    ),
                    actions: [
                      TextButton(
                        onPressed:
                            () {
                          Navigator.pop(
                              context,
                              false);
                        },
                        child:
                        const Text(
                          "Cancel",
                        ),
                      ),
                      ElevatedButton(
                        onPressed:
                            () {
                          Navigator.pop(
                              context,
                              true);
                        },
                        child:
                        const Text(
                          "Delete",
                        ),
                      ),
                    ],
                  ),
            ) ??
                false;

        if (confirm) {
          await deleteReport(
              report);
        }
      }
    },
    itemBuilder:
        (context) =>
    const [
      PopupMenuItem(
        value: "view",
        child: Text(
            "View"),
      ),
      PopupMenuItem(
        value:
        "delete",
        child: Text(
            "Delete"),
      ),
    ],
  ),

  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ReportSummaryScreen(
              report:
              report,
            ),
      ),
    );
  },
),
);
},
),
),
),
],
),

  floatingActionButton:
  reports.isNotEmpty
      ? FloatingActionButton.extended(
    onPressed: () async {
      final confirm =
          await showDialog<bool>(
            context: context,
            builder: (_) =>
                AlertDialog(
                  title:
                  const Text(
                    "Clear All Reports",
                  ),
                  content:
                  const Text(
                    "Delete all saved reports?",
                  ),
                  actions: [
                    TextButton(
                      onPressed:
                          () {
                        Navigator.pop(
                            context,
                            false);
                      },
                      child:
                      const Text(
                        "Cancel",
                      ),
                    ),
                    ElevatedButton(
                      onPressed:
                          () {
                        Navigator.pop(
                            context,
                            true);
                      },
                      child:
                      const Text(
                        "Delete",
                      ),
                    ),
                  ],
                ),
          ) ??
              false;

      if (!confirm) return;

      await StorageService
          .clearReports();

      await loadReports();

      if (!mounted) return;

      ScaffoldMessenger.of(
          context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "All reports deleted successfully.",
          ),
        ),
      );
    },
    icon: const Icon(
        Icons.delete_sweep),
    label:
    const Text("Clear All"),
  )
      : null,
);
}
}