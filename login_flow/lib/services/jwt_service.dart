import '../models/jwt_model.dart';

class JwtService {
  Future<JwtModel> generateToken() async {
    // Simulate JWT generation

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return JwtModel.demo();
  }
}