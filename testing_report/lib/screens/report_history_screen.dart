import 'package:flutter/material.dart';

import '../models/report_model.dart';
import '../repositories/report_repository.dart';
import 'report_details_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController searchController =
  TextEditingController();

  List<ReportModel> reports = [];
  List<ReportModel> filteredReports = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadReports();
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

    reports = await ReportRepository.instance.getReports();

    filteredReports = List.from(reports);

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  void searchReports(String value) {
    final query = value.trim().toLowerCase();

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
            report.platform
                .toLowerCase()
                .contains(query) ||
            report.deviceName
                .toLowerCase()
                .contains(query) ||
            report.appVersion
                .toLowerCase()
                .contains(query);
      }).toList();
    });
  }

  Future<void> deleteReport(ReportModel report,) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: const Text(
              "Delete Report",
            ),
            content: const Text(
              "Are you sure you want to delete this report?",
            ),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pop(context, true),
                child: const Text("Delete"),
              ),
            ],
          ),
    ) ??
        false;

    if (!confirm) return;

    await ReportRepository.instance.deleteReport(
      report.id,
    );

    await loadReports();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Report deleted successfully.",
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: searchController,
        onChanged: searchReports,
        decoration: InputDecoration(
          hintText: "Search reports...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              searchController.clear();
              searchReports("");
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget buildReportCard(ReportModel report,) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  ReportDetailsScreen(
                    report: report,
                  ),
            ),
          );

          await loadReports();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.assignment),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          report.testerName,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "${report.platform} • ${report.deviceName}",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == "delete") {
                        await deleteReport(report);
                      }
                    },
                    itemBuilder: (_) =>
                    const [
                      PopupMenuItem(
                        value: "delete",
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            Text("Delete"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(height: 24),

              Row(
                children: [
                  const Icon(
                    Icons.phone_android,
                    size: 18,
                    color: Colors.blue,
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      report.appVersion,
                    ),
                  ),

                  Text(
                    report.buildNumber,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: Chip(
                      avatar: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 18,
                      ),
                      label: Text(
                        "Passed ${report.passedCount}",
                      ),
                      backgroundColor:
                      Colors.green.shade100,
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Chip(
                      avatar: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 18,
                      ),
                      label: Text(
                        "Failed ${report.failedCount}",
                      ),
                      backgroundColor:
                      Colors.red.shade100,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: Chip(
                      avatar: const Icon(
                        Icons.pending_actions,
                        color: Colors.orange,
                        size: 18,
                      ),
                      label: Text(
                        "Pending ${report.notTestedCount}",
                      ),
                      backgroundColor:
                      Colors.orange.shade100,
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Chip(
                      avatar: const Icon(
                        Icons.bug_report,
                        color: Colors.deepPurple,
                        size: 18,
                      ),
                      label: Text(
                        "Bugs ${report.totalBugs}",
                      ),
                      backgroundColor:
                      Colors.deepPurple.shade100,
                    ),
                  ),
                ],
              ),
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
        title: const Text("History"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: loadReports,
        child: Column(
          children: [
            buildSearchBar(),

            Expanded(
              child: isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : filteredReports.isEmpty
                  ? ListView(
                physics:
                const AlwaysScrollableScrollPhysics(),
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
                      "No reports found",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      "Create your first test report to see it here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              )
                  : ListView.builder(
                physics:
                const AlwaysScrollableScrollPhysics(),
                itemCount: filteredReports.length,
                itemBuilder: (context, index) {
                  return buildReportCard(
                    filteredReports[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Refresh",
        onPressed: loadReports,
        child: const Icon(Icons.refresh),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Reports",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${filteredReports.length}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: loadReports,
                icon: const Icon(Icons.refresh),
                label: const Text("Refresh"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}