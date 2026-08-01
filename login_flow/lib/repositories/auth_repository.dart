import '../models/request_model.dart';
import '../models/response_model.dart';

import '../services/fake_api_service.dart';

class AuthRepository {
  final FakeApiService api =
  FakeApiService();

  Future<ResponseModel> login({

    required String username,

    required String password,

  }) async {

    final request = RequestModel(

      username: username,

      password: password,

    );

    return await api.login(request);

  }
}