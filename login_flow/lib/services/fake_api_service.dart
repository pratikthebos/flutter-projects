import '../models/request_model.dart';
import '../models/response_model.dart';
import '../models/user_model.dart';

import 'fake_database_service.dart';
import 'jwt_service.dart';

class FakeApiService {
  final FakeDatabaseService database =
  FakeDatabaseService();

  final JwtService jwtService = JwtService();

  Future<ResponseModel> login(
      RequestModel request,
      ) async {
    // Simulate Internet Delay

    await Future.delayed(
      const Duration(seconds: 2),
    );

    UserModel? user = await database.verifyUser(
      request.username,
      request.password,
    );

    if (user == null) {
      throw Exception("Invalid Username or Password");
    }

    final jwt = await jwtService.generateToken();

    final updatedUser = UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
      role: user.role,
      department: user.department,
      token: jwt.token,
    );

    return ResponseModel(
      success: true,
      statusCode: 200,
      message: "Login Successful",
      user: updatedUser,
    );
  }
}