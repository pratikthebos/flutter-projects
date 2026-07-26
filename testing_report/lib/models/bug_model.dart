class BugModel {
  final String title;
  final String description;
  final String severity;
  final String priority;
  final String? screenshotPath;

  const BugModel({
    required this.title,
    required this.description,
    required this.severity,
    required this.priority,
    this.screenshotPath,
  });

  BugModel copyWith({
    String? title,
    String? description,
    String? severity,
    String? priority,
    String? screenshotPath,
  }) {
    return BugModel(
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      priority: priority ?? this.priority,
      screenshotPath: screenshotPath ?? this.screenshotPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'severity': severity,
      'priority': priority,
      'screenshotPath': screenshotPath,
    };
  }

  factory BugModel.fromMap(Map<String, dynamic> map) {
    return BugModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      severity: map['severity'] ?? 'Medium',
      priority: map['priority'] ?? 'Medium',
      screenshotPath: map['screenshotPath'],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory BugModel.fromJson(Map<String, dynamic> json) {
    return BugModel.fromMap(json);
  }

  @override
  String toString() {
    return 'BugModel('
        'title: $title, '
        'description: $description, '
        'severity: $severity, '
        'priority: $priority, '
        'screenshotPath: $screenshotPath'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BugModel &&
        other.title == title &&
        other.description == description &&
        other.severity == severity &&
        other.priority == priority &&
        other.screenshotPath == screenshotPath;
  }

  @override
  int get hashCode {
    return Object.hash(
      title,
      description,
      severity,
      priority,
      screenshotPath,
    );
  }
}