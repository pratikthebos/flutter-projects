import '../models/api_request_model.dart';
import '../models/api_response_model.dart';
import '../models/history_model.dart';
import '../services/api_service.dart';
import '../services/history_service.dart';

class ApiRepository {
  final ApiService _apiService = ApiService();

  final HistoryService _historyService = HistoryService();

  Future<ApiResponseModel> sendRequest(
      ApiRequestModel request,
      ) async {
    final response = await _apiService.sendRequest(request);

    _historyService.addHistory(
      HistoryModel(
        method: request.method,
        endpoint: request.url,
        statusCode: response.statusCode,
        time: DateTime.now().toString(),
      ),
    );

    return response;
  }

  List<HistoryModel> getHistory() {
    return _historyService.getHistory();
  }

  void clearHistory() {
    _historyService.clearHistory();
  }
}