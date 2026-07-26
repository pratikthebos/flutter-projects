import 'dart:convert';

import 'testcase_model.dart';

class ReportModel {
  final String id;
  final String testerName;
  final String platform;
  final String deviceName;
  final String osVersion;
  final String appVersion;
  final String buildNumber;
  final DateTime testingDate;
  final List<TestcaseModel> testcases;

  ReportModel({
    required this.id,
    required this.testerName,
    required this.platform,
    required this.deviceName,
    required this.osVersion,
    required this.appVersion,
    required this.buildNumber,
    required this.testingDate,
    required this.testcases,
  });

  int get totalTestcases => testcases.length;

  int get passedCount =>
      testcases.where((e) => e.status == "Passed").length;

  int get failedCount =>
      testcases.where((e) => e.status == "Failed").length;

  int get notTestedCount =>
      testcases.where((e) => e.status == "Not Tested").length;

  int get totalBugs =>
      testcases.where((e) => e.bug != null).length;

  ReportModel copyWith({
    String? id,
    String? testerName,
    String? platform,
    String? deviceName,
    String? osVersion,
    String? appVersion,
    String? buildNumber,
    DateTime? testingDate,
    List<TestcaseModel>? testcases,
  }) {
    return ReportModel(
      id: id ?? this.id,
      testerName: testerName ?? this.testerName,
      platform: platform ?? this.platform,
      deviceName: deviceName ?? this.deviceName,
      osVersion: osVersion ?? this.osVersion,
      appVersion: appVersion ?? this.appVersion,
      buildNumber: buildNumber ?? this.buildNumber,
      testingDate: testingDate ?? this.testingDate,
      testcases: testcases ?? this.testcases,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'testerName': testerName,
      'platform': platform,
      'deviceName': deviceName,
      'osVersion': osVersion,
      'appVersion': appVersion,
      'buildNumber': buildNumber,
      'testingDate': testingDate.toIso8601String(),
      'testcases': jsonEncode(
        testcases.map((e) => e.toMap()).toList(),
      ),
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      id: map['id'],
      testerName: map['testerName'],
      platform: map['platform'],
      deviceName: map['deviceName'],
      osVersion: map['osVersion'],
      appVersion: map['appVersion'],
      buildNumber: map['buildNumber'],
      testingDate: DateTime.parse(map['testingDate']),
      testcases: (jsonDecode(map['testcases']) as List)
          .map((e) => TestcaseModel.fromMap(
          Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}