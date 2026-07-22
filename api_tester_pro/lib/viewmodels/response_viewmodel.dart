import 'package:flutter/material.dart';

import '../models/api_response_model.dart';

class ResponseViewModel extends ChangeNotifier {
  ApiResponseModel? _response;

  ApiResponseModel? get response => _response;

  void setResponse(ApiResponseModel value) {
    _response = value;
    notifyListeners();
  }

  void clear() {
    _response = null;
    notifyListeners();
  }
}