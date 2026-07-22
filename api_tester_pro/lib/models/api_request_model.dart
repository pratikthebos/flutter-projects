class ApiRequestModel {
  final String url;
  final String method;
  final String headers;
  final String body;

  ApiRequestModel({
    required this.url,
    required this.method,
    required this.headers,
    required this.body,
  });

  ApiRequestModel copyWith({
    String? url,
    String? method,
    String? headers,
    String? body,
  }) {
    return ApiRequestModel(
      url: url ?? this.url,
      method: method ?? this.method,
      headers: headers ?? this.headers,
      body: body ?? this.body,
    );
  }
}