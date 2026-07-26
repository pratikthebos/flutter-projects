import 'package:flutter/material.dart';

import '../data/pe_testcases.dart';
import '../models/report_model.dart';
import '../models/testcase_model.dart';
import 'testcase_screen.dart';

class CreateReportScreen extends StatefulWidget {
  const CreateReportScreen({super.key});

  @override
  State<CreateReportScreen> createState() =>
      _CreateReportScreenState();
}

class _CreateReportScreenState
    extends State<CreateReportScreen> {
  final _formKey = GlobalKey<FormState>();

  final testerController = TextEditingController();
  final platformController =
  TextEditingController(text: "Android");
  final deviceController =
  TextEditingController();
  final osController =
  TextEditingController();
  final appVersionController =
  TextEditingController();
  final buildNumberController =
  TextEditingController();

  @override
  void dispose() {
    testerController.dispose();
    platformController.dispose();
    deviceController.dispose();
    osController.dispose();
    appVersionController.dispose();
    buildNumberController.dispose();

    super.dispose();
  }

  List<TestcaseModel> createTestcases() {
    return PeTestcaseData.getDefaultTestcases();
  }

  void startTesting() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final report = ReportModel(
      id: DateTime
          .now()
          .millisecondsSinceEpoch.toString(),
      testerName: testerController.text.trim(),
      platform: platformController.text.trim(),
      deviceName: deviceController.text.trim(),
      osVersion: osController.text.trim(),
      appVersion: appVersionController.text.trim(),
      buildNumber: buildNumberController.text.trim(),
      testingDate: DateTime.now(),
      testcases: createTestcases(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            TestcaseScreen(
              report: report,
            ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType =
        TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value == null ||
              value
                  .trim()
                  .isEmpty) {
            return "$label is required";
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Report"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              const Text(
                "Tester Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              buildTextField(
                controller: testerController,
                label: "Tester Name",
              ),

              buildTextField(
                controller: platformController,
                label: "Platform",
              ),

              buildTextField(
                controller: deviceController,
                label: "Device Name",
              ),

              buildTextField(
                controller: osController,
                label: "OS Version",
              ),

              buildTextField(
                controller: appVersionController,
                label: "App Version",
              ),

              buildTextField(
                controller: buildNumberController,
                label: "Build Number",
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [

                      Row(
                        children: [

                          const Icon(
                            Icons.assignment,
                            color: Colors.blue,
                          ),

                          const SizedBox(width: 10),

                          const Text(
                            "Test Summary",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 24),

                      Row(
                        children: [

                          const Expanded(
                            child: Text(
                              "Total Test Cases",
                            ),
                          ),

                          Text(
                            PeTestcaseData.totalTestcases.toString(),
                            style: const TextStyle(
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Default Status",
                            ),
                          ),

                          Text(
                            "Not Tested",
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Testing Date",
                            ),
                          ),

                          Text(
                            "${DateTime
                                .now()
                                .day}/${DateTime
                                .now()
                                .month}/${DateTime
                                .now()
                                .year}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow),
                  label: const Text(
                    "Start Testing",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: startTesting,
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    "Reset Form",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    testerController.clear();
                    platformController.text = "Android";
                    deviceController.clear();
                    osController.clear();
                    appVersionController.clear();
                    buildNumberController.clear();

                    _formKey.currentState?.reset();

                    setState(() {});
                  },
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void clearForm() {
    testerController.clear();
    platformController.text = "Android";
    deviceController.clear();
    osController.clear();
    appVersionController.clear();
    buildNumberController.clear();

    if (mounted) {
      setState(() {});
    }
  }

  Future<bool> onBackPressed() async {
    final hasData =
        testerController.text.isNotEmpty ||
            deviceController.text.isNotEmpty ||
            osController.text.isNotEmpty ||
            appVersionController.text.isNotEmpty ||
            buildNumberController.text.isNotEmpty;

    if (!hasData) {
      return true;
    }

    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: const Text("Discard Report?"),
            content: const Text(
              "All entered information will be lost. Do you want to leave?",
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
}