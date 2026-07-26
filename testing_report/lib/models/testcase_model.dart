import 'bug_model.dart';

class TestcaseModel {
  final int id;
  final String title;
  final String status;
  final BugModel? bug;

  TestcaseModel({
    required this.id,
    required this.title,
    this.status = 'Not Tested',
    this.bug,
  });

  TestcaseModel copyWith({
    int? id,
    String? title,
    String? status,
    BugModel? bug,
  }) {
    return TestcaseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      bug: bug ?? this.bug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'bug': bug?.toMap(),
    };
  }

  factory TestcaseModel.fromMap(Map<String, dynamic> map) {
    return TestcaseModel(
      id: map['id'],
      title: map['title'],
      status: map['status'] ?? 'Not Tested',
      bug: map['bug'] != null
          ? BugModel.fromMap(Map<String, dynamic>.from(map['bug']))
          : null,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory TestcaseModel.fromJson(Map<String, dynamic> json) {
    return TestcaseModel.fromMap(json);
  }

  bool get isPassed => status == 'Passed';

  bool get isFailed => status == 'Failed';

  bool get isNotTested => status == 'Not Tested';
}