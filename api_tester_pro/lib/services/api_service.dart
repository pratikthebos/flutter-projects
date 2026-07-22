import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/api_request_model.dart';
import '../models/api_response_model.dart';
import '../utils/app_constants.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: Duration(
        milliseconds: AppConstants.connectTimeout,
      ),
      receiveTimeout: Duration(
        milliseconds: AppConstants.receiveTimeout,
      ),
      validateStatus: (_) => true,
    ),
  );

  Future<ApiResponseModel> sendRequest(
      ApiRequestModel request,
      ) async {
    try {
      final stopwatch = Stopwatch()..start();

      Response response;

      final headers = request.headers.trim().isEmpty
          ? <String, dynamic>{}
          : jsonDecode(request.headers);

      final body = request.body.trim().isEmpty
          ? null
          : jsonDecode(request.body);

      switch (request.method) {
        case "POST":
          response = await _dio.post(
            request.url,
            data: body,
            options: Options(headers: headers),
          );
          break;

        case "PUT":
          response = await _dio.put(
            request.url,
            data: body,
            options: Options(headers: headers),
          );
          break;

        case "PATCH":
          response = await _dio.patch(
            request.url,
            data: body,
            options: Options(headers: headers),
          );
          break;

        case "DELETE":
          response = await _dio.delete(
            request.url,
            data: body,
            options: Options(headers: headers),
          );
          break;

        default:
          response = await _dio.get(
            request.url,
            options: Options(headers: headers),
          );
      }

      stopwatch.stop();

      return ApiResponseModel(
        statusCode: response.statusCode ?? 0,
        body: const JsonEncoder.withIndent(
          "  ",
        ).convert(response.data),
        responseTime: stopwatch.elapsedMilliseconds,
        success: (response.statusCode ?? 500) < 400,
      );
    } catch (e) {
      return ApiResponseModel(
        statusCode: 500,
        body: e.toString(),
        responseTime: 0,
        success: false,
      );
    }
  }
}