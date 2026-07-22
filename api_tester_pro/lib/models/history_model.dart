class HistoryModel {
  final String method;
  final String endpoint;
  final int statusCode;
  final String time;

  HistoryModel({
    required this.method,
    required this.endpoint,
    required this.statusCode,
    required this.time,
  });
}