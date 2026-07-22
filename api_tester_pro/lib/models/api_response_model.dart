class ApiResponseModel {
  final int statusCode;
  final String body;
  final int responseTime;
  final bool success;

  ApiResponseModel({
    required this.statusCode,
    required this.body,
    required this.responseTime,
    required this.success,
  });
}