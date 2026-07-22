import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/routes.dart';
import '../models/api_request_model.dart';
import '../models/history_model.dart';
import '../repositories/api_repository.dart';
import 'response_viewmodel.dart';

class ApiViewModel extends ChangeNotifier {
  final ApiRepository _repository = ApiRepository();

  final urlController = TextEditingController();
  final headerController = TextEditingController();
  final bodyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String selectedMethod = "GET";

  bool isLoading = false;

  List<HistoryModel> history = [];

  /// Constructor
  ApiViewModel() {
    _loadDefaultData();
  }

  /// Default API Data
  void _loadDefaultData() {
    urlController.text =
    "https://jsonplaceholder.typicode.com/posts";

    headerController.text = '''
{
  "Content-Type": "application/json"
}
''';

    bodyController.text = '''
{
  "title": "Flutter API Tester",
  "body": "This request is sent from API Tester Pro",
  "userId": 1
}
''';
  }

  void changeMethod(String value) {
    selectedMethod = value;
    notifyListeners();
  }

  Future<void> sendRequest(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();

    final request = ApiRequestModel(
      url: urlController.text.trim(),
      method: selectedMethod,
      headers: headerController.text.trim(),
      body: bodyController.text.trim(),
    );

    final response = await _repository.sendRequest(request);

    history = _repository.getHistory();

    isLoading = false;
    notifyListeners();

    final responseVM = context.read<ResponseViewModel>();
    responseVM.setResponse(response);

    Navigator.pushNamed(
      context,
      AppRoutes.response,
    );
  }

  /// Reset to default values
  void clear() {
    selectedMethod = "GET";
    _loadDefaultData();
    notifyListeners();
  }

  @override
  void dispose() {
    urlController.dispose();
    headerController.dispose();
    bodyController.dispose();
    super.dispose();
  }
}