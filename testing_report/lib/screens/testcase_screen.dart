import 'package:flutter/material.dart';

import '../models/bug_model.dart';
import '../models/report_model.dart';
import '../models/testcase_model.dart';
import '../repositories/report_repository.dart';
import 'report_summary_screen.dart';

class TestcaseScreen extends StatefulWidget {
  final ReportModel report;

  const TestcaseScreen({
    super.key,
    required this.report,
  });

  @override
  State<TestcaseScreen> createState() => _TestcaseScreenState();
}

class _TestcaseScreenState extends State<TestcaseScreen> {
  late List<TestcaseModel> testcases;

  final Map<int, TextEditingController> bugIdControllers = {};
  final Map<int, TextEditingController> remarksControllers = {};
  final Map<int, String> severityMap = {};

  bool isSaving = false;

  @override
  void initState() {
    super.initState();

    testcases = List<TestcaseModel>.from(widget.report.testcases);

    for (final testcase in testcases) {
      bugIdControllers[testcase.id] = TextEditingController(
        text: testcase.bug?.title  ?? '',
      );

      remarksControllers[testcase.id] = TextEditingController(
        text: testcase.bug?.description  ?? '',
      );

      severityMap[testcase.id] =
          testcase.bug?.severity ?? 'Medium';
    }
  }

  @override
  void dispose() {
    for (final controller in bugIdControllers.values) {
      controller.dispose();
    }

    for (final controller in remarksControllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  void updateStatus(int index,
      String status,) {
    final current = testcases[index];

    BugModel? bug;

    if (status == 'Failed') {
      bug = BugModel(
        title : bugIdControllers[current.id]!.text.trim(),
        severity: severityMap[current.id] ?? 'Medium',
        description : remarksControllers[current.id]!.text.trim(),
        priority: 'Medium',
      );
    }

    setState(() {
      testcases[index] = current.copyWith(
        status: status,
        bug: bug,
      );
    });
  }

  Widget buildStatusRadio({
    required int index,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: RadioListTile<String>(
        dense: true,
        activeColor: color,
        title: Text(value),
        value: value,
        groupValue: testcases[index].status,
        onChanged: (_) {
          updateStatus(index, value);
        },
      ),
    );
  }

  Widget buildBugSection(int index) {
    final testcase = testcases[index];

    if (testcase.status != "Failed") {
      return const SizedBox.shrink();
    }

    return Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.red.shade200,
          ),
        ),
        child: Column(
          children: [
        TextField(
        controller: bugIdControllers[testcase.id],
          decoration: const InputDecoration(
            labelText: 'Bug ID',
            border: OutlineInputBorder(),
          ),
          onChanged: (_) {
            updateStatus(index, 'Failed');
          },
        ),

        const SizedBox(height: 12),

        DropdownButtonFormField<String>(
          value: severityMap[testcase.id],
          decoration: const InputDecoration(
            labelText: 'Severity',
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(
              value: 'Critical',
              child: Text('Critical'),
            ),
            DropdownMenuItem(
              value: 'High',
              child: Text('High'),
            ),
            DropdownMenuItem(
              value: 'Medium',
              child: Text('Medium'),
            ),
            DropdownMenuItem(
              value: 'Low',
              child: Text('Low'),
            ),
          ],
          onChanged: (value) {
            if (value == null) return;

            setState(() {
              severityMap[testcase.id] = value;
            });

            updateStatus(index, 'Failed');
          },
        ),
        const SizedBox(height: 12),

    TextField(
    controller: remarksControllers[testcase.id],
    maxLines: 3,
    decoration: const InputDecoration(
    labelText: 'Remarks',
    hintText: 'Enter bug description...',
    border: OutlineInputBorder(),
    ),
    onChanged: (_) {
    updateStatus(index, 'Failed');
    },
    ),
    ],
    ),
    );
    }

  Future<void> saveReport() async {
    setState(() {
      isSaving = true;
    });

    final report = widget.report.copyWith(
      testcases: testcases,
    );

    await ReportRepository.instance.saveReport(report);

    if (!mounted) return;

    setState(() {
      isSaving = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ReportSummaryScreen(
              report: report,
            ),
      ),
    );
  }

  int get passedCount =>
      testcases
          .where((e) => e.status == "Passed")
          .length;

  int get failedCount =>
      testcases
          .where((e) => e.status == "Failed")
          .length;

  int get notTestedCount =>
      testcases
          .where((e) => e.status == "Not Tested")
          .length;

  void resetAll() {
    setState(() {
      for (int i = 0; i < testcases.length; i++) {
        final current = testcases[i];

        bugIdControllers[current.id]!.clear();
        remarksControllers[current.id]!.clear();
        severityMap[current.id] = "Medium";

        testcases[i] = current.copyWith(
          status: "Not Tested",
          bug: null,
        );
      }
    });
  }

  void markAllPassed() {
    setState(() {
      for (int i = 0; i < testcases.length; i++) {
        final current = testcases[i];

        bugIdControllers[current.id]!.clear();
        remarksControllers[current.id]!.clear();
        severityMap[current.id] = "Medium";

        testcases[i] = current.copyWith(
          status: "Passed",
          bug: null,
        );
      }
    });
  }

  Future<bool> onBackPressed() async {
    if (isSaving) {
      return false;
    }

    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: const Text("Discard Report?"),
            content: const Text(
              "All unsaved changes will be lost.",
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
                child: const Text("Discard"),
              ),
            ],
          ),
    ) ??
        false;

    return shouldLeave;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PE Test Cases"),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == "passed") {
                  markAllPassed();
                } else if (value == "reset") {
                  resetAll();
                }
              },
              itemBuilder: (_) =>
              const [
                PopupMenuItem(
                  value: "passed",
                  child: Text("Mark All Passed"),
                ),
                PopupMenuItem(
                  value: "reset",
                  child: Text("Reset All"),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.report.testerName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "${widget.report.platform} • ${widget.report.deviceName}",
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "App Version : ${widget.report.appVersion}",
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Chip(
                          backgroundColor: Colors.green.shade100,
                          avatar: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          label: Text(
                            "Passed : $passedCount",
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Chip(
                          backgroundColor: Colors.red.shade100,
                          avatar: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          label: Text(
                            "Failed : $failedCount",
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Chip(
                          backgroundColor: Colors.orange.shade100,
                          avatar: const Icon(
                            Icons.pending_actions,
                            color: Colors.orange,
                          ),
                          label: Text(
                            "Pending : $notTestedCount",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: testcases.length,
                itemBuilder: (context, index) {
                  final testcase = testcases[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${testcase.id}. ${testcase.title}",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [
                              buildStatusRadio(
                                index: index,
                                value: "Passed",
                                color: Colors.green,
                              ),

                              buildStatusRadio(
                                index: index,
                                value: "Failed",
                                color: Colors.red,
                              ),

                              buildStatusRadio(
                                index: index,
                                value: "Not Tested",
                                color: Colors.orange,
                              ),
                            ],
                          ),

                          buildBugSection(index),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: isSaving
                        ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : const Icon(Icons.save),

                    label: Text(
                      isSaving
                          ? "Saving Report..."
                          : "Save Report",
                    ),

                    onPressed: isSaving
                        ? null
                        : () async {
                      bool hasValidationError = false;

                      for (final tc in testcases) {
                        if (tc.status == "Failed") {
                          final bugId =
                          bugIdControllers[tc.id]!
                              .text
                              .trim();

                          final remarks =
                          remarksControllers[tc.id]!
                              .text
                              .trim();

                          if (bugId.isEmpty ||
                              remarks.isEmpty) {
                            hasValidationError = true;
                            break;
                          }
                        }
                      }

                      if (hasValidationError) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please enter Bug ID and Remarks for all failed test cases.",
                            ),
                          ),
                        );
                        return;
                      }

                      await saveReport();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}